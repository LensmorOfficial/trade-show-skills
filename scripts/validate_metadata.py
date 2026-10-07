#!/usr/bin/env python3
"""Validate loadable frontmatter and local Markdown references without API calls."""

import argparse
import re
import sys
from pathlib import Path
from urllib.parse import unquote, urlsplit

try:
    import yaml
except ImportError:
    sys.exit("PyYAML is required: python3 -m pip install -r scripts/requirements.txt")


class UniqueLoader(yaml.SafeLoader):
    """Reject duplicate mapping keys rather than silently taking the last value."""


def unique_mapping(loader, node, deep=False):
    result = {}
    for key_node, value_node in node.value:
        key = loader.construct_object(key_node, deep=deep)
        if key in result:
            raise ValueError(f"duplicate frontmatter key: {key}")
        result[key] = loader.construct_object(value_node, deep=deep)
    return result


UniqueLoader.add_constructor(yaml.resolver.BaseResolver.DEFAULT_MAPPING_TAG, unique_mapping)

REQUIRED_FIELDS = {"name", "description", "metadata"}
FIELDS = REQUIRED_FIELDS | {"license", "compatibility", "allowed-tools"}
STAGES = {"pre-show", "on-site", "post-show"}
CATEGORIES = {
    "research", "planning", "outreach", "lead-qualification",
    "competitive-intelligence", "follow-up",
}


def parse_frontmatter(text):
    lines = text.splitlines()
    if not lines or lines[0] != "---":
        raise ValueError("SKILL.md must start with YAML frontmatter")
    try:
        end = lines.index("---", 1)
    except ValueError:
        raise ValueError("frontmatter closing delimiter is missing") from None
    raw = "\n".join(lines[1:end])
    try:
        data = yaml.load(raw, Loader=UniqueLoader)
    except yaml.YAMLError as exc:
        raise ValueError(f"invalid YAML frontmatter: {exc}") from exc
    if not isinstance(data, dict):
        raise ValueError("frontmatter must be a mapping")
    if not REQUIRED_FIELDS <= set(data) or not set(data) <= FIELDS:
        raise ValueError(f"missing fields {sorted(REQUIRED_FIELDS - set(data))}; unsupported fields {sorted(set(data) - FIELDS)}")
    metadata = data["metadata"]
    if not isinstance(metadata, dict) or not all(isinstance(k, str) and isinstance(v, str) for k, v in metadata.items()):
        raise ValueError("metadata must map string keys to string values")
    return data


def validate_skill(path):
    data = parse_frontmatter(path.read_text(encoding="utf-8"))
    name = data["name"]
    if not isinstance(name, str) or len(name) > 64 or not re.fullmatch(r"[a-z0-9]+(?:-[a-z0-9]+)*", name) or name != path.parent.name:
        raise ValueError("name must match the lowercase hyphenated directory name")
    metadata = data["metadata"]
    if not re.fullmatch(r"\d+\.\d+\.\d+", metadata.get("version", "")):
        raise ValueError("metadata.version must be a three-part version string")
    description = data["description"]
    if not isinstance(description, str) or not description.strip() or len(description) > 200:
        raise ValueError("description must be nonempty and at most 200 characters; move example requests into the body")
    expected = f"https://github.com/LensmorOfficial/trade-show-skills/tree/main/{name}"
    if metadata.get("homepage") != expected:
        raise ValueError("metadata.homepage must point to this skill's GitHub directory")
    if metadata.get("stage") not in STAGES or metadata.get("category") not in CATEGORIES:
        raise ValueError("invalid stage or category")
    for field in ("license", "allowed-tools"):
        if field in data and (not isinstance(data[field], str) or not data[field].strip()):
            raise ValueError(f"{field} must be a nonempty string")
    compatibility = data.get("compatibility")
    if compatibility is not None and (not isinstance(compatibility, str) or not compatibility.strip() or len(compatibility) > 500):
        raise ValueError("compatibility must be a nonempty string of at most 500 characters")
    if "https://platform.lensmor.com/external/" in path.read_text(encoding="utf-8"):
        if metadata.get("required-env") != "LENSMOR_API_KEY" or metadata.get("requires-network") != "https://platform.lensmor.com":
            raise ValueError("API-backed skills must declare LENSMOR_API_KEY in metadata.required-env and the Lensmor host in metadata.requires-network")
    return data


def local_link_errors(root):
    errors = []
    for path in sorted(root.rglob("*.md")):
        if any(part.startswith(".") for part in path.relative_to(root).parts):
            continue
        # Ignore literal templates in fenced code and inline code.
        text = re.sub(r"(?ms)^(```|~~~).*?^\1[^\n]*$", "", path.read_text(encoding="utf-8"))
        text = re.sub(r"`[^`\n]*`", "", text)
        for target in re.findall(r"\[[^\]\n]*\]\(([^\s)]+)(?:\s+\"[^\"]*\")?\)", text):
            target = target.strip("<>")
            parts = urlsplit(target)
            if parts.scheme or target.startswith(("#", "//")):
                continue
            destination = (path.parent / unquote(parts.path)).resolve()
            if not destination.exists():
                errors.append(f"{path.relative_to(root)}: missing local link {target}")
    return errors


def validate_repository(root):
    errors = []
    paths = sorted(root.glob("*/SKILL.md"))
    if not paths:
        errors.append("no skill directories found")
    for path in paths:
        try:
            validate_skill(path)
        except (ValueError, yaml.YAMLError, TypeError) as exc:
            errors.append(f"{path.parent.name}: {exc}")
    errors.extend(local_link_errors(root))
    return paths, errors


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--root", type=Path, default=Path(__file__).resolve().parents[1])
    args = parser.parse_args()
    paths, errors = validate_repository(args.root.resolve())
    for error in errors:
        print(f"[FAIL] {error}", file=sys.stderr)
    if errors:
        return 1
    print(f"[PASS] Parsed metadata for {len(paths)} skills and checked local Markdown links (no live requests)")
    return 0


if __name__ == "__main__":
    sys.exit(main())

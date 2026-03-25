#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

pass() {
  echo "[PASS] $1"
}

fail() {
  echo "[FAIL] $1" >&2
  exit 1
}

SKILL_FILES=()
while IFS= read -r skill_file; do
  SKILL_FILES+=("$skill_file")
done < <(find . -maxdepth 2 -name 'SKILL.md' | sort)
[[ ${#SKILL_FILES[@]} -gt 0 ]] || fail "No SKILL.md files found."
pass "Found ${#SKILL_FILES[@]} skills"

for skill_file in "${SKILL_FILES[@]}"; do
  skill_dir="$(dirname "$skill_file")"
  skill_name="$(basename "$skill_dir")"

  [[ -f "$skill_dir/README.md" ]] || fail "$skill_name is missing README.md"
  [[ -d "$skill_dir/examples" ]] || fail "$skill_name is missing examples/"
  find "$skill_dir/examples" -maxdepth 1 -type f | grep -q . || fail "$skill_name examples/ is empty"

  rg -q '^name:' "$skill_file" || fail "$skill_name is missing name:"
  rg -q '^version:' "$skill_file" || fail "$skill_name is missing version:"
  rg -q '^description:' "$skill_file" || fail "$skill_name is missing description:"
  rg -q '^homepage:' "$skill_file" || fail "$skill_name is missing homepage:"
  rg -q '^user-invocable:' "$skill_file" || fail "$skill_name is missing user-invocable:"
  rg -q '^metadata: \{' "$skill_file" || fail "$skill_name is missing single-line metadata JSON"

  stage="$(rg -o '"stage":"[^"]+"' "$skill_file" | sed 's/.*"stage":"//; s/"$//')"
  [[ -n "$stage" ]] || fail "$skill_name is missing stage metadata"

  case "$stage" in
    pre-show) stage_doc="docs/pre-show.md" ;;
    on-site) stage_doc="docs/on-site.md" ;;
    post-show) stage_doc="docs/post-show.md" ;;
    *) fail "$skill_name has unknown stage: $stage" ;;
  esac

  rg -q "$skill_name" README.md || fail "$skill_name is missing from root README"
  rg -q "$skill_name" "$stage_doc" || fail "$skill_name is missing from $stage_doc"
done
pass "Skill structure, examples, and frontmatter look healthy"

if find . -name 'README.zh.md' | grep -q .; then
  fail "English-only repo policy violated: README.zh.md files found"
fi
pass "English-only repo policy respected"

if rg -n '\bClaude Code\b|\bClaude\b|claude install-skill' . --type md \
  -g '!CHANGELOG.md' \
  -g '!CONTRIBUTING.md' \
  -g '!docs/skill-quality-checklist.md' \
  >/tmp/trade-show-skills-claude-check.txt; then
  cat /tmp/trade-show-skills-claude-check.txt >&2
  fail "Residual Claude wording found"
fi
pass "No residual Claude wording"

pass "Repo validation completed successfully"

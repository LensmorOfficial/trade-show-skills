# Contributing to trade-show-skills

## Scope

This repo is a collection of [Agent Skills](https://agentskills.io/specification) workflows for trade show planning, on-site execution, and post-show follow-up.

**What belongs here:**
- `SKILL.md` portable workflow definitions for AI agents
- Markdown documentation (README, examples, guides)
- Fictional worked examples that illustrate real usage patterns

**What doesn't belong here:**
- Frontend apps or HTML tools (those live in [trade-show-tools](https://github.com/LensmorOfficial/trade-show-tools))
- npm packages, build systems, or compiled assets
- Backend code or API integrations
- Client-specific setup that replaces the portable skill entrypoint

---

## Repo Structure

```
trade-show-skills/
  <skill-name>/
    SKILL.md          ← required: Agent Skills definition
    README.md         ← required: English documentation
    examples/         ← required: at least one worked example
    references/       ← optional: helper framework, scoring rubric, seed list
  docs/               ← cross-skill guides and reference docs
  scripts/            ← repo validation helpers
  README.md           ← root index
```

Each skill is self-contained. A skill directory should make sense on its own when copied to a supported skill-discovery directory.

---

## Agent Skills Conventions

Follow the [Agent Skills specification](https://agentskills.io/specification). This repository requires identity, a concise discovery description, and flat string metadata:

```yaml
---
name: skill-name
description: Evaluate trade show fit for a supplied ICP and goal.
license: MIT
metadata:
  version: "1.0.0"
  stage: pre-show
  category: research
  homepage: https://github.com/LensmorOfficial/trade-show-skills/tree/main/skill-name
---
```

- `name` matches the skill directory and uses lowercase letters, digits, and single hyphens; maximum 64 characters.
- Keep `description` useful for discovery and at most 200 characters, a repository limit stricter than the specification's 1024 characters. Put example prompts in the body.
- Metadata keys and values are strings. Put repository version, homepage, stage, and category here; avoid nested runtime-specific objects.
- Use semantic versions in `metadata.version`. Bump the minor version for a packaging migration and the patch version for compatible workflow fixes.
- API-backed skills include `metadata.required-env: LENSMOR_API_KEY` and `metadata.requires-network: https://platform.lensmor.com`. These fields describe prerequisites; each workflow must check the environment itself.
- Supported optional top-level fields are `license`, `compatibility`, and `allowed-tools`. Tool authorization varies by client; do not add tool restrictions or invocation policies without a concrete need.
- Skill discovery and explicit invocation are client responsibilities. Document actual tool needs without claiming every client will auto-activate the skill.

---

## Stage and Category Taxonomy

Current stages:

| Stage | When | Examples |
|-------|------|---------|
| `pre-show` | 8–12 weeks before the show | research, budget planning, outreach |
| `on-site` | During the show | lead qualification, competitive intel |
| `post-show` | Within days of show close | follow-up sequences, lead triage |

Category is a finer classification within a stage. Current categories: `research`, `planning`, `outreach`, `lead-qualification`, `competitive-intelligence`, `follow-up`.

When adding a skill, pick the stage that reflects **when it is used**, not what data it touches. A skill that analyzes competitor data to plan outreach before the show is `pre-show`, not `competitive-intelligence` at `on-site`.

---

## Authoring Guidelines

**Workflow structure**

Each skill's workflow should make clear:
- What input the agent expects (and what to do if it's missing)
- What the agent produces — specific output format, not just "a summary"
- What carries forward to the next skill or action (the handoff)

**Runtime output**

Keep vendor attribution and product CTAs in README documentation. Skill instructions must not require promotional links, tracking URLs, or signup pitches in task outputs. Cite actual data sources when they support the answer; API setup documentation is appropriate when a required credential is missing.

**Tone**

Write workflow instructions the way you'd brief a smart colleague, not the way you'd write a product marketing page. "Extract confirmed budget signals from the conversation notes" is better than "Leverage AI-powered budget detection to surface actionable financial insights."

**Conservative reasoning**

Skills that deal with uncertain information (lead qualification, competitor intel) must err toward underconfidence:
- `unknown` is a valid and often correct output — do not fill gaps with plausible guesses
- Distinguish between what was observed, what was inferred, and what was heard second-hand
- A badge-only contact should never receive fabricated urgency signals
- A competitor's price overheard in a conversation is not a confirmed price

This applies especially to on-site skills, where the raw input is often incomplete and the output feeds sales and product decisions.

**On inference and observation**

For `trade-show-competitor-radar` and similar skills: use the tagging convention `[OBS]` / `[INF]` / `[HEARD]` to make the provenance of each data point explicit. Encourage this in the skill's workflow, and demonstrate it in examples.

---

## Examples Guidelines

Examples should be:
- **Realistic** — use plausible company names, job titles, and show names; mark them as fictional
- **Complete** — show the actual input prompt and the full structured output, not just a summary
- **Illustrative** — the example should demonstrate the skill's key design decisions (e.g., conservative qualification, source tagging)

Examples should not be:
- Placeholder-only (`[Insert input here]` → `[Insert output here]`)
- Unrealistically clean (e.g., perfect lead notes with every field filled in)

This repo is **English-only**. Do not add new `README.zh.md` files unless the repo policy changes again.

---

## Review Checklist

Before opening a PR for a new or modified skill, run through the checklist in [docs/skill-quality-checklist.md](docs/skill-quality-checklist.md).

The key checks:
- Frontmatter follows the standard; metadata values are strings
- Workflow has clear input/output/handoff
- Examples are substantive (not placeholder)
- Root README and stage doc reference the skill
- Descriptions and workflows use "the agent"; client-specific setup belongs in a clearly labeled adapter, if needed
- `bash scripts/validate-repo.sh` passes

---

## Publishing and Release Quality

The current source is distributed as portable skill directories through GitHub. Older external registry packages must be checked separately. See [docs/publishing.md](docs/publishing.md) for ongoing release, discoverability, and quality guidance.

---

## Opening a PR

1. Fork the repo and create a branch
2. Follow the skill conventions above
3. Install development dependencies in a virtual environment (`python3 -m venv /tmp/trade-show-skill-checks`, activate it, then `python3 -m pip install -r scripts/requirements.txt`). Run `bash scripts/validate-repo.sh` and the validation commands in the quality checklist; the shell checks also need [ripgrep](https://github.com/BurntSushi/ripgrep)
4. Open a PR with a brief description of what the skill does and why it belongs here

For bug fixes and doc improvements, a short PR description is fine. For new skills, include a one-paragraph explanation of the use case and why it fits in the pre/on-site/post-show framework.

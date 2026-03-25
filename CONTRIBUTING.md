# Contributing to trade-show-skills

## Scope

This repo is a collection of [OpenClaw](https://openclaw.ai) workflow skills for trade show planning, on-site execution, and post-show follow-up.

**What belongs here:**
- `SKILL.md` workflow definitions for OpenClaw
- Markdown documentation (README, examples, guides)
- Fictional worked examples that illustrate real usage patterns

**What doesn't belong here:**
- Frontend apps or HTML tools (those live in [trade-show-tools](https://github.com/LensmorOfficial/trade-show-tools))
- npm packages, build systems, or compiled assets
- Backend code or API integrations
- Skills for platforms other than OpenClaw (unless clearly namespaced)

---

## Repo Structure

```
trade-show-skills/
  <skill-name>/
    SKILL.md          ← required: OpenClaw skill definition
    README.md         ← required: English documentation
    examples/         ← required: at least one worked example
    references/       ← optional: helper framework, scoring rubric, seed list
  docs/               ← cross-skill guides and reference docs
  scripts/            ← repo validation helpers
  README.md           ← root index
```

Each skill is self-contained. A skill directory should make sense on its own when copied to `~/.openclaw/skills/`.

---

## OpenClaw Skill Conventions

Every `SKILL.md` must have valid YAML frontmatter:

```yaml
---
name: skill-name
version: 0.3.0
description: One sentence. What it does, not what it is.
homepage: https://github.com/LensmorOfficial/trade-show-skills/tree/main/<skill-name>
user-invocable: true
metadata: {"openclaw":{"config":{"stage":"<stage>","category":"<category>"}}}
---
```

Rules:
- **`metadata` must be a single-line JSON string** — multi-line YAML breaks OpenClaw parsing
- **`description` should be short** (one sentence, under 20 words) — it's consumed by the agent runtime and long descriptions inflate prompt tokens without benefit
- **`version` is allowed and recommended in this repo** for released skills. Use semantic versioning style (`0.3.0`, `1.0.0`) and bump it when public behavior changes meaningfully
- Avoid adding other top-level frontmatter fields beyond `name`, `version`, `description`, `homepage`, `user-invocable`, and `metadata`
- `user-invocable: true` means users can activate this skill by prompt; set to `false` only for utility/helper skills

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
- Frontmatter is complete and valid (especially single-line `metadata`)
- Workflow has clear input/output/handoff
- Examples are substantive (not placeholder)
- Root README and stage doc reference the skill
- No "Claude Code" or bare "Claude" references — use "the agent" or "OpenClaw"
- `bash scripts/validate-repo.sh` passes

---

## Publishing and Release Quality

These skills are already published on ClawHub and also installable via `cp -r`. See [docs/publishing.md](docs/publishing.md) for ongoing release, discoverability, and quality guidance.

---

## Opening a PR

1. Fork the repo and create a branch
2. Follow the skill conventions above
3. Run `bash scripts/validate-repo.sh` and the validation commands in the quality checklist
4. Open a PR with a brief description of what the skill does and why it belongs here

For bug fixes and doc improvements, a short PR description is fine. For new skills, include a one-paragraph explanation of the use case and why it fits in the pre/on-site/post-show framework.

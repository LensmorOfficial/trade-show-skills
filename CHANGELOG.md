# Changelog

All notable changes to this project will be documented here.

Format: [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)

---

## [0.1.0] - 2026-03-18

Initial public beta. First usable release of OpenClaw skills for trade show planning, on-site execution, and post-show follow-up. Skills are distributed via source (`cp -r`) — not yet published to ClawHub.

### Added

- **`badge-qualifier`** — On-site skill: qualify booth leads from notes, badge scans, or voice transcripts into structured CRM-ready records. Tier system: Hot / Warm / Cold with conservative-by-default reasoning.
- **`competitor-radar`** — On-site skill: structure competitor booth observations into field-intel notes with explicit source tagging (`[OBS]` / `[INF]` / `[HEARD]`).
- **`docs/event-lifecycle.md`** and **`docs/event-lifecycle.zh.md`** — End-to-end worked example showing how all 6 skills chain together using a fictional B2B SaaS scenario at Anuga FoodTec.
- **`CONTRIBUTING.md`** — Authoring conventions, stage/category taxonomy, workflow design guidelines, and examples standards.
- **`docs/skill-quality-checklist.md`** — 7-section pre-merge checklist with runnable validation commands.
- **`docs/publishing.md`** — Publishing readiness tracker: what needs to be in place before ClawHub submission.
- **`docs/pre-show.md`**, **`docs/on-site.md`**, **`docs/post-show.md`** — Stage-specific guides covering all skills in each phase.

### Changed

- Repo migrated from Claude Code framing to OpenClaw-first. All skill READMEs and workflows now reference "the agent" / "OpenClaw" instead of "Claude".
- 4 existing skills (`trade-show-finder`, `trade-show-budget-planner`, `booth-invitation-writer`, `post-show-followup`) aligned to OpenClaw frontmatter conventions: `metadata` as single-line JSON, valid `stage` and `category` fields.
- Information architecture reorganized into pre-show / on-site / post-show sections throughout root README and docs.
- `trade-show-finder` workflow improved to handle both discovery mode (find me shows by industry/region) and specific-show lookup (tell me about Interpack 2026).

### Docs

- Bilingual README cleanup across all 6 skills (English + Chinese).
- Install snippet in root README updated to cover all 6 skills in one loop.
- Root README updated with Quick Demo table, End-to-End Lifecycle section, and contributing links.

### Notes

- Skills are not yet published to ClawHub; install via `cp -r` from this repo.
- No automated evals or tests — evaluation is currently manual.
- No versioning policy yet; breaking changes are not formalized.
- Intended as first usable public beta, not a stable production release.

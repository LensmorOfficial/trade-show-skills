# Changelog

All notable changes to this project will be documented here.

Format: [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)

---

## [0.3.1] - 2026-03-25

Patch release focused on documentation quality, repo consistency, and maintainer workflow.

### Fixed

- Repo standards aligned to the current policy: the repo is English-only, and `version` is an allowed top-level field in `SKILL.md`.
- Overlong skill descriptions shortened in `booth-giveaway-planner`, `booth-script-generator`, and `exhibitor-checklist-generator` to better fit OpenClaw skill-picking and prompt-cost constraints.

### Docs

- Refreshed `docs/pre-show.md`, `docs/on-site.md`, and `docs/event-lifecycle.md` to match the current 10-skill repo.
- Updated `pre-show-competitor-analysis/README.md` to the current repo quality standard.
- Clarified publishing guidance and root README wording to reflect the current ClawHub + source-install distribution model.

### Added

- `pre-show-competitor-analysis/examples/medica-surgical-robotics-landscape.md`
- `scripts/validate-repo.sh`

### Notes

- No new skills were added in this release.
- This patch release focuses on maintainability, documentation accuracy, and release hygiene rather than expanding the skill catalog.

---

## [0.3.0] - 2026-03-24

Three new skills added to deepen pre-show preparation and on-site execution coverage.

### Added

- **`booth-giveaway-planner`** — Pre-show skill: generate branded giveaway ideas matched to ICP, budget, and product story. Each idea includes brand-connection rationale, unit cost estimates, and visitor-type targeting.
- **`booth-script-generator`** — On-site skill: generate booth conversation scripts per visitor type (cold walk-up, warm lead, competitor's customer, current customer). Each path includes opening lines, short and extended pitches, qualification questions, and tiered CTAs.
- **`exhibitor-checklist-generator`** — Pre-show skill: generate a phased exhibitor prep checklist (8+ weeks / 2–4 weeks / show week) with owner roles and deadlines on every item, formatted for direct copy-paste into any project management tool.

---

## [0.2.0] - 2026-03-23

Quality and consistency pass across all 7 skills.

### Fixed

- **Epistemic tag system unified** across both competitor intelligence skills. `competitor-radar` and `pre-show-competitor-analysis` now use the same 5-tag system: `[OBS]` / `[INF]` / `[HEARD]` / `[EST]` / `[UNK]`. Previously the two skills used incompatible tags (`[UNK]` vs `TBC`, missing `[EST]` in radar).
- **`pre-show-competitor-analysis` quality checks** corrected — previously referenced `[EST]`/`TBC`; now aligned to the canonical tag set.

### Added

- **`pre-show-competitor-analysis/README.zh.md`** — this was the only skill missing a Chinese README.
- **`badge-qualifier` → `post-show-followup` handoff** — badge-qualifier now explicitly tells users that Hot/Warm/Cold output maps directly to Tier 1/2/3 in post-show-followup. post-show-followup Step 2 now documents this connection.
- **`version` field** added to frontmatter of all 7 skills.

### Changed

- **`badge-qualifier` Warm tier criteria** made explicit — replaced ambiguous "Any two of the above" with a full signal-combination matrix showing all valid Warm paths.
- **`badge-qualifier` output template** — added clarification that the lead card should be rendered as formatted Markdown, not wrapped in a code block.
- **Budget benchmarks** in `trade-show-budget-planner` now carry `[EST 2023–2024]` timestamps and a note to verify with organizers; previously presented as current facts.
- **Regulated-industry caveat** added to `post-show-followup` signature tip — "skip legal disclaimers" now explicitly excludes pharma, medical devices, and financial services.
- **Footer CTAs** strengthened from question format to statement format in `booth-invitation-writer`, `post-show-followup`, and `trade-show-budget-planner`.

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

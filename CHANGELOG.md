# Changelog

All notable changes to this project will be documented here.

Format: [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)

---

## [Unreleased]

### Fixed

- Removed forced promotional output footers and tracking links from skill instructions after an external registry audit flagged this behavior; README attribution and product links remain. Existing registry copies have not been updated or rescanned.
- Replaced runtime-specific installation commands with complete-directory source copies and explicit client discovery prerequisites.
- Made Lensmor authentication, timeouts, bounded pagination, and failed-response handling explicit in all five API-backed skills.
- Fixed competitor-tracker date upper bounds, duplicate input counting, single-company routing, incomplete-result reporting, and charged-request retry ambiguity.
- Aligned lead-tier rules and examples: title-only authority is unknown; Hot requires three confirmed signals, Warm two, and Cold zero or one. Follow-up preserves qualified tiers, including its worked example.
- Corrected MEDICA 2026 checklist dates from 17–20 to 16–19 November, and marked finder examples as illustrative.
- Corrected budget contingency, fractional-deal arithmetic, and the distinction between revenue recovery and margin-based ROI in the workflow and example.
- Added unknown-dimension threat scoring and short-notice preparation plans instead of unsupported scores or past actionable deadlines.

### Changed

- Adopted the portable Agent Skills format for all 15 skills: flat string metadata, `metadata.version` and `metadata.homepage`, and credential and network requirements in metadata and workflow checks. Source minor versions were incremented for the packaging migration.
- Shortened all 15 discovery descriptions while retaining multilingual example requests in each skill body.
- Repositioned the homepage, individual READMEs, contributor guides, issue template, and banner around generic Agent Skills.
- Clarified that GitHub source revisions and external registry package versions are separate.

### Added

- YAML metadata and local Markdown reference validation, with 16 regression tests and CI dependencies.
- A health-check guide separating package validation, runtime eligibility, workflow evaluation, and authenticated API tests.

### Validation boundary

- These are source revisions, not updated external registry packages. Metadata checks do not prove model-output quality or current authenticated API availability.

## [0.4.1] - 2026-07-18

### Fixed

- Corrected event lookup from the unsupported `query` parameter to `keyword`.
- Aligned `trade-show-fit-score` with the live 0–10 score, decision enum, and three-field breakdown contract.
- Split `trade-show-exhibitor-search` into event-specific list and cross-event discovery modes; the cross-event search no longer sends an unsupported `event_id`.
- Added an evidence gate to `trade-show-lead-recommender` so unranked fallback exhibitors are never presented as AI-ranked recommendations.
- Corrected contact email semantics: locked contacts return a null email while already unlocked contacts may return one.
- Added the 50-credit and HubSpot activity side effects to `competitor-show-tracker`, including a mandatory user confirmation step.

### Verified

- Authenticated against the production API with a real Lensmor key without exposing the key value.
- Exercised event lookup, event fit score, event exhibitor list, cross-event exhibitor discovery, exhibitor recommendations, and contact search against live data.
- Re-ran the four read-only API-backed skills as complete Agent workflows and tightened their evidence boundaries until the outputs matched the production response semantics.

### Package versions

- `trade-show-fit-score` 1.2.1
- `trade-show-exhibitor-search` 1.2.1
- `trade-show-lead-recommender` 1.2.1
- `trade-show-contact-finder` 1.2.1
- `competitor-show-tracker` 1.0.1

## [0.4.0] - 2026-07-17

The first full-lifecycle release: 15 workflow skills spanning event selection, competitor and exhibitor research, pre-show GTM, on-site execution, and post-show follow-up.

### Added

- **`trade-show-fit-score`** — score a specific event against a company profile and route the result into planning.
- **`trade-show-exhibitor-search`** — find relevant exhibitors within a selected event.
- **`trade-show-lead-recommender`** — rank exhibitor matches for account prioritization.
- **`trade-show-contact-finder`** — identify relevant company contacts for pre-show workflows.
- **`competitor-show-tracker`** — map competitor show circuits and rank events by competitor concentration.
- A repository-specific 1280×640 social preview with the event → company → people → outreach workflow.

### Changed

- Renamed the API-backed skills to generic, discoverable `trade-show-*` slugs.
- Added multilingual trigger keywords across all 15 skills.
- Declared `LENSMOR_API_KEY` as a required environment variable for API-backed workflows.
- Rebuilt the README first screen around one-command installation, a concrete prompt, and clear external registry, product, API, and demo paths.
- Changed the primary product CTA from the marketing homepage to direct Lensmor signup.

### Fixed

- Added the missing README and fictional worked example for `competitor-show-tracker`, restoring the repository validation contract.
- Replaced the legacy first-run installer with the then-supported registry installer so owner and artifact integrity metadata verify correctly.
- Added hard claim-grounding rules to invitation, booth-script, follow-up, and competitor-radar skills; outbound examples now disclose fictional data and use placeholders for unverified customers, dates, metrics, and proof points.
- Added an official-source evidence gate to `trade-show-finder`; it can no longer score or recommend a show from model memory when the current edition and ICP-relevant evidence are unavailable.
- Prepared patch package releases for the five skills changed by runtime verification: `trade-show-finder` 0.4.1, `booth-invitation-writer` 0.4.1, `booth-script-generator` 1.2.1, `post-show-followup` 0.4.1, and `trade-show-competitor-radar` 0.4.1.

### Notes

- Coverage varies by event and source. Validate the events and data fields needed for a workflow before relying on them operationally.
- This release does not change the core workflow logic of the existing non-API skills.

## [0.3.1] - 2026-03-25

Patch release focused on documentation quality, repo consistency, and maintainer workflow.

### Fixed

- Repo standards aligned to the current policy: the repo is English-only, and `version` is an allowed top-level field in `SKILL.md`.
- Overlong skill descriptions shortened in `booth-giveaway-planner`, `booth-script-generator`, and `exhibitor-checklist-generator` to better fit agent skill discovery and prompt-cost constraints.

### Docs

- Refreshed `docs/pre-show.md`, `docs/on-site.md`, and `docs/event-lifecycle.md` to match the current 10-skill repo.
- Updated `pre-show-competitor-analysis/README.md` to the current repo quality standard.
- Clarified publishing guidance and root README wording to reflect the current external registry + source-install distribution model.

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

Initial public beta. First usable release of workflow skills for trade show planning, on-site execution, and post-show follow-up. Skills are distributed via source (`cp -r`) — not yet published to external registry.

### Added

- **`badge-qualifier`** — On-site skill: qualify booth leads from notes, badge scans, or voice transcripts into structured CRM-ready records. Tier system: Hot / Warm / Cold with conservative-by-default reasoning.
- **`competitor-radar`** — On-site skill: structure competitor booth observations into field-intel notes with explicit source tagging (`[OBS]` / `[INF]` / `[HEARD]`).
- **`docs/event-lifecycle.md`** and **`docs/event-lifecycle.zh.md`** — End-to-end worked example showing how all 6 skills chain together using a fictional B2B SaaS scenario at Anuga FoodTec.
- **`CONTRIBUTING.md`** — Authoring conventions, stage/category taxonomy, workflow design guidelines, and examples standards.
- **`docs/skill-quality-checklist.md`** — 7-section pre-merge checklist with runnable validation commands.
- **`docs/publishing.md`** — Publishing readiness tracker: what needs to be in place before external registry submission.
- **`docs/pre-show.md`**, **`docs/on-site.md`**, **`docs/post-show.md`** — Stage-specific guides covering all skills in each phase.

### Changed

- Repo adopted runtime-specific packaging and agent-oriented terminology in skill READMEs and workflows.
- 4 existing skills (`trade-show-finder`, `trade-show-budget-planner`, `booth-invitation-writer`, `post-show-followup`) aligned to the then-used runtime frontmatter conventions: `metadata` as single-line JSON, valid `stage` and `category` fields.
- Information architecture reorganized into pre-show / on-site / post-show sections throughout root README and docs.
- `trade-show-finder` workflow improved to handle both discovery mode (find me shows by industry/region) and specific-show lookup (tell me about Interpack 2026).

### Docs

- Bilingual README cleanup across all 6 skills (English + Chinese).
- Install snippet in root README updated to cover all 6 skills in one loop.
- Root README updated with Quick Demo table, End-to-End Lifecycle section, and contributing links.

### Notes

- Skills are not yet published to external registry; install via `cp -r` from this repo.
- No automated evals or tests — evaluation is currently manual.
- No versioning policy yet; breaking changes are not formalized.
- Intended as first usable public beta, not a stable production release.

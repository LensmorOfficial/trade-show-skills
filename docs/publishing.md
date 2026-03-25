# Publishing and Release Quality

This document tracks what needs to stay healthy now that these skills are already published on ClawHub and distributed from source.

> **Current status**: Published on ClawHub. Skills can also be installed manually via `git clone` + `cp -r`.

---

## Current Distribution Model

Skills in this repo are available in two ways:

```bash
cp -r trade-show-skills/<skill-name> ~/.openclaw/skills/
```

- **Source install** remains useful for development, local testing, and copying a skill directly from a branch.
- **ClawHub install** is the primary end-user path for published skills.

Both paths should stay healthy. A skill that installs cleanly from ClawHub but has stale docs or broken source examples still creates maintenance drag, and the reverse is also true.

---

## What Needs to Stay Healthy After Publishing

### Naming and discoverability

- [ ] Skill names are stable — renaming after publishing breaks installs
- [ ] Names are lowercase, hyphenated, and descriptive enough to be found by keyword search
- [ ] No name collisions with existing published skills in the target registry
- [ ] `homepage` URLs are correct and publicly accessible

### Description quality

- [ ] Each `description` is one sentence, action-oriented, and under ~20 words
- [ ] Description can stand alone in a skill picker — no assumed context
- [ ] No marketing language that inflates expectations

### Examples completeness

- [ ] Every skill has at least one `examples/` file
- [ ] Examples demonstrate realistic inputs and structured outputs
- [ ] Examples are clearly marked as fictional where they use company/contact names

### README quality

- [ ] English README covers: what it does, usage examples, install, related skills
- [ ] Usage examples are prompts a real user would actually type — not contrived demos

### Stage and category clarity

- [ ] Every skill has a valid `stage` and `category` in `metadata`
- [ ] The stage accurately reflects when the skill is used (not what data it touches)
- [ ] The lifecycle is coherent — a user can follow pre-show → on-site → post-show without gaps

### Lifecycle discoverability

- [ ] `docs/event-lifecycle.md` shows how skills connect end-to-end
- [ ] Each skill's Related Skills section links to natural next steps
- [ ] Root README table correctly represents all published skills

### English-only documentation quality

- [ ] No stale references to `README.zh.md` remain in repo docs
- [ ] Stage docs and lifecycle docs still describe the current skill set
- [ ] Examples and README wording stay aligned after each release

---

## Discoverability Guidance

When publishing to a registry, discoverability depends on:

**Skill name**: Should be a recognizable keyword for the workflow it covers. `badge-qualifier` is better than `lead-scorer` because "badge" is the concrete artifact a trade show attendee encounters. `trade-show-finder` is explicit about scope.

**Description**: The description is what gets indexed and shown in search results. Write it to match the query a user would type, not the feature you want to highlight. "Recommend which trade shows to prioritize for exhibiting based on ICP, region, and goals" matches "should we exhibit at medica" better than "AI-powered event discovery with real-time search."

**README first screen**: The first thing a user sees after finding a skill should answer: what does this do, who is it for, and what does the output look like? Usage examples are often more persuasive than feature lists.

**Examples**: A worked example is the fastest way to show a potential user whether this skill matches their workflow. Thin or placeholder examples hurt adoption.

---

## Suggested Release Review

Before shipping a new public release or adding a new skill:

1. Run the full [skill quality checklist](skill-quality-checklist.md)
2. Run `bash scripts/validate-repo.sh`
3. Install the skill locally from scratch (`cp -r` into a fresh `~/.openclaw/skills/`) and test with 2–3 real prompts
4. Confirm the `homepage` URL resolves to the correct page
5. Check that the `description` still accurately describes the skill after any recent changes
6. Verify the `examples/` files reflect the current output format (not a prior version)
7. Bump the `version` field if the public behavior or output contract changed meaningfully

For a batch release of multiple skills, run steps 1–2 repo-wide, then do steps 3–7 per affected skill.

---

## Not Yet Included

The following are explicitly out of scope for this document and this repo in its current state:

- **ClawHub release automation** — there is no documented automated pipeline for publishing or updating ClawHub entries
- **Automated testing / evals** — there are no automated tests validating that skills produce correct outputs; evaluation is currently manual
- **Usage telemetry** — no analytics or usage tracking is implemented; there is no data on how often skills are invoked or which prompts trigger them
- **Formal versioning policy** — `version` fields are present, but breaking vs. non-breaking changes are not yet formally defined
- **Localization** — the repo is intentionally English-only at the moment; other languages are not planned

---

## Reference

- Quality checklist: [docs/skill-quality-checklist.md](skill-quality-checklist.md)
- Contribution guidelines: [CONTRIBUTING.md](../CONTRIBUTING.md)

# Publishing Readiness

This document tracks what needs to be in place before these skills can be published to ClawHub or any other public skill registry.

> **Current status**: Published on ClawHub. Skills can also be installed manually via `git clone` + `cp -r`.

---

## Current Distribution Model

Skills in this repo are installed manually:

```bash
cp -r trade-show-skills/<skill-name> ~/.openclaw/skills/
```

This works fine for early adopters and development use. It is not scalable for broad distribution — users have to find the repo, clone it, and copy directories manually. ClawHub (or a similar registry) would replace this with `clawhub install trade-show-skills/<slug>`.

---

## What Needs to Be Ready Before Publishing

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
- [ ] Chinese README covers the same sections
- [ ] Usage examples are prompts a real user would actually type — not contrived demos

### Stage and category clarity

- [ ] Every skill has a valid `stage` and `category` in `metadata`
- [ ] The stage accurately reflects when the skill is used (not what data it touches)
- [ ] The lifecycle is coherent — a user can follow pre-show → on-site → post-show without gaps

### Lifecycle discoverability

- [ ] `docs/event-lifecycle.md` shows how skills connect end-to-end
- [ ] Each skill's Related Skills section links to natural next steps
- [ ] Root README table correctly represents all published skills

### Bilingual documentation quality

- [ ] Chinese READMEs cover the same content structure as English
- [ ] Usage examples in Chinese are idiomatic (not machine-translated)
- [ ] Stage/category labels appear in both languages

---

## Discoverability Guidance

When publishing to a registry, discoverability depends on:

**Skill name**: Should be a recognizable keyword for the workflow it covers. `badge-qualifier` is better than `lead-scorer` because "badge" is the concrete artifact a trade show attendee encounters. `trade-show-finder` is explicit about scope.

**Description**: The description is what gets indexed and shown in search results. Write it to match the query a user would type, not the feature you want to highlight. "Recommend which trade shows to prioritize for exhibiting based on ICP, region, and goals" matches "should we exhibit at medica" better than "AI-powered event discovery with real-time search."

**README first screen**: The first thing a user sees after finding a skill should answer: what does this do, who is it for, and what does the output look like? Usage examples are often more persuasive than feature lists.

**Examples**: A worked example is the fastest way to show a potential user whether this skill matches their workflow. Thin or placeholder examples hurt adoption.

---

## Suggested Pre-Publish Review

Before submitting any skill to a registry:

1. Run the full [skill quality checklist](skill-quality-checklist.md)
2. Install the skill locally from scratch (`cp -r` into a fresh `~/.openclaw/skills/`) and test with 2–3 real prompts
3. Confirm the `homepage` URL resolves to the correct page
4. Check that the `description` still accurately describes the skill after any recent changes
5. Verify the `examples/` files reflect the current output format (not a prior version)

For a batch publish of multiple skills, run step 1 for all skills first, then do steps 2–5 per skill.

---

## Not Yet Included

The following are explicitly out of scope for this document and this repo in its current state:

- **ClawHub publish configuration** — the specific manifest format, submission process, and approval flow for ClawHub are not yet documented here
- **Automated testing / evals** — there are no automated tests validating that skills produce correct outputs; evaluation is currently manual
- **Usage telemetry** — no analytics or usage tracking is implemented; there is no data on how often skills are invoked or which prompts trigger them
- **Versioning policy** — `version` fields are now present in all skill frontmatters (added in v0.2.0); a formal breaking-change policy is not yet defined
- **Localization beyond Chinese** — English and Chinese are the only supported languages; Japanese, German, and Spanish READMEs would improve reach for this repo's target market but are not planned yet

---

## Reference

- Quality checklist: [docs/skill-quality-checklist.md](skill-quality-checklist.md)
- Contribution guidelines: [CONTRIBUTING.md](../CONTRIBUTING.md)

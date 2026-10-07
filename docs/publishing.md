# Publishing and Release Quality

The primary distribution is versioned source on GitHub. Each skill directory is portable; installation and activation depend on the receiving agent client.

## Current Distribution Model

Inspect a source commit or GitHub release, then copy the entire skill directory into a supported discovery location. For clients supporting project-level `.agents/skills/`:

```bash
mkdir -p .agents/skills
cp -r /path/to/trade-show-skills/skill-name .agents/skills/
```

See the [quick start](../README.md#quick-start) for shared installations and prerequisites. Existing copied skills must be updated separately. External registry copies are separate artifacts and may retain earlier packaging and workflows; a GitHub merge does not republish them or refresh scanner verdicts.

---

## What Needs to Stay Healthy After Publishing

### Naming and discoverability

- [ ] Skill names are stable — renaming after publishing breaks installs
- [ ] Names are lowercase, hyphenated, and descriptive enough to be found by keyword search
- [ ] No name collisions with existing published skills in the target registry
- [ ] `metadata.homepage` URLs are correct and publicly accessible

### Description quality

- [ ] Each `description` is one sentence, action-oriented, and at most 200 characters
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
3. Copy the skill into a fresh client-supported discovery directory and test with 2–3 real prompts
4. Confirm the `homepage` URL resolves to the correct page
5. Check that the `description` still accurately describes the skill after any recent changes
6. Verify the `examples/` files reflect the current output format (not a prior version)
7. Bump the `metadata.version` field if the public behavior or output contract changed meaningfully
8. Capture the current GitHub growth baseline with `bash scripts/github-growth-report.sh`
9. Publish a GitHub Release so subscribers can follow versioned updates
10. Verify that README product links retain their repo-specific UTM campaign

For a batch release of multiple skills, run steps 1–2 repo-wide, then do steps 3–7 per affected skill.

---

## Not Yet Included

The following are explicitly out of scope for this document and this repo in its current state:

- **External registry publishing automation** — registry adapters and publishing pipelines are not maintained here
- **Model-output evals** — metadata and local-link regression tests run in CI; model decisions and live API responses still require separate evaluation
- **Usage telemetry** — no analytics or usage tracking is implemented; there is no data on how often skills are invoked or which prompts trigger them
- **Formal versioning policy** — `metadata.version` fields are present, but breaking vs. non-breaking changes are not yet formally defined
- **Localization** — the repo is intentionally English-only at the moment; other languages are not planned

Source versions can be newer than external registry packages. A merge or GitHub Release does not publish registry updates. Record the tested source commit and installed package version separately; follow the [health-check guide](health-check.md) before publishing source changes.

---

## Reference

- Quality checklist: [docs/skill-quality-checklist.md](skill-quality-checklist.md)
- Contribution guidelines: [CONTRIBUTING.md](../CONTRIBUTING.md)
- GitHub growth operating guide: [docs/github-growth.md](github-growth.md)

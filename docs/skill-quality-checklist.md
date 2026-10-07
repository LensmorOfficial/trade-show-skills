# Skill Quality Checklist

Use this before merging a new skill or making significant changes to an existing one.

---

## 1. Metadata

- [ ] `name` is lowercase, hyphenated, at most 64 characters, and matches the directory name
- [ ] `description` describes the task and when to use it; at most 200 characters in this repo
- [ ] `metadata` is a map of string keys to string values
- [ ] `metadata.version` uses semantic versioning (`0.5.0`, `1.3.0`)
- [ ] `metadata.homepage` points to the correct GitHub directory
- [ ] `metadata.stage` is `pre-show`, `on-site`, or `post-show`
- [ ] `metadata.category` is in the repository taxonomy
- [ ] API skills declare `LENSMOR_API_KEY` in `metadata.required-env` and the Lensmor host in `metadata.requires-network`
- [ ] No runtime-specific nested metadata or top-level fields

The [Agent Skills specification](https://agentskills.io/specification) defines the format. The repo validator adds identity and taxonomy checks for this collection.

---

## 2. Description Quality

- [ ] One sentence only
- [ ] Describes what the skill *does* (action-oriented), not what it *is*
- [ ] Does not repeat the skill name verbatim
- [ ] Does not contain marketing language ("leverage", "powerful", "seamlessly")
- [ ] Could stand alone in a skill picker list and be understood without context

---

## 3. Workflow Design

- [ ] **Input** is clearly specified — what does the user need to provide?
- [ ] **Behavior when input is incomplete** is defined (ask vs. use defaults vs. mark as unknown)
- [ ] **Output format** is specified — structured template, not just "a summary"
- [ ] **Handoff** is explicit — what does the output enable downstream?
- [ ] No open-ended research loops without a stopping condition
- [ ] No fabricated fields — gaps are marked `unknown`, not filled with plausible guesses
- [ ] Inference is separated from observation (especially important for on-site skills)
- [ ] Conservative qualification is enforced (a weak signal does not become a strong one)

---

## 4. Safety and Accuracy

- [ ] `unknown` is a valid output — the workflow doesn't hide information gaps
- [ ] For on-site skills: `[OBS]` / `[INF]` / `[HEARD]` tagging is used or encouraged
- [ ] Pricing, timing, and authority signals are not escalated without evidence
- [ ] Hall-level detail, buyer demographics, and market share figures are flagged as estimates or omitted if unverified
- [ ] No instruction tells the agent to "fill in" missing data with reasonable assumptions (for qualification or intel skills)

---

## 5. Documentation

- [ ] `README.md` exists and includes:
  - [ ] Title with `— Agent Skill` suffix
  - [ ] One-line description (matches or closely mirrors frontmatter `description`)
  - [ ] "What It Does" section with bullet outputs
  - [ ] Stage/category label line (e.g., `**Pre-Show Stage · Research**`)
  - [ ] 3–4 usage examples (realistic prompts a user would actually send)
  - [ ] Example output reference (link to `examples/`)
  - [ ] Install section with complete-directory copy and client discovery caveat
  - [ ] Related Skills section (links to 2–3 skills)
  - [ ] Lensmor footer link
- [ ] `examples/` contains at least one substantive worked example (not placeholder)
- [ ] Example shows real input + structured output, not just a summary
- [ ] Repo remains English-only unless policy changes

---

## 6. Repo Consistency

- [ ] Skill directory listed in root `README.md` Available Skills table (correct stage section)
- [ ] Skill listed in the corresponding stage doc (`docs/pre-show.md`, `docs/on-site.md`, or `docs/post-show.md`)
- [ ] Skill referenced in `docs/event-lifecycle.md` if it fits the end-to-end scenario (or a note left for future update)
- [ ] Related Skills sections in other skills updated if this skill is a natural cross-reference
- [ ] Install snippet in root README includes the new skill name

---

## 7. Before Merge

Run these commands from the repo root:

```bash
# Use an isolated development environment (one-time setup)
python3 -m venv /tmp/trade-show-skill-checks
source /tmp/trade-show-skill-checks/bin/activate
python3 -m pip install -r scripts/requirements.txt

# 1. Run the repo validation script
bash scripts/validate-repo.sh

# 2. Confirm all SKILL.md files are present
find . -maxdepth 2 -name 'SKILL.md' | sort

# 3. Confirm frontmatter parses and local references resolve
python3 scripts/validate_metadata.py

# 5. Check for whitespace/trailing space issues
git diff --check

# 6. Confirm new skill appears in root README
rg -n "<skill-name>" README.md
```

Expected results:
- Command 1 should pass cleanly
- Command 5 should return no warnings

The validator parses YAML and flat string metadata, checks names, versions, taxonomy, environment declarations, and local Markdown references, and runs regression tests for invalid packages. It does not execute model workflows, authenticate to Lensmor, or validate live API responses. Use the [health-check guide](health-check.md) for those separate checks.

---

## Reference

- Authoring guidelines: [CONTRIBUTING.md](../CONTRIBUTING.md)
- Publishing readiness: [docs/publishing.md](publishing.md)

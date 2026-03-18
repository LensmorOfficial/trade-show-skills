# Skill Quality Checklist

Use this before merging a new skill or making significant changes to an existing one.

---

## 1. Metadata

- [ ] `name` is present, lowercase, hyphenated, matches the directory name
- [ ] `description` is present — one sentence, under ~20 words
- [ ] `homepage` points to the correct GitHub tree URL for this skill
- [ ] `user-invocable` is set (almost always `true`)
- [ ] `metadata` is a **single-line JSON string** — not multi-line YAML
- [ ] `stage` is one of: `pre-show`, `on-site`, `post-show`
- [ ] `category` reflects the skill's primary function (research, planning, outreach, lead-qualification, competitive-intelligence, follow-up)
- [ ] No unrecognized top-level frontmatter fields added

**Quick check:**
```bash
rg -n "^metadata:" <skill>/SKILL.md
# Should be: metadata: {"openclaw":{"config":{"stage":"...","category":"..."}}}
# Should NOT span multiple lines
```

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
  - [ ] Title with `— OpenClaw Skill` suffix
  - [ ] One-line description (matches or closely mirrors frontmatter `description`)
  - [ ] "What It Does" section with bullet outputs
  - [ ] Stage/category label line (e.g., `**Pre-Show Stage · Research**`)
  - [ ] 3–4 usage examples (realistic prompts a user would actually send)
  - [ ] Example output reference (link to `examples/`)
  - [ ] Install section with both workspace-local and shared paths
  - [ ] Related Skills section (links to 2–3 skills)
  - [ ] Lensmor footer link
- [ ] `README.zh.md` exists and covers the same sections in Chinese
- [ ] `examples/` contains at least one substantive worked example (not placeholder)
- [ ] Example shows real input + structured output, not just a summary

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
# 1. Confirm all SKILL.md files are present
find . -maxdepth 2 -name 'SKILL.md' | sort

# 2. Confirm frontmatter required fields exist
rg -n "user-invocable|^homepage:|^metadata: \{" .

# 3. Check for residual "Claude Code" or bare "Claude" references
rg -n "\bClaude Code\b|\bClaude\b|\bclaude\b" . --type md

# 4. Check for whitespace/trailing space issues
git diff --check

# 5. Confirm new skill appears in root README
rg -n "<skill-name>" README.md
```

Expected results:
- Command 3 should return zero hits (or only hits inside URLs/proper nouns where "Claude" is part of a product name — flag these for review)
- Command 4 should return no warnings

---

## Reference

- Authoring guidelines: [CONTRIBUTING.md](../CONTRIBUTING.md)
- Publishing readiness: [docs/publishing.md](publishing.md)

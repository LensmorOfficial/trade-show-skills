#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

pass() {
  echo "[PASS] $1"
}

fail() {
  echo "[FAIL] $1" >&2
  exit 1
}

SKILL_FILES=()
while IFS= read -r skill_file; do
  SKILL_FILES+=("$skill_file")
done < <(find . -maxdepth 2 -name 'SKILL.md' | sort)
[[ ${#SKILL_FILES[@]} -gt 0 ]] || fail "No SKILL.md files found."
pass "Found ${#SKILL_FILES[@]} skills"

for skill_file in "${SKILL_FILES[@]}"; do
  skill_dir="$(dirname "$skill_file")"
  skill_name="$(basename "$skill_dir")"

  [[ -f "$skill_dir/README.md" ]] || fail "$skill_name is missing README.md"
  [[ -d "$skill_dir/examples" ]] || fail "$skill_name is missing examples/"
  find "$skill_dir/examples" -maxdepth 1 -type f | grep -q . || fail "$skill_name examples/ is empty"

  rg -q '^name:' "$skill_file" || fail "$skill_name is missing name:"
  rg -q '^version:' "$skill_file" || fail "$skill_name is missing version:"
  rg -q '^description:' "$skill_file" || fail "$skill_name is missing description:"
  rg -q '^homepage:' "$skill_file" || fail "$skill_name is missing homepage:"
  rg -q '^user-invocable:' "$skill_file" || fail "$skill_name is missing user-invocable:"
  rg -q '^metadata: \{' "$skill_file" || fail "$skill_name is missing single-line metadata JSON"

  stage="$(rg -o '"stage":"[^"]+"' "$skill_file" | sed 's/.*"stage":"//; s/"$//')"
  [[ -n "$stage" ]] || fail "$skill_name is missing stage metadata"

  case "$stage" in
    pre-show) stage_doc="docs/pre-show.md" ;;
    on-site) stage_doc="docs/on-site.md" ;;
    post-show) stage_doc="docs/post-show.md" ;;
    *) fail "$skill_name has unknown stage: $stage" ;;
  esac

  rg -q "$skill_name" README.md || fail "$skill_name is missing from root README"
  rg -q "$skill_name" "$stage_doc" || fail "$skill_name is missing from $stage_doc"
done
pass "Skill structure, examples, and frontmatter look healthy"

if find . -name 'README.zh.md' | grep -q .; then
  fail "English-only repo policy violated: README.zh.md files found"
fi
pass "English-only repo policy respected"

if rg -n '\bClaude Code\b|\bClaude\b|claude install-skill' . --type md \
  -g '!CHANGELOG.md' \
  -g '!CONTRIBUTING.md' \
  -g '!docs/skill-quality-checklist.md' \
  >/tmp/trade-show-skills-claude-check.txt; then
  cat /tmp/trade-show-skills-claude-check.txt >&2
  fail "Residual Claude wording found"
fi
pass "No residual Claude wording"

for grounded_skill in booth-invitation-writer booth-script-generator post-show-followup trade-show-competitor-radar; do
  rg -qi 'never (invent|fabricate)' "$grounded_skill/SKILL.md" \
    || fail "$grounded_skill is missing an explicit claim-grounding guard"
  rg -qi 'fictional example' "$grounded_skill/examples" \
    || fail "$grounded_skill examples are missing a fictional-data disclosure"
done
pass "Outbound skills include claim-grounding guards and fictional-example disclosures"

rg -q 'stop with `Verification required`' trade-show-finder/SKILL.md \
  || fail "trade-show-finder is missing its official-source evidence gate"
pass "Trade show recommendations require current official-source evidence"

if rg -n 'events/list\?query=' . --type md; then
  fail "API-backed skills still use the unsupported events/list query parameter"
fi

if rg -n 'uak_' . --type md; then
  fail "Legacy API key examples found; public examples must use sk_"
fi

rg -q '0–10' trade-show-fit-score/SKILL.md \
  || fail "trade-show-fit-score is missing the live 0–10 score contract"
rg -q 'matched_exhibitor_density' trade-show-fit-score/SKILL.md \
  || fail "trade-show-fit-score is missing the live breakdown fields"
rg -q 'zero score does not prove' trade-show-fit-score/SKILL.md \
  || fail "trade-show-fit-score is missing its zero-score interpretation guard"
rg -q 'Exact-zero hard gate' trade-show-fit-score/SKILL.md \
  || fail "trade-show-fit-score is missing its exact-zero output gate"

rg -q 'does not accept `event_id`' trade-show-exhibitor-search/SKILL.md \
  || fail "trade-show-exhibitor-search does not separate event list and cross-event search modes"
rg -q 'never call them registrations' trade-show-exhibitor-search/SKILL.md \
  || fail "trade-show-exhibitor-search is missing its participation-language guard"
rg -q 'Do not imply that `trade-show-lead-recommender` requires an event unlock' trade-show-exhibitor-search/SKILL.md \
  || fail "trade-show-exhibitor-search is missing its cross-skill prerequisite guard"
rg -q 'Unranked fallback' trade-show-lead-recommender/SKILL.md \
  || fail "trade-show-lead-recommender is missing its recommendation evidence gate"
rg -q 'does not identify a cause' trade-show-lead-recommender/SKILL.md \
  || fail "trade-show-lead-recommender is missing its refresh-hint boundary"
rg -q 'Every Lensmor API call in this workflow must send' trade-show-lead-recommender/SKILL.md \
  || fail "trade-show-lead-recommender is missing authenticated event lookup guidance"
rg -q 'contactUnlockStatus' trade-show-contact-finder/SKILL.md \
  || fail "trade-show-contact-finder is missing email lock-state semantics"
rg -q 'not verified decision authority' trade-show-contact-finder/SKILL.md \
  || fail "trade-show-contact-finder is missing its authority-inference guard"
rg -q 'HubSpot `last_search_date`' competitor-show-tracker/SKILL.md \
  || fail "competitor-show-tracker is missing its activity side-effect disclosure"
rg -q 'consumes 50 credits' competitor-show-tracker/SKILL.md \
  || fail "competitor-show-tracker is missing its per-request credit disclosure"
pass "API-backed skills match the verified production contracts"

pass "Repo validation completed successfully"

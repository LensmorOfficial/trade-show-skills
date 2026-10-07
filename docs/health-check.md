# Skill Health Checks

Check package loading, prerequisites, workflow behavior, and API availability separately. A passing metadata check does not establish live API health or model-output quality.

## 1. Validate Source

From the repository root:

```bash
python3 -m venv /tmp/trade-show-skill-checks
source /tmp/trade-show-skill-checks/bin/activate
python3 -m pip install -r scripts/requirements.txt
bash scripts/validate-repo.sh
git diff --check
```

This parses YAML and flat string metadata, validates package identity and declared API requirements, checks local Markdown links, and runs validator regression tests. It makes no live requests.

## 2. Check an Isolated Agent Client

Choose a client that supports the [Agent Skills format](https://agentskills.io/specification). Copy all 15 skill directories into a fresh project-level discovery directory supported by that client, rather than replacing a user's existing skills. Follow the client's own reload and inventory instructions.

Confirm all 15 names and descriptions are discovered, then explicitly invoke representative skills. Record the client and model versions, tools available, source revision, and actual outputs. Discovery alone does not prove correct execution. No cross-client runtime tests are automated by this repository.

Ten skills do not require a Lensmor key; browsing workflows still require current official sources. The five API-backed skills must stop with a missing-credential message before making requests if `LENSMOR_API_KEY` is absent. The generic `metadata.requires-network` and `metadata.required-env` fields document this requirement; they do not configure secrets or provide automatic runtime gating.

If distributing through an external registry, test the exact published version and record its integrity and scanner status separately. Source fixes do not update existing packages or scanner decisions. Investigate flagged packages rather than bypassing installer warnings.

## 3. Evaluate Workflow Behavior

Use these as realistic manual evaluation cases. Record the actual output, model/runtime version, sources or fixtures, and whether each criterion passed. Do not label these as automated model evals merely because the validator passes.

| Skill | Test input or condition | Required behavior |
|---|---|---|
| trade-show-finder | Compare two named shows with verified current-edition sources; repeat with sources unavailable | Evidence-based comparison; unavailable sources yield `Verification required` without a guessed score |
| trade-show-budget-planner | 20sqm booth, four staff, deal value supplied, gross margin unknown | Visible contingency, consistent arithmetic, revenue recovery distinguished from unassessed profit ROI |
| pre-show-competitor-analysis | Published exhibitor name but no floor plan or user's offer | Unknown booth dimensions; no complete threat score or invented differentiation |
| booth-invitation-writer | Product and booth supplied, no customer references or quantified outcomes | Usable draft with no fabricated proof or familiarity |
| booth-giveaway-planner | EUR 5/item limit, event in two weeks | Within-budget ideas with production feasibility and lead-time uncertainty |
| exhibitor-checklist-generator | Show opens in ten days; freight not booked | Short-notice triage, achievable deadlines, explicit supplier feasibility gaps |
| badge-qualifier | Senior-title badge only; explicit need + urgency with unknown authority; all three signals | Cold / Warm / Hot respectively; authority requires stated buying involvement |
| booth-script-generator | Cold and warm paths, no verified outcomes or integrations | Distinct scripts, short pitch, no invented proof, capture notes |
| trade-show-competitor-radar | Overheard price plus banner claim, no own-company context | Source tags preserved; claims not treated as proven; threat not assessed without context |
| post-show-followup | Qualified Cold card after a polite conversation; no asset URL supplied | Preserves Tier 3, honest recap, placeholder resource rather than a fabricated link |
| trade-show-fit-score | Valid zero, null score, malformed response, ambiguous editions | Zero interpretation preserved; null/invalid is not zero; edition resolved before call |
| trade-show-exhibitor-search | Event preview and cross-event discovery responses | Modes remain distinct; counts/lock state retained; no inferred attendance or automatic unlock |
| trade-show-lead-recommender | Recommendation metadata empty, then populated | Unranked fallback vs. returned ranking; no invented match reasons |
| trade-show-contact-finder | Locked email, senior title, irrelevant company match | Authenticated query; lock state retained; no inferred budget ownership |
| competitor-show-tracker | Duplicate names, date_to cutoff, one failed lookup, hasMore=true | Correct denominator/date bounds, partial coverage disclosed, no automatic paid pagination or retries |

## 4. Check Live APIs Separately

Use a test key configured outside chat and logs. Never print it. Obtain event IDs from authenticated discovery, not example files. Four skills use search/scoring without unlocks; confirm the current [API contract](https://api.lensmor.com/openapi.json) before live testing.

Record status code, response shape, pagination and access mode, and redacted evidence for event lookup, fit score, event exhibitor list, cross-event discovery, exhibitor recommendations, and company contact search. Stop on invalid credentials or unavailable responses; do not represent missing responses as empty data.

`competitor-show-tracker` uses a charged company-to-event search. Quote a bounded credit budget and its activity side effects before testing. Event/contact unlocks and paid pagination are separate actions. Without a configured test key or approved paid test, mark these checks **Not verified**, not passed.

## 5. Release Evidence

Record source commit, skill metadata versions, agent client and model versions, validation results, model eval results, and which live checks were not performed. Source patch versions and registry versions can differ until the updated packages are published and verified.

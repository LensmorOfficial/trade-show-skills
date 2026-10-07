# Skill Source Audit — 2026-10-07

This maintenance pass reviews all 15 skill directories and migrates the current source to the [Agent Skills specification](https://agentskills.io/specification). It is a credential-free audit; no authenticated Lensmor calls, charged searches, unlocks, or outreach were performed.

## Results and Limits

| Layer | Result | What it establishes |
|---|---|---|
| Source packaging | 15/15 pass the official `skills-ref` validator and the bundled skill-creator validator | Portable frontmatter, names, and directory structure |
| Repository checks | YAML, string metadata, taxonomy, local links, examples, and 16 regression tests pass | Invalid manifests and broken local references are caught |
| Portable copy and reference catalog | 15/15 copied and catalogued from a fresh `.agents/skills/` directory | The documented copy preserves discoverable entrypoints and resources; no client executed |
| Budget example | Decimal arithmetic independently checked | Contingency, expected deals, recovery percentages, and break-even arithmetic agree |
| Public API schema | Seven documented endpoint shapes compared with the current published schema | Documentation matches the public contract at audit time |
| Unauthenticated reachability | Event-list endpoint returned HTTP 401 | The endpoint was reachable and required authentication |
| Model behavior and client discovery | Not executed for the final portable packages | Format validation does not establish cross-client runtime behavior |
| Authenticated API data | Not verified; no test credential configured | Current response data, authorization, lock states, ranking, and paid behavior remain untested |
| External registry copies | 4 existing versions passed verification; 11 were flagged `suspicious` | Retrieved cached registry verdicts, not a new scan of these source changes |

Reference validator: `skills-ref` 0.1.0 from [commit 69ef37e](https://github.com/agentskills/agentskills/tree/69ef37e9424c0a7ea9dd2293b559e43ec8176379/skills-ref). Source tests used Python 3.14 and PyYAML 6.0.3. The reference validator was used for this audit; repository CI runs the local validator and regression suite.

## Repairs

- Replaced runtime-specific frontmatter with standard `name`, `description`, `license`, flat string `metadata`, and prerequisites documented in the workflow. Versions, homepage, stage, category, and API prerequisites remain documented without requiring a particular client.
- Reduced the combined discovery-description length from 4,815 to 1,652 characters. Multilingual request examples remain available in the skill bodies.
- Removed forced promotional output footers and tracking links from task instructions. Product attribution and conversion links remain in README documentation.
- Made authentication, bounded timeouts, pagination, status checks, and failure interpretation explicit in the five API workflows. Missing or invalid data must not become an empty result or zero score.
- Fixed competitor tracking's ignored upper date bound, duplicate counts, single-company routing, partial coverage, and automatic paid-retry ambiguity.
- Reconciled lead qualification and follow-up workflows and examples: Hot needs three confirmed signals, Warm two, Cold zero or one. A senior title alone does not establish buying authority.
- Corrected budget contingency and fractional expected-deal arithmetic; revenue recovery is distinct from profit ROI, which needs a gross-margin assumption.
- Corrected the MEDICA 2026 checklist dates to 16–19 November using the [organizer facts page](https://www.medica-tradefair.com/en/Exhibit/Information/At_a_glance), and labeled finder recommendations as illustrative rather than verified live results.
- Kept unknown competitor dimensions unscored and introduced feasible short-notice planning rather than past actionable deadlines.
- Added contact-data handling boundaries and replaced the invitation example's unsupported medical/product claims with supplied facts and synthetic-demo wording.
- Replaced keyword-only frontmatter checks with actual YAML parsing, duplicate-key rejection, portable metadata checks, local-reference validation, and regression tests.

## Source and Existing Registry Versions

These source versions contain the portable-format migration. The old registry packages below are separate artifacts. A `suspicious` verdict does not establish malware, and a clean verdict does not establish task accuracy. No flagged package was installed or its warning bypassed during the audit.

| Skill | New source version | Existing registry version | Retrieved registry status |
|---|---|---|---|
| [badge-qualifier](https://clawhub.ai/weilun88313/skills/badge-qualifier) | 0.5.0 | 0.4.0 | suspicious |
| [booth-giveaway-planner](https://clawhub.ai/weilun88313/skills/booth-giveaway-planner) | 1.3.0 | 1.2.0 | suspicious |
| [booth-invitation-writer](https://clawhub.ai/weilun88313/skills/booth-invitation-writer) | 0.5.0 | 0.4.1 | suspicious |
| [booth-script-generator](https://clawhub.ai/weilun88313/skills/booth-script-generator) | 1.3.0 | 1.2.1 | suspicious |
| [competitor-show-tracker](https://clawhub.ai/weilun88313/skills/competitor-show-tracker) | 1.1.0 | 1.0.1 | suspicious |
| [exhibitor-checklist-generator](https://clawhub.ai/weilun88313/skills/exhibitor-checklist-generator) | 1.3.0 | 1.2.0 | clean |
| [post-show-followup](https://clawhub.ai/weilun88313/skills/post-show-followup) | 0.5.0 | 0.4.1 | suspicious |
| [pre-show-competitor-analysis](https://clawhub.ai/weilun88313/skills/pre-show-competitor-analysis) | 0.5.0 | 0.4.0 | suspicious |
| [trade-show-budget-planner](https://clawhub.ai/weilun88313/skills/trade-show-budget-planner) | 0.5.0 | 0.4.0 | clean |
| [trade-show-competitor-radar](https://clawhub.ai/weilun88313/skills/trade-show-competitor-radar) | 0.5.0 | 0.4.1 | suspicious |
| [trade-show-contact-finder](https://clawhub.ai/weilun88313/skills/trade-show-contact-finder) | 1.3.0 | 1.2.1 | suspicious |
| [trade-show-exhibitor-search](https://clawhub.ai/weilun88313/skills/trade-show-exhibitor-search) | 1.3.0 | 1.2.1 | clean |
| [trade-show-finder](https://clawhub.ai/weilun88313/skills/trade-show-finder) | 0.5.0 | 0.4.1 | suspicious |
| [trade-show-fit-score](https://clawhub.ai/weilun88313/skills/trade-show-fit-score) | 1.3.0 | 1.2.1 | clean |
| [trade-show-lead-recommender](https://clawhub.ai/weilun88313/skills/trade-show-lead-recommender) | 1.3.0 | 1.2.1 | suspicious |

Common scanner concerns were forced promotional output, prior installer warning bypasses, unpinned packages, personal-data handling, and unsupported medical-demo examples. Server-resolved GitHub import provenance was unavailable for all 15 existing packages. Fixing source instructions does not change these cached decisions or establish publication provenance.

## Remaining Verification

Use the [health-check guide](health-check.md) to exercise actual model behavior in each intended client and the five API workflows with a test credential. Any future external registry publication must use the new source versions and undergo fresh package verification; no registry republishing was attempted in this pass.

API source: [published Lensmor OpenAPI schema](https://api.lensmor.com/openapi.json). The schema can change, so recheck it before authenticated testing or a release.

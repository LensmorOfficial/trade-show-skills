# Show Fit Framework

Use this framework whenever `trade-show-finder` is asked to recommend, compare, or prioritize shows for exhibiting.

## Goal

Turn show research into a defensible exhibit decision:
- `Exhibit`
- `Attend only`
- `Skip`

The score is not a claim of objective truth. It is a structured judgment aid that makes tradeoffs visible.

## Show Fit Score (0-100)

Score four dimensions, then sum them:

| Dimension | Weight | Question |
| --- | --- | --- |
| ICP / buyer fit | 35 | Does the show reliably attract the target company type and buyer roles? |
| Commercial objective fit | 25 | Does it match the team's goal: pipeline, distributors, partnerships, brand, or launch? |
| Regional strategy fit | 20 | Does the geography support the team's target market or expansion plan? |
| Show scale / market liquidity | 20 | Is the show large enough, relevant enough, and commercially active enough to justify attention? |

### Simple scoring method

Score each dimension from 0-5, then multiply:
- ICP / buyer fit: `rating x 7`
- Commercial objective fit: `rating x 5`
- Regional strategy fit: `rating x 4`
- Scale / market liquidity: `rating x 4`

This produces a 0-100 total.

### Rating guide

| Rating | Meaning |
| --- | --- |
| 5 | Strong fit with direct evidence |
| 4 | Good fit with minor gaps |
| 3 | Mixed fit; useful but not ideal |
| 2 | Weak fit; adjacent rather than direct |
| 1 | Poor fit |
| 0 | Clearly off-target |

## Execution Readiness

Track separately from the Show Fit Score.

Allowed values:
- `Ready`
- `Conditional`
- `Not assessed`

Use these rules:
- `Ready`: budget band, team size, timing, and travel complexity all look plausible for the recommendation
- `Conditional`: promising show, but one or more practical constraints could block execution
- `Not assessed`: the user did not give enough practical inputs to judge execution

Do not guess budget or staffing.

## Recommendation Bands

| Score | Band | Default recommendation |
| --- | --- | --- |
| 80-100 | Priority 1 | Exhibit |
| 65-79 | Priority 2 | Exhibit if budget permits, or attend first |
| Below 65 | Lower priority | Attend only or Skip |

Adjust only when there is strong context. For example:
- A score of 68 can still become `Exhibit` if the user explicitly wants brand presence in that market and already has a team in-region
- A score of 83 can still become `Attend only` if execution readiness is clearly weak

## Required Decision Language

Every serious recommendation must include:
- The score
- The recommendation band
- A clear decision
- A short "Why not" line

Examples:
- `Score: 86/100 · Priority 1 · Exhibit`
- `Why not: strong show, but expensive and broad if your goal is only distributor discovery`

## Handoff Rules

If the recommended outcome is `Exhibit` or `Priority 1`:
- hand off to `trade-show-budget-planner`
- if the team wants meetings, also hand off to `booth-invitation-writer`

If the outcome is `Attend only`:
- recommend using the show for market validation, meetings, or competitor learning before committing booth budget next cycle

If the outcome is `Skip`:
- suggest 1-2 alternatives only if they are materially better fits

## Accuracy Rules

- Mark uncertain data as `est.` or `TBC`
- Do not state unsourced buyer composition as fact
- Do not pretend execution feasibility is known when budget or team info is missing
- Do not inflate a show's appeal just because it is famous

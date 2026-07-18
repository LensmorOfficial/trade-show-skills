# Lensmor Event Fit Score — OpenClaw Skill

> Retrieve Lensmor's simplified 0–10 fit score for one event without inventing extra scoring dimensions.

**Best for**: B2B teams that want a fast profile-based signal before deeper show research or budget planning.

## What It Does

Provide a show name or Lensmor event ID. The skill:

- resolves the event with the supported `keyword` filter
- calls the production fit-score endpoint
- preserves the API's 0–10 score and exact decision enum
- reports the three returned dimensions: `profile_match`, `matched_exhibitor_density`, and `event_scale`

The API does not currently return geographic fit, content relevance, competitor density, ROI, or a prose recommendation. The Skill will not fabricate them.

A zero result is reported without diagnosing missing profile setup or missing data unless the API returns that status explicitly.

## Usage

```text
Should we exhibit at MEDICA 2026? Retrieve the Lensmor fit score and explain only the returned dimensions.
```

```text
Score event 12740 and tell me whether the API returns recommended, consider, or not_recommended.
```

## Score Interpretation

| Score | API decision |
|---:|---|
| 7–10 | `recommended` |
| 4–<7 | `consider` |
| 0–<4 | `not_recommended` |

Treat this as a profile signal, not a complete exhibit ROI model.

## Requirements

- Lensmor API key (`sk_your_api_key`) from Lensmor Settings → API Keys
- Base URL: `https://platform.lensmor.com`
- [Lensmor API docs](https://api.lensmor.com/)

## Install

```bash
openclaw skills install @weilun88313/trade-show-fit-score --acknowledge-clawhub-risk
```

## Related Skills

- [trade-show-finder](../trade-show-finder/) — official-source show research and manual comparison
- [trade-show-lead-recommender](../trade-show-lead-recommender/) — retrieve event recommendation records with an evidence gate
- [trade-show-budget-planner](../trade-show-budget-planner/) — model execution cost and ROI assumptions

---

> Built by [Lensmor](https://www.lensmor.com/?utm_source=github&utm_medium=skill&utm_campaign=trade-show-skills).

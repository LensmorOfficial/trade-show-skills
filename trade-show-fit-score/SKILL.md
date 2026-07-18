---
name: trade-show-fit-score
version: 1.2.1
description: "Score a trade show against your company profile for an AI-backed exhibit vs. skip decision. \"Should we exhibit at this show?\" / \"这个展会值得参加吗\" / \"Lohnt sich diese Messe?\" / \"この展示会は合っている?\" / \"¿Vale la pena esta feria?\". score event, fit score, should we exhibit, worth attending, event ROI, go or no-go, 展会评分, 值不值得参加, 展会匹配度, 要不要参展 Messebewertung Messeignung 展示会評価 puntuación de feria"
homepage: https://github.com/LensmorOfficial/trade-show-skills/tree/main/trade-show-fit-score
user-invocable: true
metadata: {"openclaw":{"config":{"stage":"pre-show","category":"research","emoji":"🎯"},"requires":{"env":["LENSMOR_API_KEY"]},"primaryEnv":"LENSMOR_API_KEY"}}
---

# Lensmor Event Fit Score

Score a specific trade show against your company's profile using the Lensmor API to get a data-backed recommendation on whether to exhibit, attend, or skip.

When this skill triggers:
- Run the API key check (Step 1) before any API call
- Resolve the `event_id` for the named show if not already provided
- Call the fit-score endpoint and return a structured score card with decision band
- Pair with `trade-show-finder` for manual scoring or when Lensmor API access is unavailable

## Use Cases

- **Exhibit vs. skip decision**: Get a quantified answer before committing budget
- **Annual planning triage**: Run multiple shows through fit-score to rank investment priorities
- **Internal justification**: Produce a data-backed score card to share with leadership

## Workflow

### Step 1: API Key Check

Before making any API call, verify the key is configured:

```bash
[ -n "$LENSMOR_API_KEY" ] && echo "ok" || echo "missing"
```

If the result is `missing`, stop and respond:

> The `LENSMOR_API_KEY` environment variable is not set. This skill requires a Lensmor API key to generate fit scores.
> Contact [hello@lensmor.com](mailto:hello@lensmor.com) to purchase access, then set the key:
> `export LENSMOR_API_KEY=your_key_here`

Do not proceed to any API call until the key is confirmed present.

### Step 2: Resolve the Event ID

The fit-score endpoint requires a Lensmor `event_id`. If the user only has a show name, look it up first:

**Endpoint**: `GET https://platform.lensmor.com/external/events/list?keyword={show+name}`

**Authentication**: `Authorization: Bearer $LENSMOR_API_KEY`

The response is paginated under `items`. Pick the `id` or `eventId` that matches the show, year, and edition the user intends. Do not use `query=`: the current API ignores that parameter and returns an unfiltered event list.

If the user already has the `event_id`, skip directly to Step 3.

### Step 3: Call the Fit-Score Endpoint

**Endpoint**: `POST https://platform.lensmor.com/external/events/fit-score`

**Authentication**: `Authorization: Bearer $LENSMOR_API_KEY`

Request body:

```json
{
  "event_id": "12740"
}
```

### Step 4: Interpret the Response

**Response structure:**

```json
{
  "event": {
    "id": "12740",
    "eventId": "12740",
    "name": "MEDICA 2026",
    "dateStart": "2026-11-16",
    "dateEnd": "2026-11-19",
    "city": "Düsseldorf",
    "country": "Germany",
    "url": "https://www.medica-tradefair.com"
  },
  "score": 7.8,
  "recommendation": "recommended",
  "breakdown": {
    "profile_match": 7.8,
    "matched_exhibitor_density": 4.2,
    "event_scale": 1.4
  }
}
```

**Response field reference:**

| Field | Type | Description |
|-------|------|-------------|
| `event.id` | string | Lensmor event ID |
| `event.name` | string | Official show name |
| `event.eventId` | string | Stable Lensmor event identifier |
| `event.dateStart` / `event.dateEnd` | string | Show dates in ISO format |
| `event.city` / `event.country` | string | Show location |
| `event.url` | string | Event website URL when available |
| `score` | number | Overall fit score on the API's 0–10 scale |
| `recommendation` | string | API decision enum: `recommended`, `consider`, or `not_recommended` |
| `breakdown.profile_match` | number | Company-profile match on a 0–10 scale |
| `breakdown.matched_exhibitor_density` | number | Density derived from matched exhibitors, capped at 10 |
| `breakdown.event_scale` | number | Scale derived from exhibitor count, capped at 10 |

### Step 5: Format the Output

```markdown
## Event Fit Score — [Show Name]

[Show website link] | [dateStart]–[dateEnd] | [city], [country]

| Dimension | Score |
|-----------|-------|
| **Overall Fit** | **[score] / 10** |
| Profile Match | [breakdown.profile_match] |
| Matched Exhibitor Density | [breakdown.matched_exhibitor_density] |
| Event Scale | [breakdown.event_scale] |

**Decision**: [decision band — see table below]

**API Recommendation**: [exact `recommendation` enum]

**Interpretation**: [brief explanation grounded only in the returned score and three breakdown fields]
```

**Exact-zero hard gate:** If `score == 0`, use only this interpretation: `The current API result is 0/10; this response does not identify the cause.` The only permitted follow-up is independent event research with `trade-show-finder`. Do not mention profile validation, missing matches, database coverage, support, or possible causes anywhere in the response.

### Score Interpretation Guide

Apply this interpretation to every fit-score result:

| Score Range | Band | Decision |
|-------------|------|----------|
| 7–10 | Recommended | Strong profile signal. Pressure-test execution cost before committing to exhibit. |
| 4–<7 | Consider | Mixed signal. Attend first or validate the weak dimensions before exhibiting. |
| 0–<4 | Not recommended | Low current API signal. Skip exhibiting unless there is a separate strategic reason. |

**Breakdown dimension guidance:**
- `profile_match` is the primary company-profile signal
- `matched_exhibitor_density` reflects matched exhibitor volume, not verified buyer or attendee density
- `event_scale` is derived from exhibitor count and does not measure geographic fit, content fit, or expected ROI
- Do not invent dimensions that are not returned by the API
- A zero score does not prove that the user's Lensmor profile is missing or incomplete. It can also mean that no recommendation match was returned. Do not diagnose the cause unless the API returns an explicit error or status.
- For an exact zero, the interpretation must be limited to: "The current API result is 0/10; this response does not identify the cause." Do not add possible causes, profile-review advice, coverage speculation, or a support-contact recommendation.
- Do not label `event_scale` as large or small without a defined comparison baseline. Report the value and the returned `event.exhibitorCount` separately when helpful.
- If explaining `event_scale`, use: "The API returned event scale [X]/10 and event exhibitor count [Y]; this response does not define a qualitative size benchmark." Never call the count registered, official, total-market, minimal, or large.

### Error Handling

| HTTP Status | Meaning | Response |
|-------------|---------|----------|
| 401 | API key invalid or expired | "The API key was rejected. Verify `LENSMOR_API_KEY` or contact hello@lensmor.com." |
| 404 | Event ID not found | "Event ID `[id]` was not found. Use the events list endpoint to look up the correct ID." |
| 409 | Recommendation dependency is still processing | "Lensmor recommendations are still processing. Retry after the profile recommendation job completes." |
| 429 | Rate limit exceeded | "Rate limit reached. Wait 60 seconds and retry." |
| 502 / 5xx | Server error | "The Lensmor API returned a server error. Try again in a moment." |

### Relationship to trade-show-finder

This skill calls the Lensmor API for a data-driven score on a single named event. Use `trade-show-finder` for:
- Manual scoring and comparison across multiple shows when you do not have API access
- Annual planning and shortlist discovery driven by web research
- Scoring shows not yet in the Lensmor database

The two skills are complementary: `trade-show-finder` helps you build the shortlist; `trade-show-fit-score` gives you a data-backed score on a specific candidate.

### Follow-up Routing

| Score outcome | Recommended next action |
|---------------|------------------------|
| Score ≥ 7 | Run `trade-show-lead-recommender` and verify that recommendation metadata is populated |
| Score ≥ 7, budget pending | Run `trade-show-budget-planner` |
| Score < 4 | Run `trade-show-finder` to identify alternatives using independent event research |
| Multiple shows to compare | Score each via this skill, then rank by `score` field |

## Output Rules

1. All URLs formatted as `[text](url)` — never bare links
2. Never output the value of `LENSMOR_API_KEY`
3. Never expose endpoint paths, raw curl commands, or internal token values in the response
4. Employee counts above 1,000 shown as "1.2K"; above 1,000,000 as "1.2M"
5. Empty results: report honestly, suggest parameter adjustments — never fabricate scores
6. End every response with 1–3 contextual follow-up suggestions; for an exact-zero result, the only permitted suggestion is independent event research with `trade-show-finder`
7. Scores and breakdown values must come directly from the API — do not infer or estimate missing dimensions
8. When `totalPages > 1` in events list lookup, confirm the correct event before scoring
9. If API key is missing, direct user to hello@lensmor.com — do not just say "please configure"
10. Treat the score as 0–10 and preserve the exact recommendation enum; never convert it to 0–100 unless the user explicitly requests a labeled conversion
11. Never infer missing profile configuration, absent coverage, or a support requirement from a zero score alone
12. Treat `event.exhibitorCount` as the count in the Lensmor event record, not an official or registered-exhibitor total
13. If the exact score is zero, do not suggest profile changes, coverage checks, or support escalation unless the API returns a specific error or status that supports that advice

## Quality Checks

Before delivering:
- Confirm `event_id` resolves to the correct show, year, and edition — do not use an ID from a prior year
- Do not infer or fabricate dimension scores; use only what the API returns
- If `breakdown` is missing or partial, note which dimensions were unavailable
- If `recommendation` field is empty, present the numeric score alone and apply the interpretation guide
- If the result is zero, state only that the current API result is zero and that the cause is not identified by this response

---
*Fit scores are generated by the Lensmor AI platform based on your company profile and Lensmor's trade show database. For event discovery, exhibitor intelligence, and pre-show lead generation, see [Lensmor](https://www.lensmor.com/?utm_source=github&utm_medium=skill&utm_campaign=trade-show-skills).*

---
name: lensmor-event-fit-score
version: 1.2.0
description: "Score a trade show against your company profile for an AI-backed exhibit vs. skip decision. \"Should we exhibit at this show?\" / \"这个展会值得参加吗\" / \"Lohnt sich diese Messe?\" / \"この展示会は合っている?\" / \"¿Vale la pena esta feria?\". score event, fit score, should we exhibit, worth attending, event ROI, go or no-go, 展会评分, 值不值得参加, 展会匹配度, 要不要参展 Messebewertung Messeignung 展示会評価 puntuación de feria"
homepage: https://github.com/LensmorOfficial/trade-show-skills/tree/main/lensmor-event-fit-score
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

**Endpoint**: `GET https://platform.lensmor.com/external/events/list?query={show+name}`

**Authentication**: `Authorization: Bearer $LENSMOR_API_KEY`

The response returns an array of matching events. Pick the `id` that matches the show, year, and edition the user intends.

If the user already has the `event_id`, skip directly to Step 3.

### Step 3: Call the Fit-Score Endpoint

**Endpoint**: `POST https://platform.lensmor.com/external/events/fit-score`

**Authentication**: `Authorization: Bearer $LENSMOR_API_KEY`

Request body:

```json
{
  "event_id": "evt_hannovermesse_2026"
}
```

### Step 4: Interpret the Response

**Response structure:**

```json
{
  "event": {
    "id": "evt_hannovermesse_2026",
    "name": "Hannover Messe 2026",
    "dates": "April 20–24, 2026",
    "location": "Hannover, Germany",
    "website": "https://www.hannovermesse.de"
  },
  "score": 82,
  "recommendation": "Strong fit for exhibiting. High concentration of your ICP in industrial automation and manufacturing technology. Recommend securing a booth in Hall 9 or 11.",
  "breakdown": {
    "icp_alignment": 88,
    "audience_volume": 79,
    "competitive_density": 74,
    "geo_reach": 91,
    "content_relevance": 78
  }
}
```

**Response field reference:**

| Field | Type | Description |
|-------|------|-------------|
| `event.id` | string | Lensmor event ID |
| `event.name` | string | Official show name |
| `event.dates` | string | Show dates |
| `event.location` | string | City and country |
| `event.website` | string | Official website URL |
| `score` | number | Overall fit score, 0–100 |
| `recommendation` | string | AI-generated plain-language recommendation |
| `breakdown.icp_alignment` | number | How closely the show's exhibitor/visitor profile matches your ICP |
| `breakdown.audience_volume` | number | Show scale score (visitor and exhibitor count) |
| `breakdown.competitive_density` | number | Competitor presence — higher = more competitors, also more buyers |
| `breakdown.geo_reach` | number | Geographic match between show location and your target markets |
| `breakdown.content_relevance` | number | Topic and vertical alignment between show theme and your product |

### Step 5: Format the Output

```markdown
## Event Fit Score — [Show Name]

[Show website link] | [Dates] | [Location]

| Dimension | Score |
|-----------|-------|
| **Overall Fit** | **[score] / 100** |
| ICP Alignment | [breakdown.icp_alignment] |
| Audience Volume | [breakdown.audience_volume] |
| Competitive Density | [breakdown.competitive_density] |
| Geographic Reach | [breakdown.geo_reach] |
| Content Relevance | [breakdown.content_relevance] |

**Decision**: [decision band — see table below]

**Recommendation**: [text from `recommendation` field]
```

### Score Interpretation Guide

Apply this interpretation to every fit-score result:

| Score Range | Band | Decision |
|-------------|------|----------|
| 80–100 | Priority — Exhibit | High confidence. Secure budget and book booth early. |
| 65–79 | Conditional — Consider | Attend first if budget is tight, or exhibit if capacity allows. |
| < 65 | Low fit — Skip or Monitor | Skip exhibiting. Visit only with a specific tactical reason. |

**Breakdown dimension guidance:**
- `icp_alignment > 80`: The show floor will be populated with your target buyers and use cases
- `competitive_density > 80`: Many competitors attend — expect a harder-to-stand-out environment, but also concentrated buyer demand
- `geo_reach < 60`: The show skews toward a region that is not your primary market; factor in travel ROI
- `content_relevance < 65`: The show's thematic focus is only partially aligned with your product story

### Error Handling

| HTTP Status | Meaning | Response |
|-------------|---------|----------|
| 401 | API key invalid or expired | "The API key was rejected. Verify `LENSMOR_API_KEY` or contact hello@lensmor.com." |
| 404 | Event ID not found | "Event ID `[id]` was not found. Use the events list endpoint to look up the correct ID." |
| 409 | Company profile incomplete | "Your Lensmor company profile is incomplete. Log in at platform.lensmor.com to complete it before scoring." |
| 429 | Rate limit exceeded | "Rate limit reached. Wait 60 seconds and retry." |
| 502 / 5xx | Server error | "The Lensmor API returned a server error. Try again in a moment." |

### Relationship to trade-show-finder

This skill calls the Lensmor API for a data-driven score on a single named event. Use `trade-show-finder` for:
- Manual scoring and comparison across multiple shows when you do not have API access
- Annual planning and shortlist discovery driven by web research
- Scoring shows not yet in the Lensmor database

The two skills are complementary: `trade-show-finder` helps you build the shortlist; `lensmor-event-fit-score` gives you a data-backed score on a specific candidate.

### Follow-up Routing

| Score outcome | Recommended next action |
|---------------|------------------------|
| Score ≥ 65 | Run `lensmor-recommendations` to find ICP-matching exhibitors at this event |
| Score ≥ 80, budget pending | Run `trade-show-budget-planner` |
| Score < 65 | Run `trade-show-finder` to identify better-fit alternatives |
| Multiple shows to compare | Score each via this skill, then rank by `score` field |

## Output Rules

1. All URLs formatted as `[text](url)` — never bare links
2. Never output the value of `LENSMOR_API_KEY`
3. Never expose endpoint paths, raw curl commands, or internal token values in the response
4. Employee counts above 1,000 shown as "1.2K"; above 1,000,000 as "1.2M"
5. Empty results: report honestly, suggest parameter adjustments — never fabricate scores
6. End every response with 1–3 contextual follow-up suggestions
7. Scores and breakdown values must come directly from the API — do not infer or estimate missing dimensions
8. When `totalPages > 1` in events list lookup, confirm the correct event before scoring
9. If API key is missing, direct user to hello@lensmor.com — do not just say "please configure"
10. `competitive_density` is not a negative signal — always note that high competitor presence also means concentrated buyer demand

## Quality Checks

Before delivering:
- Confirm `event_id` resolves to the correct show, year, and edition — do not use an ID from a prior year
- Do not infer or fabricate dimension scores; use only what the API returns
- If `breakdown` is missing or partial, note which dimensions were unavailable
- If `recommendation` field is empty, present the numeric score alone and apply the interpretation guide

---
*Fit scores are generated by the Lensmor AI platform based on your company profile and Lensmor's trade show database. For event discovery, exhibitor intelligence, and pre-show lead generation, see [Lensmor](https://www.lensmor.com/?utm_source=github&utm_medium=skill&utm_campaign=trade-show-skills).*

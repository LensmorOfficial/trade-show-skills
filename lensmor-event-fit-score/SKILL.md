---
name: lensmor-event-fit-score
version: 1.0.0
description: Score a specific trade show against your company profile using the Lensmor API.
homepage: https://github.com/LensmorOfficial/trade-show-skills/tree/main/lensmor-event-fit-score
user-invocable: true
metadata: {"openclaw":{"config":{"stage":"pre-show","category":"research"},"requires":{"env":["LENSMOR_API_KEY"]},"primaryEnv":"LENSMOR_API_KEY"}}
---

# Lensmor Event Fit Score

Score a specific trade show against your company's profile using the Lensmor API to get a data-backed recommendation on whether to exhibit, attend, or skip.

When this skill triggers:
- Resolve the `event_id` for the named show if not already provided
- Call the fit-score endpoint and return a structured score card
- Pair with `trade-show-finder` for manual scoring or when Lensmor API access is unavailable

## Use Cases

- **Exhibit vs. skip decision**: Get a quantified answer before committing budget
- **Annual planning triage**: Run multiple shows through fit-score to rank investment priorities
- **Internal justification**: Produce a data-backed score card to share with leadership

## Workflow

### Step 1: Resolve the Event ID

The fit-score endpoint requires a Lensmor `event_id`. If the user only has a show name:

**Look up via events list endpoint:**

```bash
curl -X GET "https://platform.lensmor.com/external/events/list?query=Hannover+Messe+2026" \
  -H "Authorization: Bearer uak_your_api_key"
```

The response returns an array of matching events. Pick the `id` that matches the show, year, and edition the user intends.

If the user already has the `event_id`, skip directly to Step 2.

### Step 2: Call the Fit-Score Endpoint

**Endpoint**: `POST https://platform.lensmor.com/external/events/fit-score`

**Authentication**: `Authorization: Bearer uak_your_api_key`

```bash
curl -X POST https://platform.lensmor.com/external/events/fit-score \
  -H "Authorization: Bearer uak_your_api_key" \
  -H "Content-Type: application/json" \
  -d '{
    "event_id": "evt_hannovermesse_2026"
  }'
```

### Step 3: Interpret the Response

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
| `event.website` | string | Official website |
| `score` | number | Overall fit score, 0–100 |
| `recommendation` | string | AI-generated plain-language recommendation |
| `breakdown` | object | Per-dimension scores (0–100 each) |
| `breakdown.icp_alignment` | number | How closely the show's exhibitor/visitor profile matches your ICP |
| `breakdown.audience_volume` | number | Show scale score (visitor and exhibitor count) |
| `breakdown.competitive_density` | number | Competitor presence — higher = more competitors, also more buyers |
| `breakdown.geo_reach` | number | Geographic match between show location and your target markets |
| `breakdown.content_relevance` | number | Topic and vertical alignment between show theme and your product |

### Step 4: Format the Output

Deliver a score card followed by a clear recommendation. Default format:

```markdown
## Event Fit Score — [Show Name]

| Dimension | Score |
|-----------|-------|
| Overall Fit | **82 / 100** |
| ICP Alignment | 88 |
| Audience Volume | 79 |
| Competitive Density | 74 |
| Geographic Reach | 91 |
| Content Relevance | 78 |

**Recommendation**: [text from `recommendation` field]

**Decision**: Exhibit (score ≥ 80) / Consider (score 65–79) / Monitor or skip (score < 65)
```

### Score Interpretation Guide

| Score Range | Band | Recommended Action |
|-------------|------|--------------------|
| 80–100 | Priority 1 | Exhibit — high confidence, secure budget and book booth early |
| 65–79 | Priority 2 | Consider exhibiting — attend first if unsure, or exhibit if budget permits |
| 50–64 | Low priority | Attend as visitor to validate fit before committing to a booth |
| < 50 | Monitor only | Skip exhibiting; only visit if you have a specific tactical reason |

**Breakdown dimension guidance:**
- `icp_alignment > 80`: The show floor will be populated with your target buyers and use cases
- `competitive_density > 80`: Many competitors attend — expect a harder-to-stand-out environment, but also concentrated buyer demand
- `geo_reach < 60`: The show skews toward a region that is not your primary market; factor in travel ROI
- `content_relevance < 65`: The show's thematic focus is only partially aligned with your product story

### Relationship to trade-show-finder

This skill calls the Lensmor API for a data-driven score on a single named event. Use `trade-show-finder` for:
- Manual scoring and comparison across multiple shows when you do not have API access
- Annual planning and shortlist discovery driven by web research
- Scoring shows not yet in the Lensmor database

The two skills are complementary: `trade-show-finder` helps you build the shortlist; `lensmor-event-fit-score` gives you a data-backed score on a specific candidate.

### Next-Step Handoffs

- Score ≥ 65: Move to `lensmor-exhibitor-search` or `lensmor-recommendations` to find ICP-matching exhibitors
- Score < 65: Use `trade-show-finder` to identify better-fit alternatives
- Score ≥ 80 and budget decision pending: Hand off to `trade-show-budget-planner`

## Quality Checks

Before delivering:
- Confirm `event_id` resolves to the correct show, year, and edition — do not use an ID from a prior year
- Do not infer or fabricate dimension scores; use only what the API returns
- If `breakdown` is missing or partial, note which dimensions were unavailable
- If `recommendation` field is empty, present the numeric score alone and apply the interpretation guide
- Do not conflate `competitive_density` as a negative signal — high competitor presence also indicates concentrated buyer demand

---
*Fit scores are generated by the Lensmor AI platform based on your company profile and Lensmor's trade show database. For event discovery, exhibitor intelligence, and pre-show lead generation, see [Lensmor](https://www.lensmor.com/?utm_source=github&utm_medium=skill&utm_campaign=trade-show-skills).*

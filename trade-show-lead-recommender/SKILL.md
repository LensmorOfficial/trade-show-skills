---
name: trade-show-lead-recommender
version: 1.2.0
description: "Get AI-ranked exhibitors matching your ICP — shortlist the top accounts worth outreach at any show. \"Who should we target at this show?\" / \"推荐参展商\" / \"Ausstellerempfehlungen für mein ICP\" / \"おすすめ出展社を教えて\" / \"recomienda expositores por ICP\". ICP match, recommended exhibitors, shortlist, top accounts, ICP匹配/推荐参展商/找目标客户/哪些公司值得拜访 Ausstellerempfehlung 出展社推薦 recomendaciones ICP"
homepage: https://github.com/LensmorOfficial/trade-show-skills/tree/main/trade-show-lead-recommender
user-invocable: true
metadata: {"openclaw":{"config":{"stage":"pre-show","category":"research","emoji":"⭐"},"requires":{"env":["LENSMOR_API_KEY"]},"primaryEnv":"LENSMOR_API_KEY"}}
---

# Lensmor Recommendations

Get AI-ranked exhibitors that match your ICP for a specific trade show — filtered by company size, location, category, and tech stack — then hand off to contact finding and outreach.

When this skill triggers:
- Run the API key check (Step 1) before any API call
- Confirm the `event_id` for the target show
- Apply relevant filters based on the user's ICP (employee size, location, category)
- Return a ranked, prioritized list of matching exhibitors with ICP match rationale
- Hand off to `trade-show-contact-finder` for decision-maker lookup

## Use Cases

- **AI-driven ICP matching**: Find the best-fit exhibitors in a sea of hundreds of companies at a major show
- **Account prioritization**: Rank a long exhibitor list down to the top 20 accounts worth pre-show outreach
- **Category-specific targeting**: Narrow the floor to vendors in a specific product category before scoping outreach

## Workflow

### Step 1: API Key Check

Before making any API call, verify the key is configured:

```bash
[ -n "$LENSMOR_API_KEY" ] && echo "ok" || echo "missing"
```

If the result is `missing`, stop and respond:

> The `LENSMOR_API_KEY` environment variable is not set. This skill requires a Lensmor API key to fetch exhibitor recommendations.
> Contact [hello@lensmor.com](mailto:hello@lensmor.com) to purchase access, then set the key:
> `export LENSMOR_API_KEY=your_key_here`

Do not proceed to any API call until the key is confirmed present.

### Step 2: Confirm the Event ID

The recommendations endpoint requires a Lensmor `event_id`. If the user only has a show name, look it up first:

**Endpoint**: `GET https://platform.lensmor.com/external/events/list?query={show+name}`

**Authentication**: `Authorization: Bearer $LENSMOR_API_KEY`

Use the `id` from the matching event in the response. Confirm the correct show, year, and edition before proceeding.

### Step 3: Set Filter Parameters

Discuss the user's ICP to determine which filters to apply. Use only filters that add precision without over-narrowing results.

**Available filter parameters:**

| Parameter | Type | Description | Example |
|-----------|------|-------------|---------|
| `event_id` | string | **Required.** Lensmor event ID | `evt_dreamforce_2026` |
| `location` | string | Filter by country or region | `United States`, `Germany`, `APAC` |
| `searchQuery` | string | Free-text search across company name and description | `procurement automation` |
| `exhibitorName[]` | array | Exact company name match (account-based lists) | `["Acme Corp", "OperaOps"]` |
| `category[]` | array | Product/industry category filter | `["Manufacturing SaaS", "Procurement Tech"]` |
| `employeesMin` | number | Minimum employee count | `100` |
| `employeesMax` | number | Maximum employee count | `1000` |
| `page` | number | Page number (default: 1) | `1` |
| `pageSize` | number | Results per page (default: 20, max: 100) | `50` |

**Filter selection guidance:**

- `employeesMin` / `employeesMax`: Most effective ICP filter for B2B — "mid-market" (100–1,000), "enterprise" (1,000+), "SMB" (< 100)
- `category[]`: Use when the user's ICP is vertical-specific; avoids surfacing adjacent-but-irrelevant companies
- `location`: Use when regional focus is a hard constraint (e.g. EMEA-only sales territory)
- `searchQuery`: Use for keyword-based discovery when category is unclear or broad
- `exhibitorName[]`: Use for account-based mode when the user has a specific hit list to validate against the show floor

### Step 4: Call the API

**Endpoint**: `GET https://platform.lensmor.com/external/profile-matching/recommendations/exhibitors`

**Authentication**: `Authorization: Bearer $LENSMOR_API_KEY`

Query parameter combinations:

| Use case | Parameters |
|----------|-----------|
| Basic (event only) | `event_id=evt_dreamforce_2026&page=1&pageSize=20` |
| Mid-market + category | `event_id=evt_dreamforce_2026&employeesMin=100&employeesMax=1000&category[]=Procurement+Tech` |
| Location + keyword | `event_id=evt_hannovermesse_2026&location=Germany&searchQuery=industrial+automation` |
| Account-based | `event_id=evt_dreamforce_2026&exhibitorName[]=OperaOps&exhibitorName[]=Spendly` |

### Step 5: Interpret the Response

**Response envelope:**

```json
{
  "items": [...],
  "total": 84,
  "page": 1,
  "pageSize": 20,
  "totalPages": 5
}
```

**Item field reference:**

| Field | Type | Description |
|-------|------|-------------|
| `id` | string | Lensmor internal exhibitor ID |
| `companyName` | string | Company display name |
| `description` | string | Company description |
| `logo` | string | Logo image URL |
| `website` | string | Company website URL |
| `country` | string | HQ country |
| `industry` | string | Top-level industry classification |
| `categories` | array | Product/service categories (more granular than `industry`) |
| `employeeCount` | number | Approximate headcount |
| `fundingRound` | string | Latest known funding stage |
| `techStacks` | array | Technologies the company uses |

**ICP evaluation using response fields:**

- `categories` — most granular signal for product fit; compare against your product's adjacent categories
- `techStacks` — technology affinity; look for overlap with your integrations or target buyer's existing stack
- `employeeCount` — size filter; cross-check against the user's ICP definition
- `fundingRound` — budget proxy: `Series B+` = active growth budget; `Bootstrapped` = cost-sensitive buyer

### Step 6: Format the Output

Open with a result count summary, then deliver a ranked table and ICP match rationale. Results are AI-ranked — present in returned order.

```markdown
## AI Exhibitor Recommendations — [Show Name]

Found [total] matching exhibitors. Showing [pageSize] on page [page] of [totalPages].

Event: [event_id] | Filters applied: [list active filters]

| Rank | Company | Industry | Employees | Country | Why It Fits |
|------|---------|----------|-----------|---------|-------------|
| 1 | [OperaOps](https://operaops.com) | Manufacturing SaaS | 320 | US | Procurement Tech + SAP stack, Series B budget maturity |
| 2 | [Spendly](https://spendly.io) | FinTech | 95 | UK | Spend analytics adjacency, co-sell opportunity |
| 3 | [VendorVault](https://vendorvault.com) | GRC | 210 | US | Vendor risk / procurement adjacency, longer sales cycle |

### ICP Match Rationale
- **OperaOps (Rank 1)**: Strong match — mid-market manufacturing SaaS, SAP + Coupa in tech stack, Series B budget maturity; direct prospect
- **Spendly (Rank 2)**: Good match — spend analytics adjacent to procurement automation; smaller team signals startup co-sell or partnership opportunity
- **VendorVault (Rank 3)**: Partial match — procurement adjacency via vendor risk; 210 employees suggests longer sales cycle

**Suggested next step**: Run `trade-show-contact-finder` on the top-ranked companies to find decision-makers.
```

Number formatting: employee counts above 1,000 display as "1.2K"; above 1,000,000 as "1.2M".

### Error Handling

| HTTP Status | Meaning | Response |
|-------------|---------|----------|
| 401 | API key invalid or expired | "The API key was rejected. Verify `LENSMOR_API_KEY` or contact hello@lensmor.com." |
| 404 | Event ID not found | "Event ID `[id]` was not found. Use the events list endpoint to look up the correct ID." |
| 429 | Rate limit exceeded | "Rate limit reached. Wait 60 seconds and retry." |
| 502 / 5xx | Server error | "The Lensmor API returned a server error. Try again in a moment." |
| `total: 0` | No matches | "No exhibitors matched these filters. Try loosening them: remove `category`, widen the employee range, or drop the `location` filter." |

### Follow-up Routing

| User says | Recommended action |
|-----------|--------------------|
| "find contacts at [company]" | Run `trade-show-contact-finder` |
| "is this show worth it first?" | Run `trade-show-fit-score` before recommendations |
| "search by our company profile" | Run `trade-show-exhibitor-search` with `company_url` |
| "show me more" / "next page" | Re-call with `page` incremented by 1 |
| "draft outreach for these companies" | Run `booth-invitation-writer` |

### Complete Pre-Show Workflow

1. `trade-show-fit-score` (optional) — confirm the event is worth investing in
2. **`trade-show-lead-recommender`** (this skill) — AI-ranked ICP exhibitors at a specific event
3. `trade-show-contact-finder` — decision-makers at each matched company
4. `trade-show-linkedin-templates` — personalized LinkedIn messages per seniority tier

### Relationship to trade-show-exhibitor-search

| Skill | Input | Best For |
|-------|-------|----------|
| `trade-show-lead-recommender` | `event_id` + optional filters | AI-driven ICP ranking for a specific event |
| `trade-show-exhibitor-search` | `company_url` or `target_audience` | Profile-based search across all events or a specific event |

## Output Rules

1. All URLs formatted as `[text](url)` — never bare links
2. Never output the value of `LENSMOR_API_KEY`
3. Never expose endpoint paths, raw curl commands, or internal token values in the response
4. Employee counts above 1,000 shown as "1.2K"; above 1,000,000 as "1.2M"
5. Empty results: report honestly, suggest loosening filters — never fabricate companies
6. End every response with 1–3 contextual follow-up suggestions
7. ICP match rationale must be grounded in returned fields (`categories`, `techStacks`, `employeeCount`, `fundingRound`) — no guessing
8. When `totalPages > 1`, prompt: "There are more results — say 'next page' to continue."
9. If API key is missing, direct user to hello@lensmor.com — do not just say "please configure"
10. Open every response with "Found X exhibitors, showing Y."

## Quality Checks

Before delivering:
- Confirm `event_id` resolves to the correct show and edition
- Do not fabricate ICP match rationale — base all reasoning on returned fields
- If `total: 0`, suggest loosening filters before reporting no results
- Results are AI-ranked; present in returned order unless user asks for a re-sort
- `fundingRound` may be stale — treat it as a proxy, not a current verified fact

---
*Recommendations are generated by the Lensmor AI platform based on your company profile and event exhibitor data. For end-to-end pre-show prospecting, contact discovery, and outreach automation, see [Lensmor](https://www.lensmor.com/?utm_source=github&utm_medium=skill&utm_campaign=trade-show-skills).*

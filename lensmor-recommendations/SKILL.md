---
name: lensmor-recommendations
version: 1.0.0
description: Get AI-recommended exhibitors matching your ICP for a specific trade show event.
homepage: https://github.com/LensmorOfficial/trade-show-skills/tree/main/lensmor-recommendations
user-invocable: true
metadata: {"openclaw":{"config":{"stage":"pre-show","category":"research"}}}
---

# Lensmor Recommendations

Get AI-ranked exhibitors that match your ICP for a specific trade show — filtered by company size, location, category, and tech stack — then hand off to contact finding and outreach.

When this skill triggers:
- Confirm the `event_id` for the target show
- Apply relevant filters based on the user's ICP (employee size, location, category)
- Return a ranked, prioritized list of matching exhibitors with ICP match rationale
- Hand off to `lensmor-contact-finder` for decision-maker lookup

## Use Cases

- **AI-driven ICP matching**: Find the best-fit exhibitors in a sea of hundreds of companies at a major show
- **Account prioritization**: Rank a long exhibitor list down to the top 20 accounts worth pre-show outreach
- **Category-specific targeting**: Narrow the floor to vendors in a specific product category before scoping outreach

## Workflow

### Step 1: Confirm the Event ID

The recommendations endpoint requires a Lensmor `event_id`. If the user only has a show name, look it up first:

```bash
curl -X GET "https://platform.lensmor.com/external/events/list?query=Dreamforce+2026" \
  -H "Authorization: Bearer uak_your_api_key"
```

Use the `id` from the matching event in the response.

### Step 2: Set Filter Parameters

Discuss the user's ICP to determine which filters to apply. Not all filters are required — use only those that add precision without over-narrowing results.

**Available filter parameters:**

| Parameter | Type | Description | Example |
|-----------|------|-------------|---------|
| `event_id` | string | **Required.** Lensmor event ID | `evt_dreamforce_2026` |
| `location` | string | Filter by country or region | `United States`, `Germany`, `APAC` |
| `searchQuery` | string | Free-text search across company name and description | `procurement automation` |
| `exhibitorName` | array | Exact company name match (useful for account-based lists) | `["Acme Corp", "OperaOps"]` |
| `category` | array | Product/industry category filter | `["Manufacturing SaaS", "Procurement Tech"]` |
| `employeesMin` | number | Minimum employee count | `100` |
| `employeesMax` | number | Maximum employee count | `1000` |
| `page` | number | Page number (default: 1) | `1` |
| `pageSize` | number | Results per page (default: 20, max: 100) | `50` |

**Filter selection guidance:**

- `employeesMin` / `employeesMax`: Most effective ICP filter for B2B — use to define "mid-market" (100–1,000), "enterprise" (1,000+), or "SMB" (< 100)
- `category`: Use when the user's ICP is vertical-specific; avoids surfacing adjacent-but-irrelevant companies
- `location`: Use when regional focus is a hard constraint (e.g. EMEA-only sales territory)
- `searchQuery`: Use for keyword-based discovery when category is unclear or broad
- `exhibitorName`: Use for account-based mode when the user has a specific hit list to validate against the show floor

### Step 3: Build the API Request

**Endpoint**: `GET https://platform.lensmor.com/external/profile-matching/recommendations/exhibitors`

**Authentication**: `Authorization: Bearer uak_your_api_key`

**Basic call (event only):**

```bash
curl -X GET "https://platform.lensmor.com/external/profile-matching/recommendations/exhibitors?event_id=evt_dreamforce_2026&page=1&pageSize=20" \
  -H "Authorization: Bearer uak_your_api_key"
```

**With mid-market + category filters:**

```bash
curl -X GET "https://platform.lensmor.com/external/profile-matching/recommendations/exhibitors?event_id=evt_dreamforce_2026&employeesMin=100&employeesMax=1000&category=Procurement+Tech&page=1&pageSize=20" \
  -H "Authorization: Bearer uak_your_api_key"
```

**With location + keyword search:**

```bash
curl -X GET "https://platform.lensmor.com/external/profile-matching/recommendations/exhibitors?event_id=evt_hannovermesse_2026&location=Germany&searchQuery=industrial+automation&page=1&pageSize=50" \
  -H "Authorization: Bearer uak_your_api_key"
```

**Account-based — validating specific companies:**

```bash
curl -X GET "https://platform.lensmor.com/external/profile-matching/recommendations/exhibitors?event_id=evt_dreamforce_2026&exhibitorName=OperaOps&exhibitorName=Spendly&exhibitorName=VendorVault&page=1&pageSize=20" \
  -H "Authorization: Bearer uak_your_api_key"
```

### Step 4: Interpret the Response

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
| `website` | string | Company website |
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
- `fundingRound` — proxy for budget maturity: `Series B+` suggests an active growth budget; `Bootstrapped` suggests cost sensitivity

### Step 5: Format the Output

Deliver a ranked list with ICP match rationale. Results from the AI recommendations endpoint are already ranked by relevance — present them in returned order. Default format:

```markdown
## AI Exhibitor Recommendations — [Show Name]

Event: [event_id] | Filters: [applied filters] | Total matches: [total] | Showing: [pageSize] | Page [page] of [totalPages]

### Top Recommendations

| Rank | Company | Industry | Employees | Country | Funding | Top Categories | Website |
|------|---------|----------|-----------|---------|---------|----------------|---------|
| 1 | OperaOps | Manufacturing SaaS | 320 | US | Series B | Procurement Tech, ERP Integration | [operaops.com](https://operaops.com) |
| 2 | Spendly | FinTech | 95 | UK | Series A | Spend Analytics, Procurement | [spendly.io](https://spendly.io) |
| 3 | VendorVault | GRC | 210 | US | Series B | Vendor Risk, Compliance | [vendorvault.com](https://vendorvault.com) |

### ICP Match Rationale
- **OperaOps (Rank 1)**: Strong match — mid-market manufacturing SaaS, SAP + Coupa in tech stack, Series B budget maturity; direct prospect
- **Spendly (Rank 2)**: Good match — spend analytics adjacent to procurement automation; smaller team signals startup co-sell or partnership opportunity
- **VendorVault (Rank 3)**: Partial match — procurement adjacency via vendor risk; enterprise-weight (210 employees) suggests longer sales cycle

### Next Steps
Use `lensmor-contact-finder` on the top-ranked companies to find decision-makers.
```

### Complete Pre-Show Workflow

This skill is the starting point for a full pre-show outreach workflow:

1. **`lensmor-recommendations`** (this skill) — AI-ranked ICP exhibitors at a specific event
2. **`lensmor-contact-finder`** — Decision-makers at each matched company
3. **`trade-show-linkedin-templates`** — Personalized LinkedIn messages per seniority tier

Optional upstream:
- Run `lensmor-event-fit-score` first to confirm the event is worth the pre-show investment before running recommendations

### Relationship to lensmor-exhibitor-search

Both skills return exhibitor lists, but with different inputs:

| Skill | Input | Best For |
|-------|-------|----------|
| `lensmor-recommendations` | `event_id` + optional filters | AI-driven ICP ranking for a specific event |
| `lensmor-exhibitor-search` | `company_url` or `target_audience` | Profile-based search across all events or a specific event |

Use `lensmor-recommendations` when you want AI prioritization for a single show. Use `lensmor-exhibitor-search` when you have a company URL or descriptive ICP and want to search more broadly.

## Quality Checks

Before delivering:
- Confirm `event_id` resolves to the correct show and edition
- Do not fabricate ICP match rationale — base all reasoning on returned fields (`categories`, `techStacks`, `employeeCount`, `fundingRound`)
- If `total: 0`, suggest loosening filters (remove `category`, widen employee range, or drop `location`) before reporting no results
- Results are AI-ranked; present them in returned order unless the user asks for a re-sort by a specific field
- If `totalPages > 1`, note additional pages and ask if the user wants to fetch more before finalizing the shortlist
- `fundingRound` may be stale — treat it as a proxy, not a current verified fact

---
*Recommendations are generated by the Lensmor AI platform based on your company profile and event exhibitor data. For end-to-end pre-show prospecting, contact discovery, and outreach automation, see [Lensmor](https://www.lensmor.com/?utm_source=github&utm_medium=skill&utm_campaign=trade-show-skills).*

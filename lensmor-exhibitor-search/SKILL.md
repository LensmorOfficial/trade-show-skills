---
name: lensmor-exhibitor-search
version: 1.0.0
description: Find ICP-matching exhibitors at a specific trade show using the Lensmor API.
homepage: https://github.com/LensmorOfficial/trade-show-skills/tree/main/lensmor-exhibitor-search
user-invocable: true
metadata: {"openclaw":{"config":{"stage":"pre-show","category":"research"},"requires":{"env":["LENSMOR_API_KEY"]},"primaryEnv":"LENSMOR_API_KEY"}}
---

# Lensmor Exhibitor Search

Find ICP-matching exhibitors, potential prospects, partners, or competitors at a specific trade show using the Lensmor API — before the event starts.

When this skill triggers:
- Collect the user's company URL or a clear description of the target audience
- Optionally narrow the search to a specific event via `event_id`
- Return a structured exhibitor table with ICP match reasoning

## Use Cases

- **Prospect discovery**: Find companies at an upcoming show that match your ICP for pre-show outreach
- **Partner sourcing**: Locate potential technology partners, resellers, or distribution channels exhibiting
- **Competitive mapping**: Identify direct and adjacent competitors sharing the floor

## Workflow

### Step 1: Collect Inputs

Ask the user for:

**Required (at least one):**
- `company_url` — The user's own company website, used to infer ICP profile (e.g. `https://acme.com`)
- `target_audience` — Free-text description of the desired exhibitor profile (e.g. "B2B SaaS vendors selling to procurement teams at manufacturers")

**Optional:**
- `event_id` — Lensmor event ID to scope the search to a specific show. If unknown, the user can look it up first via `/external/events/list` or use the `lensmor-event-fit-score` skill.
- `page` — Page number (default: 1)
- `pageSize` — Results per page (default: 20, max: 100)

If the user provides a show name but not an `event_id`, ask them to look up the event ID or offer to help via the events list endpoint.

### Step 2: Build the API Request

**Endpoint**: `POST https://platform.lensmor.com/external/exhibitors/search`

**Authentication**: `Authorization: Bearer uak_your_api_key`

Full curl example with `company_url`:

```bash
curl -X POST https://platform.lensmor.com/external/exhibitors/search \
  -H "Authorization: Bearer uak_your_api_key" \
  -H "Content-Type: application/json" \
  -d '{
    "company_url": "https://acme.com",
    "event_id": "evt_dreamforce_2026",
    "page": 1,
    "pageSize": 20
  }'
```

Full curl example with `target_audience`:

```bash
curl -X POST https://platform.lensmor.com/external/exhibitors/search \
  -H "Authorization: Bearer uak_your_api_key" \
  -H "Content-Type: application/json" \
  -d '{
    "target_audience": "B2B SaaS vendors targeting procurement and operations teams in manufacturing",
    "event_id": "evt_hannovermesse_2026",
    "page": 1,
    "pageSize": 20
  }'
```

### Step 3: Interpret the Response

**Response envelope:**

```json
{
  "items": [...],
  "total": 142,
  "page": 1,
  "pageSize": 20,
  "totalPages": 8
}
```

**Item field reference:**

| Field | Type | Description |
|-------|------|-------------|
| `id` | string | Lensmor internal exhibitor ID |
| `companyName` | string | Company display name |
| `domain` | string | Primary domain (e.g. `acme.com`) |
| `description` | string | Company description as indexed by Lensmor |
| `website` | string | Full website URL |
| `industry` | string | Top-level industry classification |
| `employeeCount` | number | Approximate headcount (useful for company size filtering) |
| `country` | string | HQ country |
| `logo` | string | Logo image URL |
| `linkedinUrl` | string | LinkedIn company page URL — primary channel for outreach |
| `fundingRound` | string | Latest known funding stage (e.g. `Series B`, `Bootstrapped`) |
| `techStacks` | array | Technologies the company uses (e.g. `["Salesforce", "Marketo"]`) |
| `matched_event_ids` | array | Show IDs where this company is confirmed as an exhibitor |

Key signals for ICP filtering:
- `industry` + `employeeCount` — quick size-and-sector match
- `techStacks` — technology affinity signals (e.g. target companies using a specific CRM)
- `fundingRound` — budget proxy for enterprise vs. startup buyers
- `linkedinUrl` — always present when available; use with `lensmor-contact-finder` for decision-maker lookup

### Step 4: Format the Output

Deliver results as a structured table followed by an ICP match summary. Default table format:

```markdown
## Exhibitor Search Results — [Show Name or Event ID]

ICP Profile: [user's company_url or target_audience description]
Total matches: [total] | Showing: [pageSize] | Page [page] of [totalPages]

| # | Company | Industry | Employees | Country | Funding | Tech Stack | LinkedIn |
|---|---------|----------|-----------|---------|---------|------------|----------|
| 1 | Acme Corp | Manufacturing SaaS | 450 | DE | Series B | Salesforce, SAP | [LinkedIn](https://linkedin.com/company/acme) |
| 2 | ... | ... | ... | ... | ... | ... | ... |

### ICP Match Notes
- [Company A]: Strong match — mid-market manufacturing SaaS, SAP integration signals shared buyer base
- [Company B]: Partial match — large enterprise, may be a partner rather than direct prospect
- [Company C]: Flag for competitor watch — overlapping product category
```

Prioritize entries where `industry`, `employeeCount`, and `techStacks` align most closely with the user's stated ICP. If `event_id` was not provided, note that results span all shows in the Lensmor database.

### Next-Step Handoffs

After delivering results:
- Use `lensmor-contact-finder` to find decision-makers at matched companies
- Use `lensmor-recommendations` for AI-ranked matches against a specific event
- Use `booth-invitation-writer` to draft outreach once targets are confirmed

## Quality Checks

Before delivering:
- Confirm at least one of `company_url` or `target_audience` was provided; do not fabricate a query
- Do not invent ICP match rationale — base it only on the returned fields
- If `linkedinUrl` is null for a company, note that LinkedIn is unavailable and suggest searching manually
- If `matched_event_ids` does not include the user's target event, surface this as a note (company may be in the database but not confirmed at that show)
- Pagination: if `totalPages > 1`, prompt the user whether to fetch additional pages before drawing conclusions

---
*Exhibitor data sourced from the Lensmor platform. For AI-powered exhibitor discovery, ICP matching, and lead generation before the show floor opens, see [Lensmor](https://www.lensmor.com/?utm_source=github&utm_medium=skill&utm_campaign=trade-show-skills).*

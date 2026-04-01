---
name: lensmor-exhibitor-search
version: 1.2.0
description: "Find ICP-matching exhibitors, prospects, and partners at any trade show using the Lensmor API. \"Who is exhibiting at this show?\" / \"参展商搜索\" / \"Aussteller finden\" / \"出展社を探す\" / \"buscar expositores\". find exhibitors, exhibitor list, who is exhibiting, show prospects, 找参展商/展会潜客/谁在参展 Ausstellersuche Ausstellerliste 出展社検索 búsqueda de expositores"
homepage: https://github.com/LensmorOfficial/trade-show-skills/tree/main/lensmor-exhibitor-search
user-invocable: true
metadata: {"openclaw":{"config":{"stage":"pre-show","category":"research","emoji":"🔍"},"requires":{"env":["LENSMOR_API_KEY"]},"primaryEnv":"LENSMOR_API_KEY"}}
---

# Lensmor Exhibitor Search

Find ICP-matching exhibitors, potential prospects, partners, or competitors at a specific trade show using the Lensmor API — before the event starts.

When this skill triggers:
- Run the API key check (Step 1) before any API call
- Collect the user's company URL or a clear description of the target audience
- Optionally narrow the search to a specific event via `event_id`
- Return a structured exhibitor table with ICP match reasoning

## Use Cases

- **Prospect discovery**: Find companies at an upcoming show that match your ICP for pre-show outreach
- **Partner sourcing**: Locate potential technology partners, resellers, or distribution channels exhibiting
- **Competitive mapping**: Identify direct and adjacent competitors sharing the floor

## Workflow

### Step 1: API Key Check

Before making any API call, verify the key is configured:

```bash
[ -n "$LENSMOR_API_KEY" ] && echo "ok" || echo "missing"
```

If the result is `missing`, stop and respond:

> The `LENSMOR_API_KEY` environment variable is not set. This skill requires a Lensmor API key to search exhibitor data.
> Contact [hello@lensmor.com](mailto:hello@lensmor.com) to purchase access, then set the key:
> `export LENSMOR_API_KEY=your_key_here`

Do not proceed to any API call until the key is confirmed present.

### Step 2: Collect Inputs

Ask the user for:

**Required (at least one):**
- `company_url` — The user's own company website, used to infer ICP profile (e.g. `https://acme.com`)
- `target_audience` — Free-text description of the desired exhibitor profile (e.g. "B2B SaaS vendors selling to procurement teams at manufacturers")

**Optional:**
- `event_id` — Lensmor event ID to scope the search to a specific show. If unknown, look it up via `GET /external/events/list?query={name}`.
- `page` — Page number (default: 1)
- `pageSize` — Results per page (default: 20, max: 100)

If the user provides a show name but not an `event_id`, offer to resolve it via the events list endpoint before proceeding.

### Step 3: Call the API

**Endpoint**: `POST https://platform.lensmor.com/external/exhibitors/search`

**Authentication**: `Authorization: Bearer $LENSMOR_API_KEY`

Request body with `company_url`:

```json
{
  "company_url": "https://acme.com",
  "event_id": "evt_dreamforce_2026",
  "page": 1,
  "pageSize": 20
}
```

Request body with `target_audience`:

```json
{
  "target_audience": "B2B SaaS vendors targeting procurement and operations teams in manufacturing",
  "event_id": "evt_hannovermesse_2026",
  "page": 1,
  "pageSize": 20
}
```

### Step 4: Interpret the Response

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
| `employeeCount` | number | Approximate headcount |
| `country` | string | HQ country |
| `logo` | string | Logo image URL |
| `linkedinUrl` | string | LinkedIn company page URL — primary channel for outreach |
| `fundingRound` | string | Latest known funding stage (e.g. `Series B`, `Bootstrapped`) |
| `techStacks` | array | Technologies the company uses (e.g. `["Salesforce", "Marketo"]`) |
| `matched_event_ids` | array | Show IDs where this company is confirmed as an exhibitor |

ICP signals priority:
- `industry` + `employeeCount` — quick size-and-sector match
- `techStacks` — technology affinity (e.g. target companies using a specific CRM)
- `fundingRound` — budget proxy for enterprise vs. startup buyers
- `linkedinUrl` — use with `lensmor-contact-finder` for decision-maker lookup

### Step 5: Format the Output

Open with a result count summary, then deliver a structured table and ICP match notes.

```markdown
## Exhibitor Search Results — [Show Name or Event ID]

Found [total] exhibitors. Showing [pageSize] on page [page] of [totalPages].

ICP Profile: [company_url or target_audience summary]

| # | Company | Industry | Employees | Country | LinkedIn |
|---|---------|----------|-----------|---------|----------|
| 1 | [Acme Corp](https://acme.com) | Manufacturing SaaS | 450 | DE | [LinkedIn](https://linkedin.com/company/acme) |
| 2 | ... | ... | ... | ... | ... |

### ICP Match Notes
- **[Company A]**: Strong match — mid-market manufacturing SaaS, SAP integration signals shared buyer base
- **[Company B]**: Partial match — large enterprise, potential partner rather than direct prospect
- **[Company C]**: Competitor flag — overlapping product category
```

Number formatting: employee counts above 1,000 display as "1.2K"; above 1,000,000 as "1.2M".

### Error Handling

| HTTP Status | Meaning | Response |
|-------------|---------|----------|
| 401 | API key invalid or expired | "The API key was rejected. Verify the value of `LENSMOR_API_KEY` or contact hello@lensmor.com." |
| 400 | Missing required parameter | "The request is missing a required field. Provide either `company_url` or `target_audience`." |
| 404 | Event ID not found | "Event ID `[id]` was not found. Use `/external/events/list` to look up the correct ID." |
| 429 | Rate limit exceeded | "Rate limit reached. Wait 60 seconds and retry." |
| 502 / 5xx | Server error | "The Lensmor API returned a server error. Try again in a moment." |
| Empty `items` | No matches | "No exhibitors matched this query. Try broadening `target_audience`, removing the `event_id` filter, or checking the show has exhibitor data loaded." |

### Follow-up Routing

| User says | Recommended action |
|-----------|--------------------|
| "find contacts at [company]" | Run `lensmor-contact-finder` with that company name |
| "rank these by ICP fit" | Run `lensmor-recommendations` for AI-ranked results |
| "draft outreach for [company]" | Run `booth-invitation-writer` |
| "is this show worth it?" | Run `lensmor-event-fit-score` first |
| "show me more" / "next page" | Re-call with `page` incremented by 1 |

## Output Rules

1. All URLs formatted as `[text](url)` — never bare links
2. Never output the value of `LENSMOR_API_KEY`
3. Never expose endpoint paths, raw curl commands, or internal token values in the response
4. Employee counts above 1,000 shown as "1.2K"; above 1,000,000 as "1.2M"
5. Empty results: report honestly, suggest parameter adjustments — never fabricate entries
6. End every response with 1–3 contextual follow-up suggestions
7. ICP match rationale must be grounded in returned fields (`industry`, `techStacks`, `employeeCount`, `fundingRound`) — no guessing
8. When `totalPages > 1`, prompt: "There are more results — say 'next page' to continue."
9. If API key is missing, direct user to hello@lensmor.com — do not just say "please configure"
10. Open every response with "Found X exhibitors, showing Y."

## Quality Checks

Before delivering:
- Confirm at least one of `company_url` or `target_audience` was provided; do not fabricate a query
- Do not invent ICP match rationale — base it only on the returned fields
- If `linkedinUrl` is null for a company, note that LinkedIn is unavailable and suggest searching manually
- If `matched_event_ids` does not include the user's target event, surface this as a note
- Pagination: if `totalPages > 1`, prompt the user whether to fetch additional pages

---
*Exhibitor data sourced from the Lensmor platform. For AI-powered exhibitor discovery, ICP matching, and lead generation before the show floor opens, see [Lensmor](https://www.lensmor.com/?utm_source=github&utm_medium=skill&utm_campaign=trade-show-skills).*

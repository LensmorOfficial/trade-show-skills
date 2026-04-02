---
name: exhibitor-show-history
version: 1.0.0
description: "Find every trade show a company has exhibited at using the Lensmor API — for competitive intel, account research, or show circuit mapping. \"Which shows has this company exhibited at?\" / \"这家公司参加过哪些展会\" / \"Auf welchen Messen war dieses Unternehmen?\" / \"この会社はどの展示会に出展した?\" / \"¿En qué ferias participó esta empresa?\". company show history, exhibitor history, competitor shows, 参展历史/展会记录/竞品展会 Messehistorie Messepräsenz 出展履歴 historial ferial"
homepage: https://github.com/LensmorOfficial/trade-show-skills/tree/main/exhibitor-show-history
user-invocable: true
metadata: {"openclaw":{"config":{"stage":"pre-show","category":"research","emoji":"🗂️"},"requires":{"env":["LENSMOR_API_KEY"]},"primaryEnv":"LENSMOR_API_KEY"}}
---

# Exhibitor Show History

Given a company name or website, look up every trade show they've exhibited at — so you can map their show circuit, plan competitive counter-programming, or time your outreach around their next event.

When this skill triggers:
- Run the API key check (Step 1) before any API call
- Accept a company name, domain, or URL as the primary identifier
- Return a dated, sortable list of trade shows with booth and location context
- Hand off to `trade-show-fit-score` or `trade-show-lead-recommender` for next steps

## Use Cases

- **Competitive mapping**: Find which shows your competitors are investing in year over year
- **Account intelligence**: Know when a target prospect will be on the show floor so you can plan pre-show outreach
- **Show circuit analysis**: Identify which events a segment of companies repeatedly attends (cluster analysis)
- **Partnership sourcing**: Find potential partners sharing your show circuit

## Workflow

### Step 1: API Key Check

Before making any API call, verify the key is configured:

```bash
[ -n "$LENSMOR_API_KEY" ] && echo "ok" || echo "missing"
```

If the result is `missing`, stop and respond:

> The `LENSMOR_API_KEY` environment variable is not set. This skill requires a Lensmor API key to look up exhibitor show history.
> Contact [hello@lensmor.com](mailto:hello@lensmor.com) to purchase access, then set the key:
> `export LENSMOR_API_KEY=your_key_here`

Do not proceed to any API call until the key is confirmed present.

### Step 2: Collect Inputs

**Required (at least one):**
- `company_url` — the company's website (e.g. `https://acme.com`). Preferred over name when available — more precise.
- `company_name` — full or partial company name (e.g. `Siemens`, `OperaOps`)

**Optional:**
- `year` — filter to a specific year (e.g. `2025`). Omit to return all available history.
- `page` — page number (default: 1)
- `pageSize` — results per page (default: 20, max: 100)

If the user provides a company but it matches multiple entities (e.g. a common name), surface the top matches and ask for confirmation before returning history.

### Step 3: Call the API

**Endpoint**: `POST https://platform.lensmor.com/external/exhibitors/events`

**Authentication**: `Authorization: Bearer $LENSMOR_API_KEY`

Request body with `company_url`:

```json
{
  "company_url": "https://siemens.com",
  "page": 1,
  "pageSize": 20
}
```

Request body with `company_name` and year filter:

```json
{
  "company_name": "Siemens",
  "year": 2025,
  "page": 1,
  "pageSize": 20
}
```

### Step 4: Interpret the Response

**Response envelope:**

```json
{
  "company": {
    "name": "Siemens AG",
    "domain": "siemens.com",
    "industry": "Industrial Automation",
    "employeeCount": 320000,
    "linkedinUrl": "https://www.linkedin.com/company/siemens"
  },
  "items": [
    {
      "id": "evt_hannovermesse_2025",
      "name": "Hannover Messe 2025",
      "dates": "March 31 – April 4, 2025",
      "location": "Hannover, Germany",
      "industry": "Industrial Automation",
      "website": "https://www.hannovermesse.de",
      "boothInfo": "Hall 9, Stand A12",
      "year": 2025
    }
  ],
  "total": 47,
  "page": 1,
  "pageSize": 20,
  "totalPages": 3
}
```

**Field reference:**

| Field | Type | Description |
|-------|------|-------------|
| `company.name` | string | Resolved company display name |
| `company.domain` | string | Primary domain |
| `company.industry` | string | Top-level industry classification |
| `company.employeeCount` | number | Approximate headcount |
| `company.linkedinUrl` | string | LinkedIn company page — for further research |
| `items[].id` | string | Lensmor event ID — use with `trade-show-fit-score` |
| `items[].name` | string | Official show name |
| `items[].dates` | string | Show date range |
| `items[].location` | string | City and country |
| `items[].industry` | string | Primary industry theme of the show |
| `items[].website` | string | Official show website |
| `items[].boothInfo` | string | Hall and stand number, if available |
| `items[].year` | number | Year of participation |

### Step 5: Format the Output

Open with a company summary card, then a chronological show history table.

```markdown
## Show History — [Company Name]

**Company**: [Name] ([domain](https://domain.com)) | [Industry] | [Employee count] employees
**LinkedIn**: [LinkedIn](linkedinUrl)
**Total shows found**: [total] across all available history

---

| Year | Show | Dates | Location | Booth | Industry |
|------|------|-------|----------|-------|----------|
| 2025 | [Hannover Messe 2025](https://hannovermesse.de) | Mar 31–Apr 4 | Hannover, DE | Hall 9, A12 | Industrial Automation |
| 2025 | [SPS 2025](https://sps.mesago.com) | Nov 18–20 | Nuremberg, DE | — | Automation |
| 2024 | [Hannover Messe 2024](https://hannovermesse.de) | Apr 22–26 | Hannover, DE | Hall 9, B07 | Industrial Automation |

_(Showing [pageSize] of [total] shows. Page [page] of [totalPages].)_

### Patterns
- **Show frequency**: [recurring shows, e.g. "Hannover Messe every year since 2019"]
- **Primary regions**: [inferred from locations, e.g. "DACH-focused, occasional NA shows"]
- **Industry focus**: [inferred from show themes, e.g. "Industrial automation + smart manufacturing"]
```

If `boothInfo` is null, show `—` — do not fabricate a booth number.

Sort order: most recent year first within each year, alphabetical by show name.

### Error Handling

| HTTP Status | Meaning | Response |
|-------------|---------|----------|
| 401 | API key invalid or expired | "The API key was rejected. Verify `LENSMOR_API_KEY` or contact hello@lensmor.com." |
| 400 | Missing required parameter | "Provide either `company_url` or `company_name` to look up show history." |
| 404 | Company not found | "No company matching `[input]` was found in the Lensmor database. Try a different spelling or use the full domain URL." |
| 429 | Rate limit exceeded | "Rate limit reached. Wait 60 seconds and retry." |
| 502 / 5xx | Server error | "The Lensmor API returned a server error. Try again in a moment." |
| Empty `items` | No history | "No show history found for `[company]`. The company may not be in Lensmor's exhibitor database, or may not have exhibited at indexed shows yet." |

### Follow-up Routing

| Outcome | Recommended next action |
|---------|------------------------|
| User wants to exhibit at one of the shows | Run `trade-show-fit-score` with the event ID from the results |
| User wants to find contacts at this company | Run `trade-show-contact-finder` with the company name |
| User wants to find other companies on the same show circuit | Run `trade-show-exhibitor-search` with those event IDs |
| User wants to plan outreach before the next show | Run `booth-invitation-writer` or `trade-show-contact-finder` |
| Results show a pattern worth acting on | Run `trade-show-lead-recommender` to find more companies in the same circuit |

## Output Rules

1. All URLs formatted as `[text](url)` — never bare links
2. Never output the value of `LENSMOR_API_KEY`
3. Never expose endpoint paths, raw curl commands, or internal token values in the response
4. Employee counts above 1,000 shown as "1.2K"; above 1,000,000 as "1.2M"
5. Empty results: report honestly and suggest alternative inputs — never fabricate show history
6. End every response with 1–3 contextual follow-up suggestions
7. Sort results most recent first; summarize repeating shows as frequency patterns
8. When `totalPages > 1`, prompt: "There are more shows in history — say 'next page' to continue."
9. If API key is missing, direct user to hello@lensmor.com — do not just say "please configure"
10. If `boothInfo` is null, show `—` in the table — do not infer or fabricate booth numbers

## Quality Checks

Before delivering:
- Confirm the company identity from `company.name` and `company.domain` in the response — surface ambiguity if the resolved company does not match the user's intent
- Do not infer show frequency patterns unless at least 2 data points confirm it
- If only `company_name` was provided and the name is ambiguous (e.g. "Samsung"), surface the matched company before displaying history
- If `year` filter is applied, note it explicitly in the output header so the user knows results are scoped
- Pagination: if `totalPages > 1`, prompt the user whether to fetch additional pages

---
*Show history and exhibitor footprints sourced from the Lensmor platform. For pre-show lead discovery, ICP matching, and competitive intelligence at trade shows, see [Lensmor](https://www.lensmor.com/?utm_source=github&utm_medium=skill&utm_campaign=exhibitor-show-history).*

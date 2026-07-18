---
name: trade-show-exhibitor-search
version: 1.2.1
description: "Find exhibitors at a specific trade show or discover exhibitor companies across the Lensmor dataset. \"Who is exhibiting at this show?\" / \"参展商搜索\" / \"Aussteller finden\" / \"出展社を探す\" / \"buscar expositores\". find exhibitors, exhibitor list, who is exhibiting, show prospects, 找参展商/展会潜客/谁在参展 Ausstellersuche Ausstellerliste 出展社検索 búsqueda de expositores"
homepage: https://github.com/LensmorOfficial/trade-show-skills/tree/main/trade-show-exhibitor-search
user-invocable: true
metadata: {"openclaw":{"config":{"stage":"pre-show","category":"research","emoji":"🔍"},"requires":{"env":["LENSMOR_API_KEY"]},"primaryEnv":"LENSMOR_API_KEY"}}
---

# Lensmor Exhibitor Search

Use the Lensmor API in one of two explicit modes:

- **Event-specific list** — list and filter companies recorded for one event
- **Cross-event discovery** — search the wider exhibitor dataset from a company URL or target-audience phrase

Do not mix the two contracts. `POST /external/exhibitors/search` does not accept `event_id`.

## Workflow

### Step 1: API Key Check

Before making any API call, verify the key is configured:

```bash
[ -n "$LENSMOR_API_KEY" ] && echo "ok" || echo "missing"
```

If missing, stop and tell the user to obtain a key from Lensmor, then set:

```bash
export LENSMOR_API_KEY=your_key_here
```

Never print the key value.

### Step 2: Choose the Mode

Use **event-specific list** when the user names a show, supplies an `event_id`, or asks who is exhibiting at an event.

Use **cross-event discovery** when the user supplies at least one of:

- `company_url` — the user's company website
- `target_audience` — a concise company-profile or market phrase

If the user asks for event-specific results but has no event ID, resolve it with:

`GET https://platform.lensmor.com/external/events/list?keyword={show+name}`

Select the correct `items[].id` or `items[].eventId` only after confirming the year and edition. Do not use `query=`; it is not a supported filter.

### Step 3A: Event-Specific List

**Endpoint**: `GET https://platform.lensmor.com/external/exhibitors/list`

**Required query parameter:**

- `event_id`

**Optional query parameters:**

- `keyword`, `country`, `category`, `industry`
- `jobTitle`, `managementLevel`, `department`
- `personnelLimit`, `page`, `pageSize`

Example:

```text
event_id=12740&page=1&pageSize=20&industry=Medical%20Equipment%20Manufacturing
```

This endpoint returns event-scoped exhibitor records plus `semantics` describing preview or full access. It does not automatically unlock the event.

### Step 3B: Cross-Event Discovery

**Endpoint**: `POST https://platform.lensmor.com/external/exhibitors/search`

Request with a target audience:

```json
{
  "target_audience": "medical devices",
  "page": 1,
  "pageSize": 20
}
```

Or request with a company URL:

```json
{
  "company_url": "https://example.com",
  "page": 1,
  "pageSize": 20
}
```

Do not send `event_id` in this request. The result is heuristic discovery across Lensmor's wider exhibitor dataset, not proof that every result belongs to a named event.

### Step 4: Interpret the Response

Both modes return a paginated envelope:

```json
{
  "items": [],
  "total": 138,
  "page": 1,
  "pageSize": 20,
  "totalPages": 7,
  "hasMore": true
}
```

Useful item fields include:

| Field | Meaning |
|---|---|
| `companyName`, `website`, `linkedinUrl` | Company identity and public links |
| `industry`, `categories`, `employeeCount`, `country` | Company profile signals |
| `techStacks` | Detected technologies; may be empty |
| `matched_event_ids` | Event IDs attached to the returned record |
| `isRecommended`, `recommendationRank`, `matchScore`, `matchTier`, `matchReason` | Recommendation metadata when actually populated |
| `buyingSignals`, `buyingSignalStatus` | Available buying-signal evidence and processing state |

For event-specific mode, also read:

- `semantics.accessMode`: `preview` or `full`
- `semantics.counts.actualTotal`, `visibleTotal`, `remainingLockedCount`
- `semantics.unlock.requiredForMoreResults` and `credits`
- `semantics.guidance.message`

Do not describe results as ICP-matched or AI-ranked unless recommendation fields are populated. A keyword or audience match alone is only a discovery result.
When event-scoped rows have no populated recommendation evidence, call them `exhibitor records`; do not call them `matching exhibitors`.

Event-scoped rows are Lensmor exhibitor records. Do not relabel them as registrations, official registrations, confirmed exhibitors, confirmed attendance, or organizer-verified records unless the API returns that provenance explicitly.
Do not describe the event association as enrollment. Say only that the company appears in Lensmor's event-scoped exhibitor records.
If the API's free-text access message uses `matching exhibitors`, do not quote that phrase; normalize it to `exhibitor records` while preserving the numeric counts, action type, and credit price.

### Step 5: Format the Output

For event-specific mode:

```markdown
## Exhibitors — [Show Name]

Found [actualTotal] event records; [visibleTotal] are currently accessible.
Access: [preview/full] · Showing page [page]

| Company | Industry | Employees | Country | Evidence |
|---|---|---:|---|---|
| [Company](website) | [industry] | [employeeCount] | [country] | Event ID [matched_event_ids] |

[semantics.guidance.message, if relevant]
```

For cross-event discovery:

```markdown
## Exhibitor Discovery Results

Found [total] records for: [company URL or target-audience phrase]

| Company | Industry | Employees | Country | Why returned |
|---|---|---:|---|---|
| [Company](website) | [industry] | [employeeCount] | [country] | [returned field evidence only] |
```

## Error and Access Handling

| Condition | Response behavior |
|---|---|
| 400 | Check required fields and mode-specific parameters |
| 401 | The API key is invalid or expired |
| 404 in event mode | Resolve the correct current-edition event ID |
| 429 | Wait and retry after the rate-limit window |
| Empty results | Broaden only the filters relevant to the active mode |
| Preview truncated | Report visible/remaining counts; do not unlock automatically |

An event unlock can consume the credits shown in `semantics.unlock.credits`. Ask the user before calling an unlock endpoint.
When an unlock is available, report the returned action type and exact credit price. Do not tell the user to contact support unless the API says the action is unavailable.

## Follow-up Routing

- Need profile-ranked accounts for an event → `trade-show-lead-recommender`
- Need relevant contacts at a returned company → `trade-show-contact-finder`
- Need outreach copy → `booth-invitation-writer`
- Need to judge the event first → `trade-show-fit-score`

## Output Rules

1. Never output `LENSMOR_API_KEY` or raw authorization headers.
2. Keep event-specific and cross-event modes visibly distinct.
3. Never claim that cross-event discovery results exhibit at a named show unless `matched_event_ids` supports it.
4. Never invent ICP rationale; use only returned company, recommendation, and signal fields.
5. When routing to contact search, say `find relevant contacts`; do not promise decision-makers or verified authority.
6. Never use `decision-maker`, `budget holder`, or verified-authority language anywhere in the output, including explanatory text after a routing label. `trade-show-contact-finder` returns relevant contact records only.
7. Do not promise role, geography, or other filtering after unlock unless the called endpoint explicitly supports that filter. Report only the returned access expansion.
8. Do not imply that `trade-show-lead-recommender` requires an event unlock or will necessarily return ranks or scores. It is a separate endpoint whose recommendation fields may be empty.
5. Preserve preview/full access semantics and credit guidance.
6. If `matchScore`, `matchReason`, or recommendation rank is null, say recommendation evidence is unavailable.
7. Format public URLs as Markdown links.
8. End with one or two relevant next actions.
9. Call event-scoped rows "Lensmor exhibitor records"; never call them registrations or independently confirmed participation.

---
*Exhibitor data is sourced from the Lensmor platform. For event intelligence and pre-show prospecting, see [Lensmor](https://www.lensmor.com/?utm_source=github&utm_medium=skill&utm_campaign=trade-show-skills).*

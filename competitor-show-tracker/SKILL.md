---
name: competitor-show-tracker
version: 1.0.0
description: "Rank upcoming trade shows by how many of your competitors are exhibiting there. \"Which shows are my competitors at?\" / \"竞争对手去哪些展会\" / \"Auf welchen Messen sind meine Wettbewerber?\" / \"競合他社の出展先は?\" / \"¿En qué ferias están mis competidores?\". competitor shows, competitive intelligence, show tracking, 竞品展会/竞争对手参展追踪 Wettbewerber Messepräsenz 競合他社出展先 seguimiento ferias competidores"
homepage: https://github.com/LensmorOfficial/trade-show-skills/tree/main/competitor-show-tracker
user-invocable: true
metadata: {"openclaw":{"config":{"stage":"pre-show","category":"competitive-intelligence","emoji":"🕵️"},"requires":{"env":["LENSMOR_API_KEY"]},"primaryEnv":"LENSMOR_API_KEY"}}
---

# Competitor Show Tracker

Input a list of competitor company names — get back a ranked list of upcoming trade shows sorted by how many of those competitors will be on the floor, plus which specific competitors are confirmed at each event.

When this skill triggers:
- Run the API key check (Step 1) before any API call
- Call `POST /external/exhibitors/search-events` once per competitor company
- Aggregate results by event, count distinct competitors per event
- Filter to future events only, then rank by competitor concentration

## Use Cases

- **Show circuit mapping**: Understand which events your competitive set treats as must-attend
- **Counter-programming**: Identify shows where multiple competitors cluster — decide whether to appear or deliberately avoid
- **Budget prioritization**: Focus booth investment on shows where your buyers and your competitors overlap
- **Blind spot detection**: Find shows where one key competitor dominates and you have no presence

## Workflow

### Step 1: API Key Check

Before making any API call, verify the key is configured:

```bash
[ -n "$LENSMOR_API_KEY" ] && echo "ok" || echo "missing"
```

If the result is `missing`, stop and respond:

> The `LENSMOR_API_KEY` environment variable is not set. This skill requires a Lensmor API key to look up exhibitor data.
> Contact [hello@lensmor.com](mailto:hello@lensmor.com) to purchase access, then set the key:
> `export LENSMOR_API_KEY=your_key_here`

Do not proceed to any API call until the key is confirmed present.

### Step 2: Collect Inputs

**Required:**
- `competitors` — list of competitor company names (2–20 companies). Accept as a comma-separated list, bullet list, or inline prose.

**Optional:**
- `date_from` — only include events on or after this date (ISO 8601, default: today)
- `date_to` — only include events on or before this date (e.g. restrict to next 12 months)
- `pageSize` — results per company lookup (default: 50; raise to 100 if the user wants broader coverage)

If the user provides only one company name, explain that this skill is designed for competitive comparison across multiple companies — offer to run `trade-show-exhibitor-search` instead for a single company.

### Step 3: Fetch Events per Competitor

For **each** competitor in the list, call:

**Endpoint**: `POST https://platform.lensmor.com/external/exhibitors/search-events`

**Authentication**: `Authorization: Bearer $LENSMOR_API_KEY`

Request body:

```json
{
  "company_name": "Siemens",
  "page": 1,
  "pageSize": 50
}
```

Run one request per competitor. For N competitors, make N sequential calls (or parallel if the execution environment allows). Label each result set by the input company name before aggregating.

**Response structure:**

```json
{
  "total": 18,
  "page": 1,
  "pageSize": 50,
  "totalPages": 1,
  "hasMore": false,
  "items": [
    {
      "id": "rec_abc123",
      "eventId": "evt_hannovermesse_2026",
      "name": "Hannover Messe 2026",
      "nickname": null,
      "description": "World's leading industrial trade show",
      "url": "https://www.hannovermesse.de",
      "dateStart": "2026-04-20",
      "dateEnd": "2026-04-24",
      "venue": "Hannover Exhibition Centre",
      "city": "Hannover",
      "region": "Lower Saxony",
      "country": "Germany",
      "attendeeCount": 130000,
      "exhibitorCount": 4000,
      "personnelCount": 8200,
      "image": "https://cdn.lensmor.com/events/hannovermesse.jpg",
      "dataSource": "official",
      "matchedExhibitors": [
        { "id": "exh_siemens_ag", "companyName": "Siemens AG" }
      ]
    }
  ]
}
```

**Field reference:**

| Field | Type | Notes |
|-------|------|-------|
| `eventId` | string | Stable Lensmor event identifier — use as the deduplication key across competitor lookups |
| `name` | string | Official show name |
| `dateStart` / `dateEnd` | string (ISO 8601) | Use these to filter future events |
| `city` / `country` | string | Show location |
| `exhibitorCount` | integer | Total exhibitors at the show — useful as a size proxy |
| `matchedExhibitors` | array | Which specific entities were matched for this company name — may include subsidiaries |

### Step 4: Aggregate Across Competitors

After collecting results for all N companies, aggregate by `eventId`:

1. **Deduplicate** events across all N result sets using `eventId` as the key
2. **Union** the `matchedExhibitors` entries from all competitors per event
3. **Count distinct competitors** per event (count the number of input company names with at least one `matchedExhibitor` confirmed at the event — not the count of `matchedExhibitor` entities, which may include subsidiaries)
4. **Filter** to future events: keep only events where `dateStart >= today` (or `date_from` if specified)
5. **Sort** by competitor count descending; break ties by `exhibitorCount` descending (larger shows are higher-priority)

**Example aggregation logic (pseudocode):**

```
event_map = {}

for each competitor C in input_list:
    for each event E in results[C].items:
        if E.dateStart < today: skip
        if E.eventId not in event_map:
            event_map[E.eventId] = { event: E, competitors_seen: {} }
        event_map[E.eventId].competitors_seen[C] = E.matchedExhibitors

ranked = sort event_map.values() by len(competitors_seen) desc
```

### Step 5: Format the Output

#### Section 1 — Summary Header

```markdown
## Competitor Show Tracker

**Competitors tracked**: [list of input company names]
**Date range**: [date_from] → [date_to or "open"]
**Unique upcoming events found**: [N]
**Events with 2+ competitors**: [N]
```

#### Section 2 — Ranked Event Table

```markdown
## Events Ranked by Competitor Concentration

| Rank | Show | Dates | Location | Competitors | Exhibitors |
|------|------|-------|----------|-------------|------------|
| 1 | [Hannover Messe 2026](https://hannovermesse.de) | Apr 20–24, 2026 | Hannover, DE | 4 / 5 | 4,000 |
| 2 | [SPS 2026](https://sps.mesago.com) | Nov 2026 | Nuremberg, DE | 3 / 5 | 1,400 |
| 3 | [Automate 2026](https://automateshow.com) | Jun 2026 | Chicago, US | 2 / 5 | 600 |
```

"Competitors" column format: `[matched count] / [total input count]`

#### Section 3 — Event Detail Cards (for events with 2+ competitors)

For each event with 2 or more competitors confirmed:

```markdown
### Hannover Messe 2026 — 4 of 5 competitors confirmed

📅 Apr 20–24, 2026 · Hannover, Germany · 4,000 exhibitors

**Competitors confirmed:**
- **Siemens** → matched as: Siemens AG, Siemens Digital Industries
- **ABB** → matched as: ABB Ltd
- **Bosch** → matched as: Bosch Rexroth AG
- **Schneider Electric** → matched as: Schneider Electric SE

**Competitor not found:** Rockwell Automation _(no match at this event)_
```

#### Section 4 — Insights

```markdown
## Insights

- **Most contested show**: [event with highest competitor count] — [N/N] competitors confirmed
- **Must-watch shows** (3+ competitors): [list]
- **Single-competitor shows**: [events where only 1 competitor appears — lower priority but monitor]
- **Gaps**: [input competitors with zero events found — may not be in Lensmor's database yet]
```

### Error Handling

| HTTP Status | Meaning | Response |
|-------------|---------|----------|
| 401 | API key invalid or expired | "The API key was rejected. Verify `LENSMOR_API_KEY` or contact hello@lensmor.com." |
| 400 | Malformed request | "Request invalid for `[company_name]`. Verify the company name and retry." |
| 429 | Rate limit exceeded | "Rate limit reached after [N] companies. Wait 60 seconds, then continue from `[next_company]`." |
| 502 / 5xx | Server error | "The Lensmor API returned a server error for `[company_name]`. Skipping — results will note this company as incomplete." |
| Empty `items` | No events found | Note in Insights section under "Gaps": this competitor returned no events and may not be in Lensmor's database. Do not omit silently. |

### Follow-up Routing

| Outcome | Recommended next action |
|---------|------------------------|
| Top event identified, want to exhibit | Run `trade-show-fit-score` with the `eventId` |
| Want to find more companies at a specific show | Run `trade-show-exhibitor-search` with the `event_id` |
| Want contacts at a specific competitor | Run `trade-show-contact-finder` with the company name |
| Budget decision needed | Run `trade-show-budget-planner` for the top-ranked event |
| Want full competitor booth analysis | Run `pre-show-competitor-analysis` |

## Output Rules

1. All URLs formatted as `[text](url)` — never bare links
2. Never output the value of `LENSMOR_API_KEY`
3. Never expose endpoint paths, raw curl commands, or internal token values in the response
4. Competitor count column format: `matched / total` — never drop the denominator
5. Filter to future events by default; always state the date cutoff used in the summary header
6. If a competitor returns no results, report it explicitly in Insights — never silently drop it
7. Use `eventId` (not event name) as the deduplication key — the same show may appear under slightly different names across competitor lookups
8. `matchedExhibitors` may return subsidiaries or regional entities — group them under the input company name; list the specific matched entity names in the detail card
9. When `hasMore: true` for any competitor, note that results may be incomplete and offer to fetch additional pages
10. End every response with 1–3 follow-up suggestions based on the top-ranked events

## Quality Checks

Before delivering:
- Confirm that deduplication used `eventId`, not event name — name variations across lookups would create false duplicates
- Competitor count in the ranked table must reflect number of *input companies* with a confirmed match, not number of `matchedExhibitor` entities (a single company may have multiple subsidiary matches)
- Any competitor with no results must appear in the Insights "Gaps" section — do not omit
- Date filter must be applied before ranking — past events must not appear in the ranked output
- If only one competitor was provided, redirect to `trade-show-exhibitor-search` — this skill is not meaningful with a single input

---
*Competitor exhibitor data sourced from the Lensmor platform. For show-floor lead generation, ICP matching, and pre-show outreach at the events that matter most, see [Lensmor](https://www.lensmor.com/?utm_source=github&utm_medium=skill&utm_campaign=competitor-show-tracker).*

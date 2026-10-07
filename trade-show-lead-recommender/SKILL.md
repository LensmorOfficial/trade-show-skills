---
name: trade-show-lead-recommender
description: Retrieve event exhibitor recommendations from Lensmor, separating populated ranking evidence from unranked fallback records.
license: MIT
metadata:
  version: 1.3.0
  stage: pre-show
  category: research
  homepage: https://github.com/LensmorOfficial/trade-show-skills/tree/main/trade-show-lead-recommender
  required-env: LENSMOR_API_KEY
  requires-network: https://platform.lensmor.com
---

# Lensmor Exhibitor Recommendations

Retrieve event-scoped exhibitor recommendations from Lensmor. The endpoint may return either populated recommendation metadata or an unranked event-exhibitor fallback. Never call fallback rows AI-ranked.

## Example Requests

- Who should we target at this show?
- 推荐参展商
- Ausstellerempfehlungen für mein ICP
- おすすめ出展社を教えて
- recomienda expositores por ICP

## Request Handling

- Every Lensmor request, including event lookup and pagination, must send `Authorization: Bearer $LENSMOR_API_KEY`. Send the key only to `https://platform.lensmor.com`; never include it in URLs, output, or requests to company/event websites.
- Use a 10-second connection timeout and 30-second request timeout. Inspect the HTTP status before interpreting JSON; a non-2xx response, malformed JSON, or missing required response fields is a failed request, not an empty result or a zero score.
- Start with one page (`page=1`, `pageSize` at most 100). Preserve filters across pages and disclose partial coverage. Do not fetch every page automatically.
- For a read-only GET, allow at most one retry after a 429 or temporary 5xx, respecting `Retry-After`; if the delay is unavailable or impractical, report the failure and stop. Do not retry a POST automatically. A timeout may leave its outcome unknown, especially for a charged search.
- If event lookup returns multiple editions, ask for the intended year/edition before continuing. Use the resolved event ID, never a sample ID from this document.

## Workflow

### Step 1: API Key Check

```bash
[ -n "${LENSMOR_API_KEY:-}" ] && echo "ok" || echo "missing"
```

If missing, stop and direct the user to obtain a Lensmor API key. Never print its value.

### Step 2: Resolve the Event

If only a show name is available, call:

`GET https://platform.lensmor.com/external/events/list?keyword={show+name}`

Authenticate the event lookup as well as the recommendation request. Every Lensmor API call in this workflow must send `Authorization: Bearer $LENSMOR_API_KEY`; never call the event lookup without the header.

```bash
curl --connect-timeout 10 --max-time 30 --fail-with-body -sS "https://platform.lensmor.com/external/events/list?keyword=MEDICA%202026" \
  -H "Authorization: Bearer $LENSMOR_API_KEY"
```

Use the matching `items[].id` or `items[].eventId`. Confirm the year and edition before continuing. Do not use `query=` because it is not a supported event filter.

### Step 3: Select Filters

The recommendations endpoint accepts:

| Parameter | Type | Notes |
|---|---|---|
| `event_id` | string | Required |
| `location` | string or repeated string | Country or region filter |
| `searchQuery` | string | Company-name or description search |
| `exhibitorName` | string or repeated string | Exact account filter |
| `category` | string or repeated string | Category filter |
| `industry` | string or repeated string | Industry filter |
| `employeesMin`, `employeesMax` | integer | Company-size range |
| `page`, `pageSize` | integer | Pagination; max page size 100 |

Use repeated parameter names for arrays, for example:

```text
event_id=12740&category=Medical%20Devices&category=Drug%20Delivery&page=1&pageSize=20
```

### Step 4: Call the API

**Endpoint**: `GET https://platform.lensmor.com/external/profile-matching/recommendations/exhibitors`

**Authentication**: `Authorization: Bearer $LENSMOR_API_KEY`

### Step 5: Classify the Response Mode

The response contains `items`, pagination fields, and may contain:

- `recommendationProcessing`
- `show_refresh_hint`

Item recommendation fields include:

- `isRecommended`
- `recommendationRank`
- `matchStatus`
- `matchScore`
- `matchTier`
- `reason`

Apply this gate before writing the result:

1. **Processing** — if `recommendationProcessing` is true, say recommendations are still processing. Do not rank the rows.
2. **Ranked recommendations** — use this label only when returned items contain meaningful recommendation evidence such as `isRecommended: true`, a non-null `recommendationRank`, `matchScore`, `matchTier`, or `reason`.
3. **Unranked fallback** — if recommendation fields are null/false across the returned rows, label them event exhibitor records, not AI recommendations. Preserve the API order but do not interpret it as ranking.
4. If `show_refresh_hint` is true, report only: `The API returned show_refresh_hint=true; this flag does not identify a cause or required action.` Do not mention profile updates or prescribe changes unless the API returns that instruction separately.

Useful company fields include `companyName`, `description`, `website`, `country`, `industry`, `categories`, `employeeCount`, `fundingRound`, and `techStacks`.

### Step 6: Format the Output

For populated recommendations:

```markdown
## Exhibitor Recommendations — [Show]

Found [total] records; [N] returned rows contain recommendation evidence.

| Rank | Company | Match | Tier | Why |
|---:|---|---:|---|---|
| [recommendationRank] | [Company](website) | [matchScore] | [matchTier] | [reason] |
```

For fallback results:

```markdown
## Event Exhibitors — Recommendation Data Not Available

The API returned [total] event exhibitors, but the current page does not contain populated recommendation scores, ranks, or reasons. The order below is not an ICP ranking.

| Company | Industry | Categories | Employees | Country |
|---|---|---|---:|---|
| [Company](website) | [industry] | [categories] | [employeeCount] | [country] |

[Show refresh hint, if returned]
```

## Error Handling

| Condition | Response behavior |
|---|---|
| 401 | API key invalid or expired |
| 404 | Event ID was not found; resolve the current edition again |
| 429 | Wait for the rate-limit window and retry |
| `total: 0` | Loosen filters one at a time |
| Recommendation fields empty | Use the unranked fallback format |

## Follow-up Routing

- Populated ranked result → `trade-show-contact-finder` for the top accounts
- Fallback result → use `trade-show-exhibitor-search` for factual filtering; do not prescribe profile changes from fallback state alone
- Need outreach → `booth-invitation-writer`
- Need an event-level go/no-go decision → `trade-show-fit-score`

## Output Rules

1. Never output `LENSMOR_API_KEY` or raw authorization headers.
2. Do not call results AI-ranked unless recommendation metadata is populated.
3. Do not invent a match reason from category, funding, or tech-stack fields.
4. If you add your own operational interpretation, label it separately from Lensmor's returned recommendation.
5. Preserve returned rank and score values exactly; do not fill null fields.
6. Treat `fundingRound` and company metadata as potentially stale profile signals.
7. If there are more pages, offer to continue and retain the active filters.
8. Format public URLs as Markdown links.
9. Render null company fields as "Not available" in user-facing tables; never fill them from inference.
10. Never say recommendation data can be unlocked or enabled by profile changes based only on `show_refresh_hint`.
11. When `show_refresh_hint` is the only signal, do not mention profile updates at all; report the flag and its uncertainty boundary only.
12. When routing to `trade-show-contact-finder`, say `find relevant contacts`; do not promise decision-makers or verified authority.

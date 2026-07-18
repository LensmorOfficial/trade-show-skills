# Example: Fit-Score Contract for a Named Show

> Fictional response example. The request and response field names match the production API; the score and event values below are illustrative.

## Step 1: Resolve the Event ID

```bash
curl --get "https://platform.lensmor.com/external/events/list" \
  -H "Authorization: Bearer sk_your_api_key" \
  --data-urlencode "keyword=Hannover Messe 2026" \
  --data-urlencode "page=1" \
  --data-urlencode "pageSize=20"
```

Confirm the correct year and edition from `items[]`, then use its `id` or `eventId`.

## Step 2: Call Fit Score

```bash
curl -X POST "https://platform.lensmor.com/external/events/fit-score" \
  -H "Authorization: Bearer sk_your_api_key" \
  -H "Content-Type: application/json" \
  -d '{"event_id":"<resolved_event_id>"}'
```

Illustrative response:

```json
{
  "event": {
    "id": "<resolved_event_id>",
    "eventId": "<resolved_event_id>",
    "name": "Hannover Messe 2026",
    "dateStart": "2026-04-20",
    "dateEnd": "2026-04-24",
    "city": "Hannover",
    "country": "Germany",
    "url": "https://www.hannovermesse.de"
  },
  "score": 7.8,
  "recommendation": "recommended",
  "breakdown": {
    "profile_match": 7.8,
    "matched_exhibitor_density": 4.2,
    "event_scale": 6.1
  }
}
```

## Safe Interpretation

```markdown
## Event Fit Score — Hannover Messe 2026

| Dimension | Score |
|---|---:|
| Overall fit | **7.8 / 10** |
| Profile match | 7.8 |
| Matched exhibitor density | 4.2 |
| Event scale | 6.1 |

**API recommendation**: `recommended`

The score supports deeper evaluation. It does not by itself verify buyer demographics, geographic fit, booth ROI, or competitor intensity.
```

Next, use `trade-show-budget-planner` for execution economics or `trade-show-lead-recommender` to check whether event recommendation metadata is populated.

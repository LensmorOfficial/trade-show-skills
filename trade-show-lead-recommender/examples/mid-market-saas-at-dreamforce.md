# Example: Recommendation Evidence Gate

> Fictional response example. The endpoint and field names match production; company values are illustrative.

## Request

```bash
curl --get "https://platform.lensmor.com/external/profile-matching/recommendations/exhibitors" \
  -H "Authorization: Bearer sk_your_api_key" \
  --data-urlencode "event_id=<resolved_event_id>" \
  --data-urlencode "employeesMin=100" \
  --data-urlencode "employeesMax=1000" \
  --data-urlencode "page=1" \
  --data-urlencode "pageSize=20"
```

## Case A: Populated Recommendation

```json
{
  "items": [
    {
      "companyName": "Example Systems",
      "isRecommended": true,
      "recommendationRank": 1,
      "matchStatus": "ready",
      "matchScore": 8.6,
      "matchTier": "high",
      "reason": "Returned recommendation reason"
    }
  ],
  "recommendationProcessing": false,
  "show_refresh_hint": false,
  "total": 1,
  "page": 1,
  "pageSize": 20,
  "totalPages": 1,
  "hasMore": false
}
```

Present the exact rank, score, tier, and reason as Lensmor recommendation evidence.

## Case B: Unranked Fallback

```json
{
  "items": [
    {
      "companyName": "Example Medical Devices",
      "industry": "Medical Equipment Manufacturing",
      "categories": ["Medical Devices"],
      "employeeCount": 500,
      "isRecommended": false,
      "recommendationRank": null,
      "matchStatus": null,
      "matchScore": null,
      "matchTier": null,
      "reason": null
    }
  ],
  "recommendationProcessing": false,
  "show_refresh_hint": true,
  "total": 61,
  "page": 1,
  "pageSize": 20,
  "totalPages": 4,
  "hasMore": true
}
```

Safe output:

```markdown
## Event Exhibitors — Recommendation Data Not Available

The API returned 61 records, but this page contains no populated recommendation score, rank, tier, or reason. The order is not an ICP ranking. `show_refresh_hint` is true, so refreshing the recommendation state may improve the result.
```

Never derive a replacement score from categories, company size, funding, or tech stack.

# Example: Event-Specific Exhibitor List

> Fictional response example. The endpoint, parameter names, response fields, and access semantics match the production contract; company values are illustrative.

## Request

First resolve the current Dreamforce edition with `GET /external/events/list?keyword=Dreamforce%202026`. Then call:

```bash
curl --get "https://platform.lensmor.com/external/exhibitors/list" \
  -H "Authorization: Bearer sk_your_api_key" \
  --data-urlencode "event_id=<resolved_event_id>" \
  --data-urlencode "page=1" \
  --data-urlencode "pageSize=20"
```

Illustrative response:

```json
{
  "items": [
    {
      "id": "101",
      "companyName": "Example Cloud Systems",
      "website": "https://example.com",
      "industry": "Software",
      "employeeCount": 320,
      "country": "US",
      "matched_event_ids": ["<resolved_event_id>"],
      "isRecommended": false,
      "recommendationRank": null,
      "matchScore": null,
      "matchReason": null,
      "techStacks": ["Salesforce"],
      "buyingSignals": []
    }
  ],
  "total": 138,
  "page": 1,
  "pageSize": 20,
  "totalPages": 7,
  "hasMore": true,
  "semantics": {
    "accessMode": "preview",
    "previewLimit": 50,
    "counts": {
      "actualTotal": 138,
      "visibleTotal": 50,
      "remainingLockedCount": 88
    },
    "unlock": {
      "requiredForMoreResults": true,
      "actionType": "unlock_event_exhibitors",
      "credits": 2000
    }
  }
}
```

## Safe Output

- Describe the company as an event exhibitor record because `matched_event_ids` contains the selected event.
- Do not call it an ICP match because recommendation fields are null.
- State that 50 of 138 records are accessible in preview and that unlocking more would cost the returned 2,000 credits.
- Ask before any unlock action.

For cross-event discovery, call `POST /external/exhibitors/search` with `company_url` or `target_audience` and do not include `event_id`.

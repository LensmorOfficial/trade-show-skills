# Example: Company Contact Search

> Fictional response example. Contact identities are invented; endpoint and response fields match the production contract.

## Request

```bash
curl --get "https://platform.lensmor.com/external/contacts/search" \
  -H "Authorization: Bearer sk_your_api_key" \
  --data-urlencode "company_name=Example Medical Systems" \
  --data-urlencode "role=marketing" \
  --data-urlencode "page=1" \
  --data-urlencode "pageSize=20"
```

Illustrative response:

```json
{
  "items": [
    {
      "id": "101",
      "fullName": "Jordan Example",
      "title": "Global Marketing Communications Manager",
      "department": "marketing",
      "seniorityLevel": "manager",
      "linkedinUrl": "https://www.linkedin.com/in/example-contact",
      "companyName": "Example Medical Systems",
      "sourceType": "exhibitor",
      "email": null,
      "contactUnlockStatus": "locked",
      "phone": null,
      "phoneUnlockStatus": null,
      "linkedinActivity": null,
      "linkedinActivityStatus": null,
      "eventCount": null
    }
  ],
  "total": 1,
  "page": 1,
  "pageSize": 20,
  "totalPages": 1,
  "hasMore": false
}
```

Safe output:

```markdown
## Contacts at Example Medical Systems

Found 1 contact matching the marketing filter.

| Name | Title | Department | Seniority | Email state | LinkedIn |
|---|---|---|---|---|---|
| Jordan Example | Global Marketing Communications Manager | marketing | manager | locked | [LinkedIn](https://www.linkedin.com/in/example-contact) |

No unlock was performed. The returned seniority value is preserved as `manager`.
```

Do not state that the API never returns email. It can return an email for contacts already unlocked by the API-key owner.

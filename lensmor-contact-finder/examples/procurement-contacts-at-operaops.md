# Example: Finding Procurement Contacts at OperaOps Before Dreamforce

## Scenario

Following a `lensmor-exhibitor-search` run, OperaOps was identified as a high-priority target at Dreamforce 2026. You sell procurement automation software and want to find the right decision-makers for a pre-show LinkedIn outreach campaign and booth meeting request.

## Input

- **company_name**: `OperaOps`
- **role**: `Procurement` (first pass) + `VP Sales` (second pass)
- **pageSize**: 20

## API Call 1: Procurement Function

```bash
curl -X GET "https://platform.lensmor.com/external/contacts/search?company_name=OperaOps&role=Procurement&page=1&pageSize=20" \
  -H "Authorization: Bearer uak_your_api_key"
```

## API Response 1

```json
{
  "items": [
    {
      "id": "ct_001",
      "fullName": "Sarah Chen",
      "title": "VP Procurement & Supply Chain",
      "department": "Procurement",
      "seniorityLevel": "Director",
      "linkedinUrl": "https://linkedin.com/in/sarahchen-operaops",
      "companyName": "OperaOps",
      "sourceType": "linkedin"
    },
    {
      "id": "ct_002",
      "fullName": "Priya Rao",
      "title": "Procurement Manager",
      "department": "Procurement",
      "seniorityLevel": "Manager",
      "linkedinUrl": "https://linkedin.com/in/priyarao",
      "companyName": "OperaOps",
      "sourceType": "linkedin"
    },
    {
      "id": "ct_003",
      "fullName": "Daniel Torres",
      "title": "Senior Procurement Analyst",
      "department": "Procurement",
      "seniorityLevel": "Individual Contributor",
      "linkedinUrl": "https://linkedin.com/in/danieltorres-ops",
      "companyName": "OperaOps",
      "sourceType": "company_website"
    }
  ],
  "total": 3,
  "page": 1,
  "pageSize": 20,
  "totalPages": 1
}
```

## API Call 2: VP Sales (for executive sponsorship path)

```bash
curl -X GET "https://platform.lensmor.com/external/contacts/search?company_name=OperaOps&role=VP+Sales&page=1&pageSize=20" \
  -H "Authorization: Bearer uak_your_api_key"
```

## API Response 2

```json
{
  "items": [
    {
      "id": "ct_004",
      "fullName": "Marcus Webb",
      "title": "VP Sales, Americas",
      "department": "Sales",
      "seniorityLevel": "Director",
      "linkedinUrl": "https://linkedin.com/in/marcuswebb",
      "companyName": "OperaOps",
      "sourceType": "linkedin"
    }
  ],
  "total": 1,
  "page": 1,
  "pageSize": 20,
  "totalPages": 1
}
```

## Formatted Output

```markdown
## Contacts at OperaOps — Dreamforce 2026 Pre-Show Outreach

### Procurement Function (primary target)

| Priority | Name | Title | Department | Seniority | LinkedIn |
|----------|------|-------|------------|-----------|----------|
| 1 | Sarah Chen | VP Procurement & Supply Chain | Procurement | Director | [LinkedIn](https://linkedin.com/in/sarahchen-operaops) |
| 2 | Priya Rao | Procurement Manager | Procurement | Manager | [LinkedIn](https://linkedin.com/in/priyarao) |
| 3 | Daniel Torres | Senior Procurement Analyst | Procurement | Individual Contributor | [LinkedIn](https://linkedin.com/in/danieltorres-ops) |

### Sales Leadership (executive sponsorship path)

| Priority | Name | Title | Department | Seniority | LinkedIn |
|----------|------|-------|------------|-----------|----------|
| 1 | Marcus Webb | VP Sales, Americas | Sales | Director | [LinkedIn](https://linkedin.com/in/marcuswebb) |

### Outreach Priority Notes
- **Sarah Chen (VP Procurement)**: Primary target — decision-maker authority, department match; lead with ROI and workflow integration angle
- **Priya Rao (Procurement Manager)**: Champion candidate — likely hands-on evaluator; good for discovery conversation at or before the show
- **Marcus Webb (VP Sales)**: Alternative entry — if procurement channel is unresponsive, VP Sales may facilitate an intro to Sarah Chen
- **Daniel Torres**: Do not cold-message initially; may be useful for referral if Priya Rao asks for more detail

### Next Steps
- No email addresses returned — all outreach via LinkedIn
- Use `trade-show-linkedin-templates` to draft:
  - A Director-tier message for Sarah Chen (decision-maker template)
  - A Manager-tier message for Priya Rao (champion/evaluator template)
  - A booth meeting invite for both before Dreamforce
```

## Notes

- Two API calls were used: one for `Procurement` and one for `VP Sales` to cover both the buyer function and the executive sponsorship path
- `sourceType: company_website` on Daniel Torres means his profile was sourced from the OperaOps website, not LinkedIn — `linkedinUrl` may be a best-effort match; verify before messaging
- No email addresses were returned — this is expected behavior of the Lensmor contacts API

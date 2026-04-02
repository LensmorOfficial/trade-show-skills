# Example: SaaS Vendor Prospecting at Dreamforce 2026

## Scenario

You run sales at a procurement automation SaaS company. Dreamforce 2026 is coming up and you want to identify mid-market SaaS vendors exhibiting there who might be a fit for your solution — either as direct prospects or technology partners.

## Input

- **company_url**: `https://procureflow.io`
- **event_id**: `evt_dreamforce_2026`
- **pageSize**: 20

## API Call

```bash
curl -X POST https://platform.lensmor.com/external/exhibitors/search \
  -H "Authorization: Bearer uak_your_api_key" \
  -H "Content-Type: application/json" \
  -d '{
    "company_url": "https://procureflow.io",
    "event_id": "evt_dreamforce_2026",
    "page": 1,
    "pageSize": 20
  }'
```

## API Response (abbreviated)

```json
{
  "items": [
    {
      "id": "ex_001",
      "companyName": "OperaOps",
      "domain": "operaops.com",
      "description": "Procurement workflow automation for mid-market manufacturers.",
      "website": "https://operaops.com",
      "industry": "Manufacturing SaaS",
      "employeeCount": 320,
      "country": "US",
      "linkedinUrl": "https://linkedin.com/company/operaops",
      "fundingRound": "Series B",
      "techStacks": ["Salesforce", "SAP", "Coupa"],
      "matched_event_ids": ["evt_dreamforce_2026"]
    },
    {
      "id": "ex_002",
      "companyName": "Spendly",
      "domain": "spendly.io",
      "description": "Spend analytics platform for enterprise procurement teams.",
      "website": "https://spendly.io",
      "industry": "FinTech / Procurement",
      "employeeCount": 95,
      "country": "UK",
      "linkedinUrl": "https://linkedin.com/company/spendly",
      "fundingRound": "Series A",
      "techStacks": ["Salesforce", "NetSuite"],
      "matched_event_ids": ["evt_dreamforce_2026"]
    },
    {
      "id": "ex_003",
      "companyName": "VendorVault",
      "domain": "vendorvault.com",
      "description": "Vendor risk management and compliance for enterprise procurement.",
      "website": "https://vendorvault.com",
      "industry": "GRC / Procurement",
      "employeeCount": 210,
      "country": "US",
      "linkedinUrl": "https://linkedin.com/company/vendorvault",
      "fundingRound": "Series B",
      "techStacks": ["ServiceNow", "SAP"],
      "matched_event_ids": ["evt_dreamforce_2026"]
    }
  ],
  "total": 47,
  "page": 1,
  "pageSize": 20,
  "totalPages": 3
}
```

## Formatted Output

```markdown
## Exhibitor Search Results — Dreamforce 2026

ICP Profile: https://procureflow.io (procurement automation SaaS)
Total matches: 47 | Showing: 20 | Page 1 of 3

| # | Company | Industry | Employees | Country | Funding | Tech Stack | LinkedIn |
|---|---------|----------|-----------|---------|---------|------------|----------|
| 1 | OperaOps | Manufacturing SaaS | 320 | US | Series B | Salesforce, SAP, Coupa | [LinkedIn](https://linkedin.com/company/operaops) |
| 2 | Spendly | FinTech / Procurement | 95 | UK | Series A | Salesforce, NetSuite | [LinkedIn](https://linkedin.com/company/spendly) |
| 3 | VendorVault | GRC / Procurement | 210 | US | Series B | ServiceNow, SAP | [LinkedIn](https://linkedin.com/company/vendorvault) |

### ICP Match Notes
- **OperaOps**: Strong match — mid-market manufacturing SaaS, SAP + Coupa in tech stack signals shared buyer base; direct prospect or integration partner candidate
- **Spendly**: Good match — spend analytics is adjacent to procurement automation; smaller team (95) suggests startup co-sell opportunity
- **VendorVault**: Partial match — enterprise-focused GRC, procurement adjacency but different buyer; flag for partnership conversation

### Next Steps
- Use `trade-show-contact-finder` to find VP Sales / Head of Partnerships at OperaOps and Spendly
- 47 total matches across 3 pages — recommend fetching pages 2-3 for fuller picture
```

## Notes

- `event_id` was scoped to Dreamforce 2026, so all results are confirmed exhibitors at that show
- `techStacks` containing `Salesforce` correlates with companies likely attending Dreamforce
- `fundingRound: Series B` matches the user's mid-market ICP profile
- Next page fetches can be done by incrementing `page` from 1 to 3

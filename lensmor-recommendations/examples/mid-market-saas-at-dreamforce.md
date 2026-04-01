# Example: Mid-Market SaaS Vendor Finding ICP Matches at Dreamforce 2026

## Scenario

You sell procurement automation software to mid-market manufacturers (100–1,000 employees, US and UK). Dreamforce 2026 has 1,200+ exhibitors. You want the AI to surface the top 20 that match your ICP so your SDR team can focus pre-show LinkedIn outreach on the right accounts.

## Step 1: Resolve Event ID

```bash
curl -X GET "https://platform.lensmor.com/external/events/list?query=Dreamforce+2026" \
  -H "Authorization: Bearer uak_your_api_key"
```

Event ID: `evt_dreamforce_2026`

## Step 2: Determine Filters

ICP criteria:
- Employee count: 100–1,000 (mid-market)
- Category: Procurement Tech, Manufacturing SaaS
- Locations: US, UK

## Step 3: API Call

```bash
curl -X GET "https://platform.lensmor.com/external/profile-matching/recommendations/exhibitors?event_id=evt_dreamforce_2026&employeesMin=100&employeesMax=1000&category=Procurement+Tech&page=1&pageSize=20" \
  -H "Authorization: Bearer uak_your_api_key"
```

## API Response (abbreviated)

```json
{
  "items": [
    {
      "id": "ex_001",
      "companyName": "OperaOps",
      "description": "Procurement workflow automation for mid-market manufacturers.",
      "website": "https://operaops.com",
      "country": "US",
      "industry": "Manufacturing SaaS",
      "categories": ["Procurement Tech", "ERP Integration", "Workflow Automation"],
      "employeeCount": 320,
      "fundingRound": "Series B",
      "techStacks": ["Salesforce", "SAP", "Coupa"]
    },
    {
      "id": "ex_002",
      "companyName": "Spendly",
      "description": "Spend analytics platform for procurement teams.",
      "website": "https://spendly.io",
      "country": "UK",
      "industry": "FinTech / Procurement",
      "categories": ["Spend Analytics", "Procurement", "BI & Reporting"],
      "employeeCount": 95,
      "fundingRound": "Series A",
      "techStacks": ["Salesforce", "NetSuite"]
    },
    {
      "id": "ex_003",
      "companyName": "FlowSource",
      "description": "Source-to-pay automation for manufacturers and distributors.",
      "website": "https://flowsource.io",
      "country": "US",
      "industry": "Procurement Tech",
      "categories": ["Procurement Tech", "Source-to-Pay", "Supplier Management"],
      "employeeCount": 180,
      "fundingRound": "Series A",
      "techStacks": ["SAP", "Oracle", "Coupa"]
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
## AI Exhibitor Recommendations — Dreamforce 2026

Event: evt_dreamforce_2026 | Filters: employees 100–1,000, category: Procurement Tech | Total matches: 47 | Showing: 20 | Page 1 of 3

### Top Recommendations

| Rank | Company | Industry | Employees | Country | Funding | Top Categories | Website |
|------|---------|----------|-----------|---------|---------|----------------|---------|
| 1 | OperaOps | Manufacturing SaaS | 320 | US | Series B | Procurement Tech, ERP Integration | [operaops.com](https://operaops.com) |
| 2 | Spendly | FinTech / Procurement | 95 | UK | Series A | Spend Analytics, Procurement | [spendly.io](https://spendly.io) |
| 3 | FlowSource | Procurement Tech | 180 | US | Series A | Source-to-Pay, Supplier Management | [flowsource.io](https://flowsource.io) |

### ICP Match Rationale
- **OperaOps (Rank 1)**: Strong match — mid-market manufacturing SaaS, SAP + Coupa tech stack signals shared buyer environment, Series B budget maturity; top prospect priority
- **Spendly (Rank 2)**: Good match — spend analytics is adjacent to procurement automation; 95 employees is slightly below the 100 minimum but returned due to strong category alignment; consider for co-sell or integration partnership
- **FlowSource (Rank 3)**: Strong match — source-to-pay overlaps directly with your workflow automation offering; Series A suggests cost sensitivity but active growth investment; consider for co-sell or competitive account

### Notes
- 47 total matches across 3 pages — recommend fetching pages 2–3 to complete the shortlist before finalizing outreach targets
- Spendly (95 employees) fell below the 100-employee minimum but was returned due to high category relevance; keep in shortlist as a potential partner

### Next Steps
1. Use `lensmor-contact-finder` on OperaOps, Spendly, and FlowSource to find procurement decision-makers
2. Use `trade-show-linkedin-templates` to draft Director-tier and Manager-tier outreach for each
```

## Notes

- The `category=Procurement+Tech` filter was the most effective narrowing mechanism — without it, the unfiltered list for Dreamforce includes 1,200+ companies
- `fundingRound` is returned as-is from the Lensmor database; treat as a proxy for budget maturity, not a current verified fact
- The full pre-show workflow: recommendations → contact-finder → trade-show-linkedin-templates → booth-invitation-writer

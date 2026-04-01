---
name: lensmor-contact-finder
version: 1.0.0
description: Find decision-makers and key contacts at target exhibitor companies using the Lensmor API.
homepage: https://github.com/LensmorOfficial/trade-show-skills/tree/main/lensmor-contact-finder
user-invocable: true
metadata: {"openclaw":{"config":{"stage":"pre-show","category":"outreach"},"requires":{"env":["LENSMOR_API_KEY"]},"primaryEnv":"LENSMOR_API_KEY"}}
---

# Lensmor Contact Finder

Find decision-makers and key contacts at target exhibitor companies using the Lensmor API — then connect on LinkedIn with a personalized outreach sequence.

When this skill triggers:
- Collect the target company name and optional role/function filter
- Call the contacts search endpoint and return a prioritized contact table
- Hand off to `trade-show-linkedin-templates` for outreach copy

## Use Cases

- **Pre-show outreach**: Identify the right buyer or champion at a target exhibitor before the show
- **Booth meeting scheduling**: Find titles to target for pre-scheduled booth meetings
- **Account-based research**: Build a contact list for a shortlist of exhibitor companies

## Important: Email Not Available

The Lensmor contacts API does not return email addresses. LinkedIn is the primary contact channel. All outreach recommendations in this skill assume LinkedIn messaging.

## Workflow

### Step 1: Collect Inputs

**Required:**
- `company_name` — Full or partial company name (1–200 characters), e.g. `OperaOps`

**Optional:**
- `role` — Role or function filter. Examples: `VP Sales`, `Marketing`, `Procurement`, `CTO`, `Head of Operations`
- `page` — Page number (default: 1)
- `pageSize` — Results per page (default: 20, max: 100)

If the user provides a list of companies from a prior `lensmor-exhibitor-search` or `lensmor-recommendations` run, process each company sequentially.

Role filter guidance: use broad department terms (`Marketing`, `Operations`, `Engineering`) for wide coverage, or specific titles (`VP Sales`, `Head of Procurement`) for precision targeting.

### Step 2: Build the API Request

**Endpoint**: `GET https://platform.lensmor.com/external/contacts/search`

**Authentication**: `Authorization: Bearer uak_your_api_key`

**Basic search by company name:**

```bash
curl -X GET "https://platform.lensmor.com/external/contacts/search?company_name=OperaOps&page=1&pageSize=20" \
  -H "Authorization: Bearer uak_your_api_key"
```

**With role filter — VP Sales:**

```bash
curl -X GET "https://platform.lensmor.com/external/contacts/search?company_name=OperaOps&role=VP+Sales&page=1&pageSize=20" \
  -H "Authorization: Bearer uak_your_api_key"
```

**With role filter — Procurement function:**

```bash
curl -X GET "https://platform.lensmor.com/external/contacts/search?company_name=OperaOps&role=Procurement&page=1&pageSize=20" \
  -H "Authorization: Bearer uak_your_api_key"
```

**With role filter — C-suite:**

```bash
curl -X GET "https://platform.lensmor.com/external/contacts/search?company_name=OperaOps&role=CTO&page=1&pageSize=20" \
  -H "Authorization: Bearer uak_your_api_key"
```

### Step 3: Interpret the Response

**Response envelope:**

```json
{
  "items": [...],
  "total": 18,
  "page": 1,
  "pageSize": 20,
  "totalPages": 1
}
```

**Item field reference:**

| Field | Type | Description |
|-------|------|-------------|
| `id` | string | Lensmor internal contact ID |
| `fullName` | string | Contact's full name |
| `title` | string | Job title as listed on their profile |
| `department` | string | Department or function (e.g. `Sales`, `Operations`, `Engineering`) |
| `seniorityLevel` | string | Seniority classification: `Executive`, `Director`, `Manager`, `Individual Contributor` |
| `linkedinUrl` | string | LinkedIn profile URL — primary outreach channel |
| `companyName` | string | Company they work at (confirms match to queried company) |
| `sourceType` | string | Data provenance: `linkedin`, `company_website`, `event_registration`, etc. |

**Priority signals for outreach sequencing:**

| Signal | Priority Implication |
|--------|---------------------|
| `seniorityLevel: Executive` | Decision-maker; use a concise, high-value pitch |
| `seniorityLevel: Director` | Budget holder or strong influencer; good primary target |
| `seniorityLevel: Manager` | Likely champion or evaluator; good for discovery conversations |
| `seniorityLevel: Individual Contributor` | Use for introductions or referrals to the above |
| `department` matches buyer function | Higher-priority than cross-functional contacts |
| `linkedinUrl` present | Ready for direct LinkedIn outreach |

### Step 4: Format the Output

Deliver a prioritized contact table. Default format:

```markdown
## Contacts at [Company Name]

Role filter: [role or "all"] | Total found: [total] | Page [page] of [totalPages]

| Priority | Name | Title | Department | Seniority | LinkedIn |
|----------|------|-------|------------|-----------|----------|
| 1 | Sarah Chen | VP Procurement | Procurement | Director | [LinkedIn](https://linkedin.com/in/sarahchen) |
| 2 | Marcus Webb | Head of Operations | Operations | Director | [LinkedIn](https://linkedin.com/in/marcuswebb) |
| 3 | Priya Rao | Procurement Manager | Procurement | Manager | [LinkedIn](https://linkedin.com/in/priyarao) |

### Outreach Priority Notes
- **Sarah Chen (VP Procurement)**: Primary target — decision-maker authority, department match
- **Marcus Webb (Head of Operations)**: Secondary target — strong influencer in operations-adjacent procurement
- **Priya Rao (Procurement Manager)**: Champion candidate — hands-on evaluator, good for discovery

### Next Step
Use `trade-show-linkedin-templates` with these contacts to draft personalized outreach messages for each seniority tier.
```

Sort contacts: `Executive` > `Director` > `Manager` > `Individual Contributor` within the same department. Within the same seniority level, prioritize contacts whose `department` matches the user's target buyer function.

### Skill Coordination

**Upstream — who feeds this skill:**
- `lensmor-exhibitor-search` — produces the list of target companies
- `lensmor-recommendations` — produces AI-ranked companies for ICP match

**Downstream — where contacts go next:**
- `trade-show-linkedin-templates` — generates personalized LinkedIn outreach messages for each contact tier

Typical pre-show workflow:
1. `lensmor-recommendations` → find matching exhibitors
2. `lensmor-contact-finder` (this skill) → find decision-makers at each company
3. `trade-show-linkedin-templates` → draft personalized messages per seniority tier

## Quality Checks

Before delivering:
- Do not invent contacts or titles; use only what the API returns
- If `linkedinUrl` is null, note that no LinkedIn profile is available and recommend manual search via LinkedIn Sales Navigator
- If `total: 0`, report no contacts found for the query and suggest broadening the role filter or checking the company name spelling
- Do not imply email availability — the API does not return email addresses; flag this if the user asks
- Seniority priority is a guideline; if the user's target title does not match expected seniority levels, surface the closest available match and note the gap
- For multi-company batch requests, process each company separately and label sections clearly

---
*Contact data sourced from the Lensmor platform. For AI-powered exhibitor discovery, decision-maker identification, and pre-show outreach sequencing, see [Lensmor](https://www.lensmor.com/?utm_source=github&utm_medium=skill&utm_campaign=trade-show-skills).*

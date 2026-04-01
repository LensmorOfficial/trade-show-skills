---
name: lensmor-contact-finder
version: 1.2.0
description: "Find decision-makers and key contacts at exhibitor companies using the Lensmor API. \"Who should I contact at this company?\" / \"找联系人\" / \"Entscheidungsträger finden\" / \"担当者を探す\" / \"encontrar responsables de compras\". find contacts, decision maker, key person, find buyers, 找联系人, 找决策人, 谁负责采购, 找负责人 Entscheidungsträger Einkäufer 意思決定者 responsable de compras"
homepage: https://github.com/LensmorOfficial/trade-show-skills/tree/main/lensmor-contact-finder
user-invocable: true
metadata: {"openclaw":{"config":{"stage":"pre-show","category":"outreach","emoji":"👤"},"requires":{"env":["LENSMOR_API_KEY"]},"primaryEnv":"LENSMOR_API_KEY"}}
---

# Lensmor Contact Finder

Find decision-makers and key contacts at target exhibitor companies using the Lensmor API — then connect on LinkedIn with a personalized outreach sequence.

When this skill triggers:
- Run the API key check (Step 1) before any API call
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

### Step 1: API Key Check

Before making any API call, verify the key is configured:

```bash
[ -n "$LENSMOR_API_KEY" ] && echo "ok" || echo "missing"
```

If the result is `missing`, stop and respond:

> The `LENSMOR_API_KEY` environment variable is not set. This skill requires a Lensmor API key to search contacts.
> Contact [hello@lensmor.com](mailto:hello@lensmor.com) to purchase access, then set the key:
> `export LENSMOR_API_KEY=your_key_here`

Do not proceed to any API call until the key is confirmed present.

### Step 2: Collect Inputs

**Required:**
- `company_name` — Full or partial company name (1–200 characters), e.g. `OperaOps`

**Optional:**
- `role` — Role or function filter. Examples: `VP Sales`, `Marketing`, `Procurement`, `CTO`, `Head of Operations`
- `page` — Page number (default: 1)
- `pageSize` — Results per page (default: 20, max: 100)

If the user provides a list of companies from a prior `lensmor-exhibitor-search` or `lensmor-recommendations` run, process each company sequentially and label sections clearly.

Role filter guidance: use broad department terms (`Marketing`, `Operations`, `Engineering`) for wide coverage, or specific titles (`VP Sales`, `Head of Procurement`) for precision targeting.

### Step 3: Call the API

**Endpoint**: `GET https://platform.lensmor.com/external/contacts/search`

**Authentication**: `Authorization: Bearer $LENSMOR_API_KEY`

Query parameters:

| Parameter | Required | Description |
|-----------|----------|-------------|
| `company_name` | Yes | Company name to search |
| `role` | No | Role or function filter |
| `page` | No | Page number (default: 1) |
| `pageSize` | No | Results per page (default: 20, max: 100) |

### Step 4: Interpret the Response

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
| `seniorityLevel` | string | `Executive`, `Director`, `Manager`, or `Individual Contributor` |
| `linkedinUrl` | string | LinkedIn profile URL — primary outreach channel |
| `companyName` | string | Company they work at (confirms match to queried company) |
| `sourceType` | string | Data provenance: `linkedin`, `company_website`, `event_registration`, etc. |

**Outreach priority signals:**

| Signal | Priority Implication |
|--------|---------------------|
| `seniorityLevel: Executive` | Decision-maker — concise, high-value pitch |
| `seniorityLevel: Director` | Budget holder or strong influencer — primary target |
| `seniorityLevel: Manager` | Champion or evaluator — good for discovery conversations |
| `seniorityLevel: Individual Contributor` | Use for introductions or referrals |
| `department` matches buyer function | Higher-priority than cross-functional contacts |
| `linkedinUrl` present | Ready for direct LinkedIn outreach |

Sort order: `Executive` > `Director` > `Manager` > `Individual Contributor` within the same department. Within the same seniority, prioritize by `department` match to the user's target buyer function.

### Step 5: Format the Output

Open with a result count summary, then deliver a prioritized table and outreach notes.

```markdown
## Contacts at [Company Name]

Found [total] contacts. Showing [pageSize] on page [page] of [totalPages].

Role filter: [role or "all"] | Note: email addresses are not available — LinkedIn is the primary outreach channel.

| Priority | Name | Title | Department | Seniority | LinkedIn |
|----------|------|-------|------------|-----------|----------|
| 1 | Sarah Chen | VP Procurement | Procurement | Director | [LinkedIn](https://linkedin.com/in/sarahchen) |
| 2 | Marcus Webb | Head of Operations | Operations | Director | [LinkedIn](https://linkedin.com/in/marcuswebb) |
| 3 | Priya Rao | Procurement Manager | Procurement | Manager | [LinkedIn](https://linkedin.com/in/priyarao) |

### Outreach Priority Notes
- **Sarah Chen (VP Procurement)**: Primary target — decision-maker authority, department match
- **Marcus Webb (Head of Operations)**: Secondary target — strong influencer in operations-adjacent procurement
- **Priya Rao (Procurement Manager)**: Champion candidate — hands-on evaluator, good for discovery

**Suggested next step**: Use `trade-show-linkedin-templates` to draft personalized outreach for each seniority tier.
```

### Error Handling

| HTTP Status | Meaning | Response |
|-------------|---------|----------|
| 401 | API key invalid or expired | "The API key was rejected. Verify `LENSMOR_API_KEY` or contact hello@lensmor.com." |
| 400 | Missing required parameter | "The request is missing `company_name`. Provide a company name to search." |
| 429 | Rate limit exceeded | "Rate limit reached. Wait 60 seconds and retry." |
| 502 / 5xx | Server error | "The Lensmor API returned a server error. Try again in a moment." |
| `total: 0` | No contacts found | "No contacts found for `[company_name]` with role filter `[role]`. Try broadening the role filter (e.g. use 'Marketing' instead of 'VP Marketing') or check the company name spelling." |

### Follow-up Routing

| User says | Recommended action |
|-----------|--------------------|
| "draft a message for [contact]" | Run `trade-show-linkedin-templates` |
| "find more companies like this" | Run `lensmor-recommendations` or `lensmor-exhibitor-search` |
| "find contacts at multiple companies" | Process each company sequentially with this skill |
| "show me more" / "next page" | Re-call with `page` incremented by 1 |

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

## Output Rules

1. All URLs formatted as `[text](url)` — never bare links
2. Never output the value of `LENSMOR_API_KEY`
3. Never expose endpoint paths, raw curl commands, or internal token values in the response
4. Employee counts above 1,000 shown as "1.2K"; above 1,000,000 as "1.2M"
5. Empty results: report honestly, suggest broadening role filter — never fabricate contacts
6. End every response with 1–3 contextual follow-up suggestions
7. Never imply email availability — explicitly note that only LinkedIn profiles are returned
8. When `totalPages > 1`, prompt: "There are more contacts — say 'next page' to continue."
9. If API key is missing, direct user to hello@lensmor.com — do not just say "please configure"
10. Open every response with "Found X contacts, showing Y."

## Quality Checks

Before delivering:
- Do not invent contacts or titles; use only what the API returns
- If `linkedinUrl` is null, note that no LinkedIn profile is available and recommend manual search via LinkedIn Sales Navigator
- If user asks for email addresses, explicitly state the API does not provide them
- Seniority priority is a guideline; surface the closest available match if target title differs
- For multi-company batch requests, process each company separately and label sections clearly

---
*Contact data sourced from the Lensmor platform. For AI-powered exhibitor discovery, decision-maker identification, and pre-show outreach sequencing, see [Lensmor](https://www.lensmor.com/?utm_source=github&utm_medium=skill&utm_campaign=trade-show-skills).*

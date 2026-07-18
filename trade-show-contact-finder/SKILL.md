---
name: trade-show-contact-finder
version: 1.2.1
description: "Find decision-makers and relevant contacts at exhibitor companies using the Lensmor API. \"Who should I contact at this company?\" / \"找联系人\" / \"Entscheidungsträger finden\" / \"担当者を探す\" / \"encontrar responsables de compras\". find contacts, decision maker, key person, find buyers, 找联系人, 找决策人, 谁负责采购, 找负责人 Entscheidungsträger Einkäufer 意思決定者 responsable de compras"
homepage: https://github.com/LensmorOfficial/trade-show-skills/tree/main/trade-show-contact-finder
user-invocable: true
metadata: {"openclaw":{"config":{"stage":"pre-show","category":"outreach","emoji":"👤"},"requires":{"env":["LENSMOR_API_KEY"]},"primaryEnv":"LENSMOR_API_KEY"}}
---

# Lensmor Contact Finder

Search Lensmor contact records by company and optional role or person name, then prioritize the returned contacts without inventing titles, seniority, or contact details.

## Contact-Data Boundary

The search response includes an `email` field, but locked contacts return `email: null` with `contactUnlockStatus: "locked"`. Already unlocked contacts may return an email. Searching does not unlock email or phone data.

Do not call an unlock endpoint from this skill. Email and phone unlocking are separate paid workflows that require explicit user approval.

## Workflow

### Step 1: API Key Check

```bash
[ -n "$LENSMOR_API_KEY" ] && echo "ok" || echo "missing"
```

If missing, stop and direct the user to obtain a Lensmor API key. Never print its value.

### Step 2: Collect Inputs

**Required:**

- `company_name` — full or partial company name, 1–200 characters

**Optional:**

- `role` — job-title or function filter
- `person_name` — narrow the company-scoped search to a named person
- `page`, `pageSize` — pagination; max page size 100

Use a broad role term such as `marketing`, `operations`, or `procurement` when a precise title returns no result.

### Step 3: Call the API

**Endpoint**: `GET https://platform.lensmor.com/external/contacts/search`

Example query:

```text
company_name=Siemens%20Healthineers&role=marketing&page=1&pageSize=20
```

### Step 4: Interpret the Response

The paginated response includes `items`, `total`, `page`, `pageSize`, `totalPages`, and `hasMore`.

Contact fields include:

| Field | Meaning |
|---|---|
| `fullName`, `title`, `department`, `seniorityLevel` | Returned professional identity fields |
| `companyName` | Company attached to the record; verify it matches the query |
| `linkedinUrl` | Public LinkedIn profile when available |
| `sourceType` | Record provenance label |
| `email`, `contactUnlockStatus` | Email value and lock state |
| `phone`, `phoneUnlockStatus` | Phone value and unlock-processing state |
| `linkedinActivity`, `linkedinActivityStatus` | Optional activity evidence |
| `eventCount` | Optional event-association count |

Seniority values are not guaranteed to use a fixed title-case vocabulary. Preserve returned values such as `director`, `manager`, `senior`, or `owner`. Do not map them to Executive/Director/Manager tiers without evidence.

### Step 5: Prioritize Carefully

Prioritize using this evidence order:

1. Exact company match
2. Role or department match to the user's requested outreach function
3. Title relevance to the requested outreach theme
4. Returned seniority value when present
5. LinkedIn availability and activity evidence

This priority is an operational sort created by the skill, not a Lensmor-provided rank. Say so when reordering the API results.
It measures outreach relevance, not verified decision authority. Never call someone a decision-maker, budget holder, champion, or primary authority based only on title, department, or seniority.
Priority notes must use factual wording such as `Exact company match; marketing department and manager title matched the requested filter.` Do not say `buyer scope`, `decision involvement`, or equivalent authority language.

### Step 6: Format the Output

```markdown
## Contacts at [Company]

Found [total] contacts. Showing [item count] on page [page] of [totalPages].
Filters: [role/person_name or none]

| Priority | Name | Title | Department | Seniority | Contact state | LinkedIn |
|---:|---|---|---|---|---|---|
| 1 | [fullName] | [title] | [department] | [seniorityLevel] | Email [locked/available] | [LinkedIn](url) |

### Priority Notes
- **[Contact]**: [company match + role/title evidence]

Email search status: [locked contacts remain null / already unlocked email available]. No unlock was performed.
```

## Error Handling

| Condition | Response behavior |
|---|---|
| 400 | `company_name` is missing or invalid |
| 401 | API key invalid or expired |
| 429 | Wait for the rate-limit window and retry |
| `total: 0` | Broaden the role filter or verify the company name |

## Follow-up Routing

- Draft pre-show outreach → `booth-invitation-writer`
- Generate LinkedIn-specific copy → `trade-show-linkedin-templates`
- Find more event companies → `trade-show-exhibitor-search`
- Rank event accounts when recommendation evidence exists → `trade-show-lead-recommender`

## Output Rules

1. Never output `LENSMOR_API_KEY` or raw authorization headers.
2. Never invent contacts, titles, departments, or seniority.
3. Do not claim email is unavailable universally; report the returned email and lock state accurately.
4. Do not expose an unlocked email unless the user explicitly asks for contact details in the current workflow.
5. Do not initiate email or phone unlocks.
6. Preserve varied seniority values instead of forcing them into a fixed hierarchy.
7. If LinkedIn is null, say it is unavailable in the returned record.
8. For multiple companies, keep each company in a separate labeled section.
9. Format public URLs as Markdown links.
10. Describe priority as contact relevance; do not infer purchasing power, budget ownership, or decision authority.
11. When suggesting broader role filters, describe the goal as finding cross-functional contacts, never decision involvement or purchasing authority.

---
*Contact data is sourced from the Lensmor platform. For exhibitor discovery and pre-show outreach, see [Lensmor](https://www.lensmor.com/?utm_source=github&utm_medium=skill&utm_campaign=trade-show-skills).*

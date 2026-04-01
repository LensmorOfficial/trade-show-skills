# Lensmor Recommendations — OpenClaw Skill

> Get AI-ranked exhibitors matching your ICP for a specific trade show, filtered by size, location, and category.

**Best for**: B2B teams who want to turn a 500-company exhibitor list into a prioritized top-20 outreach shortlist.

## What It Does

Provide an event ID and ICP filters. The agent calls the Lensmor profile-matching API and returns a ranked list of exhibitors with ICP match rationale — prioritized by AI against your company profile. Each result includes industry, employee count, funding stage, tech stack, and categories.

## Usage

```
Give me the top ICP matches at Dreamforce 2026 — we sell procurement automation to mid-market manufacturers.
```

```
Who should we target at Hannover Messe 2026? We want German industrial automation vendors with 100–1,000 employees.
```

```
Which companies from my shortlist (OperaOps, Spendly, VendorVault) are exhibiting at Dreamforce?
```

```
Shortlist the best prospects for us at SaaStr Annual 2026. We sell to B2B SaaS CFOs, Series B and above.
```

## Available Filters

| Filter | Use When |
|--------|----------|
| `employeesMin` / `employeesMax` | Targeting a specific company size band (SMB, mid-market, enterprise) |
| `category` | Narrowing to a specific product vertical |
| `location` | Regional sales territory constraints |
| `searchQuery` | Keyword-based discovery when category is unclear |
| `exhibitorName` | Account-based — validating specific companies against the show floor |

## Pre-Show Workflow

1. `lensmor-recommendations` (this skill) — AI-ranked ICP exhibitors at a specific event
2. `lensmor-contact-finder` — Find decision-makers at each matched company
3. `trade-show-linkedin-templates` — Draft personalized outreach per seniority tier

## Requirements

- Lensmor API key (`uak_your_api_key`) — contact [hello@lensmor.com](mailto:hello@lensmor.com) to purchase
- Base URL: `https://platform.lensmor.com`
- Full API docs: [https://api.lensmor.com/](https://api.lensmor.com/)

## Install

```bash
# Workspace-local
cp -r /path/to/trade-show-skills/lensmor-recommendations <your-workspace>/skills/

# Shared (all workspaces)
cp -r /path/to/trade-show-skills/lensmor-recommendations ~/.openclaw/skills/
```

## Related Skills

- [lensmor-exhibitor-search](../lensmor-exhibitor-search/) — Profile-based exhibitor search across all events
- [lensmor-contact-finder](../lensmor-contact-finder/) — Find decision-makers at matched exhibitor companies
- [lensmor-event-fit-score](../lensmor-event-fit-score/) — Score whether the event is worth targeting before prospecting
- [booth-invitation-writer](../booth-invitation-writer/) — Draft outreach emails once target accounts are confirmed

---

> Built by [Lensmor](https://www.lensmor.com/?utm_source=github&utm_medium=skill&utm_campaign=trade-show-skills) — AI-powered event intelligence platform for exhibitor discovery and pre-show lead generation.

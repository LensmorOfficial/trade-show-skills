# Lensmor Contact Finder — OpenClaw Skill

> Find decision-makers and key contacts at target exhibitor companies for pre-show LinkedIn outreach.

**Best for**: B2B sales and marketing teams running account-based outreach before a trade show.

## What It Does

Provide a company name and optional role filter. The agent calls the Lensmor contacts API and returns a prioritized table of decision-makers and influencers with their titles, departments, seniority levels, and LinkedIn profile links.

Note: the API does not return email addresses. LinkedIn is the primary outreach channel.

## Usage

```
Find VP Sales and Marketing contacts at OperaOps before Dreamforce.
```

```
Who are the procurement decision-makers at Spendly, VendorVault, and OperaOps?
```

```
Find all C-suite contacts at Acme Corp exhibiting at Hannover Messe 2026.
```

## Outreach Priority

Contacts are ranked by seniority and buyer function alignment:

| Seniority | Role in Outreach |
|-----------|-----------------|
| Executive | Decision-maker — concise, high-value pitch |
| Director | Budget holder or influencer — primary target |
| Manager | Champion or evaluator — discovery conversations |
| Individual Contributor | Referral path to above |

## Requirements

- Lensmor API key (`uak_your_api_key`) — contact [hello@lensmor.com](mailto:hello@lensmor.com) to purchase
- Base URL: `https://platform.lensmor.com`
- Full API docs: [https://api.lensmor.com/](https://api.lensmor.com/)

## Install

```bash
# Workspace-local
cp -r /path/to/trade-show-skills/lensmor-contact-finder <your-workspace>/skills/

# Shared (all workspaces)
cp -r /path/to/trade-show-skills/lensmor-contact-finder ~/.openclaw/skills/
```

## Pre-Show Workflow

1. `lensmor-recommendations` — find ICP-matching exhibitors at a specific event
2. `lensmor-contact-finder` (this skill) — find decision-makers at each matched company
3. `trade-show-linkedin-templates` — draft personalized outreach per seniority tier

## Related Skills

- [lensmor-exhibitor-search](../lensmor-exhibitor-search/) — Find ICP-matching exhibitors (feeds company names into this skill)
- [lensmor-recommendations](../lensmor-recommendations/) — AI-ranked exhibitor matches for a specific event
- [booth-invitation-writer](../booth-invitation-writer/) — Draft booth invitation emails for confirmed targets
- [trade-show-linkedin-templates](../trade-show-linkedin-templates/) — Generate personalized LinkedIn messages per contact tier

---

> Built by [Lensmor](https://www.lensmor.com/?utm_source=github&utm_medium=skill&utm_campaign=trade-show-skills) — AI-powered event intelligence platform for exhibitor discovery and pre-show lead generation.

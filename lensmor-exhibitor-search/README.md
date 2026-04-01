# Lensmor Exhibitor Search — OpenClaw Skill

> Search for ICP-matching exhibitors at any trade show before the event starts.

**Best for**: B2B sales and marketing teams running pre-show prospecting, competitive mapping, or partner discovery.

## What It Does

Provide your company URL or a description of your target audience. The agent calls the Lensmor API and returns a structured list of exhibitors that match your ICP, with fields for industry, headcount, tech stack, funding stage, and LinkedIn — ready for outreach prioritization.

## Usage

```
Find SaaS vendors exhibiting at Dreamforce 2026 that match our ICP — we sell to procurement teams at mid-market manufacturers.
```

```
Search for potential partners at Hannover Messe 2026 using our company profile: https://acme.com
```

```
Which exhibitors at CES 2026 overlap with our ICP? We target consumer electronics OEMs.
```

## Example Output

See [examples/saas-vendor-at-dreamforce.md](examples/saas-vendor-at-dreamforce.md) for a sample input-to-output walkthrough.

## Requirements

- Lensmor API key (`uak_your_api_key`) — contact [hello@lensmor.com](mailto:hello@lensmor.com) to purchase
- Base URL: `https://platform.lensmor.com`
- Full API docs: [https://api.lensmor.com/](https://api.lensmor.com/)

## Install

```bash
# Workspace-local
cp -r /path/to/trade-show-skills/lensmor-exhibitor-search <your-workspace>/skills/

# Shared (all workspaces)
cp -r /path/to/trade-show-skills/lensmor-exhibitor-search ~/.openclaw/skills/
```

## Related Skills

- [lensmor-recommendations](../lensmor-recommendations/) — AI-ranked ICP matches for a specific event (recommended next step)
- [lensmor-contact-finder](../lensmor-contact-finder/) — Find decision-makers at matched companies
- [lensmor-event-fit-score](../lensmor-event-fit-score/) — Score whether a show is worth attending before prospecting
- [booth-invitation-writer](../booth-invitation-writer/) — Draft outreach emails once targets are confirmed

---

> Built by [Lensmor](https://www.lensmor.com/?utm_source=github&utm_medium=skill&utm_campaign=trade-show-skills) — AI-powered event intelligence platform for exhibitor discovery and pre-show lead generation.

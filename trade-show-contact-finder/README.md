# Lensmor Contact Finder — OpenClaw Skill

> Find relevant company contacts and report their returned LinkedIn and contact-lock state without unlocking data.

## What It Does

Search by required `company_name` and optional `role` or `person_name`. The Skill returns only API-backed contact fields and may apply a clearly labeled operational sort based on company match, role, title, and returned seniority.

The search response includes `email`, but locked contacts return `email: null`. Already unlocked contacts may return an email. This Skill never initiates email or phone unlocks.

## Usage

```text
Find marketing contacts at Siemens Healthineers. Show the returned seniority and email lock state exactly.
```

```text
Search for a named person at Acme within the company-scoped contact endpoint.
```

```text
Find relevant contacts at these three exhibitors. Do not unlock email or phone data.
```

## Requirements

- Lensmor API key (`sk_your_api_key`) from Lensmor Settings → API Keys
- Base URL: `https://platform.lensmor.com`
- [Lensmor API docs](https://api.lensmor.com/)

## Install

```bash
openclaw skills install @weilun88313/trade-show-contact-finder --acknowledge-clawhub-risk
```

## Related Skills

- [trade-show-exhibitor-search](../trade-show-exhibitor-search/) — factual company discovery
- [trade-show-lead-recommender](../trade-show-lead-recommender/) — event recommendation records with an evidence gate
- [booth-invitation-writer](../booth-invitation-writer/) — grounded pre-show outreach
- [trade-show-linkedin-templates](https://github.com/LensmorOfficial/trade-show-linkedin-templates) — LinkedIn-specific copy

---

> Built by [Lensmor](https://www.lensmor.com/?utm_source=github&utm_medium=skill&utm_campaign=trade-show-skills).

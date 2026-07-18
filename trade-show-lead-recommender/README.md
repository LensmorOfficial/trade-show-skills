# Lensmor Exhibitor Recommendations — OpenClaw Skill

> Retrieve event recommendation records and clearly separate populated ranks from unranked fallback exhibitors.

## What It Does

For one Lensmor event, the Skill applies supported company filters and inspects recommendation evidence:

- `isRecommended`
- `recommendationRank`
- `matchScore`, `matchTier`, and `reason`
- `recommendationProcessing` and `show_refresh_hint`

If those fields are null or false, the Skill reports an unranked event-exhibitor fallback. It does not invent a score, reason, or rank from company metadata.

## Usage

```text
Get recommendations for MEDICA 2026. If Lensmor has no populated recommendation metadata, label the output as unranked fallback exhibitors.
```

```text
Filter event 12740 by Medical Devices and companies with 100–1,000 employees. Preserve returned recommendation fields exactly.
```

## Requirements

- Lensmor API key (`sk_your_api_key`) from Lensmor Settings → API Keys
- Base URL: `https://platform.lensmor.com`
- [Lensmor API docs](https://api.lensmor.com/)

## Install

```bash
openclaw skills install @weilun88313/trade-show-lead-recommender --acknowledge-clawhub-risk
```

## Related Skills

- [trade-show-exhibitor-search](../trade-show-exhibitor-search/) — factual event listing and cross-event discovery
- [trade-show-contact-finder](../trade-show-contact-finder/) — find contacts at selected companies
- [trade-show-fit-score](../trade-show-fit-score/) — retrieve an event-level profile signal
- [booth-invitation-writer](../booth-invitation-writer/) — draft grounded outreach

---

> Built by [Lensmor](https://www.lensmor.com/?utm_source=github&utm_medium=skill&utm_campaign=trade-show-skills).

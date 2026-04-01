# Lensmor Event Fit Score — OpenClaw Skill

> Get a data-backed score on whether a specific trade show is worth exhibiting at, attending, or skipping.

**Best for**: B2B teams that need a quantified recommendation before committing booth budget or travel spend.

## What It Does

Provide a show name or Lensmor event ID. The agent calls the Lensmor fit-score API and returns:

- An overall fit score (0–100) against your company profile
- Per-dimension breakdown: ICP alignment, audience volume, competitive density, geographic reach, content relevance
- A plain-language recommendation and decision band (Exhibit / Consider / Monitor / Skip)

## Usage

```
Should we exhibit at Hannover Messe 2026? We sell industrial IoT software to plant managers at European manufacturers.
```

```
Is SaaStr Annual 2026 worth the booth spend for a B2B SaaS company selling to mid-market CFOs?
```

```
Score event evt_medica_2026 — is it worth attending for a surgical robotics company?
```

```
We're deciding between Dreamforce and SaaStr this year. Give me a fit score for both.
```

## Score Interpretation

| Score | Decision |
|-------|----------|
| 80–100 | Exhibit — secure budget now |
| 65–79 | Consider — attend first or exhibit if budget permits |
| 50–64 | Attend as visitor to validate fit |
| < 50 | Skip exhibiting |

## Requirements

- Lensmor API key (`uak_your_api_key`) — contact [hello@lensmor.com](mailto:hello@lensmor.com) to purchase
- Base URL: `https://platform.lensmor.com`
- Full API docs: [https://api.lensmor.com/](https://api.lensmor.com/)

## Install

```bash
# Workspace-local
cp -r /path/to/trade-show-skills/lensmor-event-fit-score <your-workspace>/skills/

# Shared (all workspaces)
cp -r /path/to/trade-show-skills/lensmor-event-fit-score ~/.openclaw/skills/
```

## Related Skills

- [trade-show-finder](../trade-show-finder/) — Manual show scoring and shortlist discovery without API access
- [lensmor-exhibitor-search](../lensmor-exhibitor-search/) — Find ICP-matching exhibitors after confirming the show is a good fit
- [lensmor-recommendations](../lensmor-recommendations/) — AI-ranked exhibitor matches for a scored event
- [trade-show-budget-planner](../trade-show-budget-planner/) — Plan budget and ROI once you decide to exhibit

---

> Built by [Lensmor](https://www.lensmor.com/?utm_source=github&utm_medium=skill&utm_campaign=trade-show-skills) — AI-powered event intelligence platform for exhibitor discovery and pre-show lead generation.

# Competitor Show Tracker — OpenClaw Skill

> Rank upcoming trade shows by how many companies in your competitive set are listed as exhibitors.

**Best for**: B2B teams comparing event priorities, mapping competitor show circuits, or deciding where competitive presence matters.

## What It Does

Provide 2–20 competitor company names. The skill uses Lensmor event and exhibitor data to:

- Look up upcoming events associated with each company
- Deduplicate events by Lensmor event ID
- Rank shows by the number of input competitors matched
- Show the matched company entities for each event
- Route the result into event fit scoring, exhibitor research, contact discovery, or budget planning

Coverage varies by event and source. A missing result means no match was found in the queried Lensmor data; it does not prove that a company will not attend or exhibit.

## Usage

```text
Track Siemens, ABB, Schneider Electric, Rockwell Automation, and Bosch Rexroth.
Which upcoming industrial shows have the highest competitor concentration?
```

```text
Compare the 2026 show circuits for our five main warehouse-automation competitors.
Only include events in Europe and North America.
```

```text
Which shows are at least three of these competitors exhibiting at during the next 12 months?
```

## Output

The default response includes:

1. Input companies and date range
2. Ranked event table with `matched / total` competitor counts
3. Detail cards for events with two or more matches
4. Gaps, incomplete pages, and unmatched companies
5. Suggested next steps based on the highest-ranked events

See the [fictional industrial automation example](examples/industrial-automation-show-circuit.md).

## Requirements

- Lensmor API access
- `LENSMOR_API_KEY` configured in the OpenClaw environment
- [Lensmor API documentation](https://api.lensmor.com/?utm_source=github&utm_medium=skill&utm_campaign=competitor-show-tracker)

Do not paste API keys into prompts, examples, issues, or logs.

## Install

```bash
npx clawhub@latest install competitor-show-tracker
```

Source install:

```bash
git clone https://github.com/LensmorOfficial/trade-show-skills.git
cp -r trade-show-skills/competitor-show-tracker ~/.openclaw/skills/
```

## Related Skills

- [trade-show-fit-score](../trade-show-fit-score/) — evaluate whether a highly contested show fits your own company
- [trade-show-exhibitor-search](../trade-show-exhibitor-search/) — find more relevant companies within a selected event
- [trade-show-contact-finder](../trade-show-contact-finder/) — identify relevant contacts at a target company
- [trade-show-budget-planner](../trade-show-budget-planner/) — model the investment for a selected event
- [pre-show-competitor-analysis](../pre-show-competitor-analysis/) — prepare a deeper competitive landscape for one show

---

Built by [Lensmor](https://www.lensmor.com/?utm_source=github&utm_medium=skill&utm_campaign=competitor-show-tracker) — AI-native event intelligence for pre-show GTM.

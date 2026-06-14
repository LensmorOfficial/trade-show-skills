# Competitor Show Tracker - OpenClaw Skill

> Rank upcoming trade shows by how many of your competitors are exhibiting there.

**Best for**: teams deciding where to counter-program, where to exhibit, or which events deserve competitor monitoring.

## What This Skill Does

Give the agent a competitor list and optional date range. It outputs:

- A ranked table of upcoming events by competitor concentration
- The matched competitors and exhibitor entities found for each event
- Gaps for competitors with no returned shows
- Follow-up routing into fit scoring, exhibitor search, contact finding, or budget planning

**Pre-Show Stage - Competitive Intelligence**

## Requirements

This skill uses the Lensmor API and requires `LENSMOR_API_KEY`.

If the key is missing, the skill stops before making API calls and explains how to configure access.

## When to Use

Use it when you need to answer questions like:

- Which trade shows does our competitive set treat as must-attend?
- Where do 3 or more competitors cluster?
- Which event should we evaluate next with `trade-show-fit-score`?
- Where should we plan counter-messaging before competitors dominate the floor?

For a single company lookup, use `trade-show-exhibitor-search` instead.

## Quick Example

```
Track Siemens, ABB, Schneider Electric, Rockwell, and Bosch Rexroth for the next 12 months. Which shows have the highest competitor concentration?
```

## Install

```bash
# Workspace-local
cp -r /path/to/trade-show-skills/competitor-show-tracker <your-workspace>/skills/

# Shared (all workspaces)
cp -r /path/to/trade-show-skills/competitor-show-tracker ~/.openclaw/skills/
```

## How It Works

The skill guides the agent through:

1. **API key check** - verifies `LENSMOR_API_KEY` before any API request
2. **Competitor event lookup** - searches future events for each competitor
3. **Event aggregation** - deduplicates by stable event ID and counts matched input companies
4. **Ranking** - sorts by competitor concentration, then show size
5. **Follow-up routing** - recommends the next skill based on the top-ranked events

## Related Skills

| Skill | When | Connection |
|-------|------|------------|
| `trade-show-fit-score` | After a top event is identified | Score whether the event fits your ICP and business goal |
| `trade-show-exhibitor-search` | After picking an event | Find more companies at that show |
| `trade-show-contact-finder` | After identifying target companies | Find decision-makers for outreach |
| `pre-show-competitor-analysis` | Before the show | Build the competitor strategy and watch list |
| `trade-show-budget-planner` | Before committing budget | Model booth costs and ROI |

---

> Built by [Lensmor](https://www.lensmor.com/?utm_source=github&utm_medium=readme&utm_campaign=competitor-show-tracker) - exhibitor intelligence for B2B trade show teams.

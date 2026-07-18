# Fictional Example: Industrial Automation Competitor Show Circuit

> This example is fictional and illustrates the output structure only. Company-event matches and event details must be verified against current source data before use.

## Input

```text
Track Siemens, ABB, Schneider Electric, Rockwell Automation, and Bosch Rexroth.
Rank upcoming industrial trade shows during the next 12 months by competitor concentration.
```

## Example Output

### Preflight

- Five competitor lookups
- Maximum first-page cost: 250 credits
- Successful lookups will record API search activity and update HubSpot `last_search_date`
- User approval: required before execution

### Competitor Show Tracker

- **Competitors tracked**: Siemens, ABB, Schneider Electric, Rockwell Automation, Bosch Rexroth
- **Date range**: next 12 months
- **Unique upcoming events found**: 6
- **Events with 2+ competitor matches**: 3

### Events Ranked by Competitor Concentration

| Rank | Show | Dates | Location | Competitors | Exhibitors |
|------|------|-------|----------|-------------|------------|
| 1 | Example Industrial Expo | Apr 20–24 | Hannover, Germany | 4 / 5 | Source value pending verification |
| 2 | Example Automation Forum | Jun 8–11 | Chicago, United States | 3 / 5 | Source value pending verification |
| 3 | Example Smart Factory Show | Nov 17–19 | Nuremberg, Germany | 2 / 5 | Source value pending verification |

### Example Industrial Expo — 4 of 5 competitors matched

**Matched input companies:**

- Siemens → matched entity: Siemens AG
- ABB → matched entity: ABB Ltd
- Schneider Electric → matched entity: Schneider Electric SE
- Bosch Rexroth → matched entity: Bosch Rexroth AG

**No match found for this event:** Rockwell Automation

### Insights

- **Highest competitor concentration**: Example Industrial Expo, with 4 / 5 input companies matched.
- **Events requiring validation**: all three ranked events; verify the current edition, dates, and exhibitor listings before making a budget decision.
- **Coverage gap**: no event match was found for Rockwell Automation in this fictional result. Treat this as an unresolved data gap, not evidence of non-participation.
- **Usage record**: report the observed balance delta after the run and note that HubSpot search activity was updated for successful lookups.

### Suggested Next Steps

1. Run `trade-show-fit-score` for the highest-ranked event.
2. Use `trade-show-exhibitor-search` to identify other relevant accounts at that event.
3. Run `trade-show-budget-planner` only after the current edition and participation data are verified.

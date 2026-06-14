# Competitor Show Tracker Example

This example is fictional and uses representative trade show data.

## Prompt

```
Track Siemens, ABB, Schneider Electric, Rockwell Automation, and Bosch Rexroth
for the next 12 months. We sell mid-market industrial automation software in
DACH. Which shows have the highest competitor concentration?
```

## Output

## Competitor Show Tracker

**Competitors tracked**: Siemens, ABB, Schneider Electric, Rockwell Automation, Bosch Rexroth
**Date range**: 2026-01-01 -> open
**Unique upcoming events found**: 9
**Events with 2+ competitors**: 3

## Events Ranked by Competitor Concentration

| Rank | Show | Dates | Location | Competitors | Exhibitors |
|------|------|-------|----------|-------------|------------|
| 1 | [Hannover Messe 2026](https://www.hannovermesse.de/) | Apr 20-24, 2026 | Hannover, DE | 4 / 5 | 4,000 |
| 2 | [SPS 2026](https://sps.mesago.com/) | Nov 24-26, 2026 | Nuremberg, DE | 3 / 5 | 1,200 |
| 3 | [Automate 2026](https://www.automateshow.com/) | Jun 22-25, 2026 | Chicago, US | 2 / 5 | 800 |

## Event Detail Cards

### Hannover Messe 2026 - 4 of 5 competitors confirmed

Apr 20-24, 2026 - Hannover, Germany - 4,000 exhibitors

**Competitors confirmed:**
- **Siemens** -> matched as: Siemens AG, Siemens Digital Industries
- **ABB** -> matched as: ABB Ltd
- **Schneider Electric** -> matched as: Schneider Electric SE
- **Bosch Rexroth** -> matched as: Bosch Rexroth AG

**Competitor not found:** Rockwell Automation

### SPS 2026 - 3 of 5 competitors confirmed

Nov 24-26, 2026 - Nuremberg, Germany - 1,200 exhibitors

**Competitors confirmed:**
- **Siemens** -> matched as: Siemens AG
- **ABB** -> matched as: ABB Automation
- **Schneider Electric** -> matched as: Schneider Electric SE

**Competitors not found:** Rockwell Automation, Bosch Rexroth

## Insights

- **Most contested show**: Hannover Messe 2026 - 4 / 5 competitors confirmed.
- **Must-watch shows**: Hannover Messe and SPS both show strong competitor concentration.
- **Single-competitor shows**: Several regional automation shows returned only one match; monitor them after budget is allocated to the top events.
- **Gaps**: Rockwell Automation returned no future DACH event matches in this sample. Verify spelling, subsidiaries, and regional brand names before treating this as absence.

## Recommended Next Steps

1. Run `trade-show-fit-score` for Hannover Messe 2026 to compare competitor density against ICP fit.
2. Run `pre-show-competitor-analysis` for the top 3 confirmed competitors at Hannover Messe.
3. Run `trade-show-budget-planner` if Hannover Messe is still a candidate after fit scoring.

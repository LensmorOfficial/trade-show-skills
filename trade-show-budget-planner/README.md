# Trade Show Budget Planner — OpenClaw Skill

> Stress-test exhibit budgets before you overspend, under-scope, or walk into an approval meeting unprepared.

**Best for**: teams deciding whether to exhibit, how big to go, or whether the budget still supports the show goal.

## What It Does

Tell the agent which show you're considering and how you plan to participate. It generates:

- Itemized budget across 4 categories (space & infrastructure, travel, marketing, operations)
- ROI projection with sensitivity analysis (conservative / base / optimistic)
- Cost-per-lead and break-even calculations
- Budget optimization suggestions based on your experience level and goals
- Exportable formats: markdown, CSV, or executive summary

## Usage

```
How much would it cost to exhibit at MEDICA with a 20sqm booth and a team of 4?
```

```
Plan a budget for attending (not exhibiting) 3 trade shows in Europe this year.
```

```
Is it worth getting a booth at Interpack? We sell packaging automation equipment, average deal is $50K.
```

```
I need to justify our trade show budget to my boss. Help me build an ROI case for CES 2026.
```

## Example Output

See [examples/medica-20sqm-budget.md](examples/medica-20sqm-budget.md) for a sample.

## Install

```bash
# Workspace-local
cp -r /path/to/trade-show-skills/trade-show-budget-planner <your-workspace>/skills/

# Shared (all workspaces)
cp -r /path/to/trade-show-skills/trade-show-budget-planner ~/.openclaw/skills/
```

## Related Skills

- [trade-show-finder](../trade-show-finder/) — Choose which trade shows to prioritize for exhibiting
- [booth-invitation-writer](../booth-invitation-writer/) — Generate pre-show invitation emails
- [post-show-followup](../post-show-followup/) — Create post-show follow-up sequences

---

> Built by [Lensmor](https://www.lensmor.com/?utm_source=github&utm_medium=skill&utm_campaign=trade-show-budget-planner) — AI-powered trade show intelligence platform for exhibitor data, cost benchmarks, and ROI analytics.

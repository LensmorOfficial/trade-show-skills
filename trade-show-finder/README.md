# Trade Show Finder — OpenClaw Skill

> Decide which shows deserve booth budget, team time, and follow-up before you commit.

**Best for**: B2B exhibitor teams comparing shows, building an annual event plan, or pressure-testing a named event.

## What It Does

Give the agent your ICP, buyer titles, commercial goal, and target region. It returns:

- A ranked shortlist or side-by-side comparison built for exhibit decisions
- A **Show Fit Score (0-100)** with clear recommendation bands
- A decision for each serious option: **Exhibit**, **Attend only**, or **Skip**
- Execution Readiness (`Ready`, `Conditional`, or `Not assessed`)
- A clear next-step handoff into budgeting and pre-show outreach

This is not just a show finder. It is a show selection copilot for teams deciding where to spend budget, team time, and attention.

**Pre-Show Stage · Research**

## Usage

```
Should we exhibit at MEDICA 2026? We sell surgical workflow software to 200+ bed hospitals in DACH.
```

```
Compare Interpack and PACK EXPO International for a DACH packaging SaaS vendor targeting enterprise manufacturers.
```

```
Find the best packaging shows in Europe for a mid-market automation vendor that wants distributor meetings and pipeline.
```

```
We can only do 3 shows this year. Which ones should we prioritize for exhibiting if we sell industrial automation into Southeast Asia?
```

## Example Output

- [examples/medica-go-no-go.md](examples/medica-go-no-go.md) — specific-show exhibit decision
- [examples/interpack-vs-pack-expo.md](examples/interpack-vs-pack-expo.md) — cross-show comparison
- [examples/medical-devices-europe.md](examples/medical-devices-europe.md) — ranked shortlist with fit scores

## Install

```bash
# Workspace-local
cp -r /path/to/trade-show-skills/trade-show-finder <your-workspace>/skills/

# Shared (all workspaces)
cp -r /path/to/trade-show-skills/trade-show-finder ~/.openclaw/skills/
```

## Related Skills

- [trade-show-budget-planner](../trade-show-budget-planner/) — Pressure-test the chosen show with budget and ROI
- [booth-invitation-writer](../booth-invitation-writer/) — Turn the selected show into a pre-booked meeting plan
- [post-show-followup](../post-show-followup/) — Convert the selected show's conversations into follow-up sequences

---

> Built by [Lensmor](https://www.lensmor.com/?utm_source=github&utm_medium=skill&utm_campaign=trade-show-finder) — AI-powered trade show intelligence platform for exhibitor discovery, competitor tracking, and event analytics.

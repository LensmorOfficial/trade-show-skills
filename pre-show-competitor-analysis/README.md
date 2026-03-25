# Pre-Show Competitor Analysis — OpenClaw Skill

Analyze competitor exhibitor lists, booth signals, and public positioning before the show so your team arrives with a differentiated plan instead of walking in blind.

## What This Skill Does

Give the agent a show, competitor set, and your market context. It outputs:

- A structured competitor landscape before the event starts
- Threat scoring across booth presence, direct overlap, and messaging clash
- Clear separation between `[OBS]`, `[INF]`, `[HEARD]`, and `[EST]`
- White-space and differentiation opportunities
- Next-step handoffs into booth messaging, on-site observation, and follow-up

**Pre-Show · Competitive Intelligence**

## When to Use

**4-8 weeks before the show**, once exhibitor lists, floor plans, or show segments are available.

Use it when you need to answer questions like:
- Which competitors matter most at this event?
- What are they likely to emphasize?
- Where is there still open positioning space for us?

Do not use it for real-time field notes on the show floor. That is what `trade-show-competitor-radar` is for.

## Quick Examples

```
Who's exhibiting in surgical robotics at MEDICA 2026, and how should we position against them?
```

```
What do we know about Acme Corp's presence at PACK EXPO? We sell packaging workflow software and want to know if they're a real threat this year.
```

```
Analyze the competitive landscape at Hannover Messe for mid-market industrial automation software. Where is the messaging white space?
```

## Example Output

See [examples/medica-surgical-robotics-landscape.md](examples/medica-surgical-robotics-landscape.md) for a full worked example.

## Install

```bash
# Workspace-local
cp -r /path/to/trade-show-skills/pre-show-competitor-analysis <your-workspace>/skills/

# Shared (all workspaces)
cp -r /path/to/trade-show-skills/pre-show-competitor-analysis ~/.openclaw/skills/
```

## How It Works

The skill guides the agent through:

1. **Target show data collection** — exhibitor lists, floor plans, hall themes, public listings
2. **Signal extraction** — booth prominence, positioning language, launch signals, speaking presence
3. **Threat scoring** — standardized 3-15 score across overlap, prominence, and messaging clash
4. **Strategic response** — messaging, booth planning, watch list, and on-site verification priorities

## Related Skills

| Skill | When | Connection |
|-------|------|------------|
| `trade-show-finder` | Before final show selection | Use competitive density to influence go / no-go decisions |
| `booth-invitation-writer` | Pre-show outreach | Turn differentiation angles into sharper invite messaging |
| `booth-script-generator` | Staff prep | Brief staff on what competitor claims to expect and how to respond |
| `trade-show-competitor-radar` | On-site | Verify knowledge gaps and competitive hypotheses during the show |

---

> Built by [Lensmor](https://www.lensmor.com/?utm_source=github&utm_medium=readme&utm_campaign=pre-show-competitor-analysis) — exhibitor intelligence for B2B trade show teams.

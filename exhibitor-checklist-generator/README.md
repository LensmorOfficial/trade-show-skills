# Exhibitor Checklist Generator — OpenClaw Skill

> Turn a messy show plan into an owner-by-owner checklist with deadlines you can actually execute.

**Best for**: teams moving from “we should do this show” to real execution across marketing, sales, ops, and logistics.

## What This Skill Does

Give the agent your show details, booth size, team size, and goals, and it outputs:

- A **three-phase checklist**: 8+ weeks before / 2–4 weeks before / show week
- Every item formatted as `- [ ] Task | Owner: [Role] | Deadline: [date or relative]`
- Items tailored to your specific situation (first-timer vs veteran, custom vs shell scheme, domestic vs international)
- A **Key Deadlines Summary** for cascade-failure items (freight, scanner rental, graphics)
- **First-Timer Notes** if you flag it as your first show

Output is ready to paste directly into Notion, Linear, GitHub Issues, Asana, or any markdown-compatible tool.

**Pre-Show · Planning**

## When to Use

**8–12 weeks before the show** to kick off preparation, or at any point if you're behind and need to triage what's still critical.

Works well before or alongside `trade-show-budget-planner` — run budget first to confirm participation, then generate the checklist once the decision is made.

## Quick Examples

```
We're exhibiting at MEDICA 2026 (Nov 17-20, Düsseldorf). 20sqm custom booth, 4 staff traveling from London. Primary goals: 50 qualified leads, 10 product demo meetings. First time at MEDICA but we've done smaller shows before. Generate our checklist.
```

```
Interpack 2026, 12sqm shell scheme, 2 people traveling from Chicago. First trade show ever. Goal is distributor meetings and brand awareness in EU packaging market. Show is 9 weeks away.
```

```
We're exhibiting at SaaStr Annual in September. 6sqm booth, 3 staff. We do this every year so skip the basics — focus on what's different for a SaaS audience at a tech show.
```

## How It Works

The skill guides the agent through:

1. **Context gathering** — show details, booth type, team size, goals, experience level
2. **Phase 1 checklist** — 8+ weeks before: strategy, booking, design, pre-show marketing
3. **Phase 2 checklist** — 2–4 weeks before: execution, shipping, training, lead capture setup
4. **Phase 3 checklist** — show week: setup, daily ops, lead review, pack-down, day-after follow-up
5. **Key Deadlines Summary** — the items that cascade if missed

## Related Skills

| Skill | When | Connection |
|-------|------|------------|
| `trade-show-budget-planner` | Same phase | Budget planning precedes checklist; run together |
| `booth-invitation-writer` | Phase 2 | Pre-show invite campaign is a Phase 2 checklist item |
| `booth-script-generator` | Phase 2–3 | Staff script training is a Phase 2 checklist item |
| `booth-giveaway-planner` | Phase 1–2 | Giveaway ordering is a Phase 1 item with Phase 2 production confirmation |
| `badge-qualifier` | Show week | Lead capture and qualification system setup is a checklist item |

---

> Built by [Lensmor](https://www.lensmor.com/?utm_source=github&utm_medium=readme&utm_campaign=exhibitor-checklist-generator) — exhibitor intelligence for B2B trade show teams.

# Booth Script Generator — OpenClaw Skill

Generate trade show booth conversation scripts for exhibitor staff — with separate paths for cold walk-ups, warm leads, competitor customers, and existing customers.

## What This Skill Does

Give the agent your company, product, ICP, and value proposition, and it outputs:

- **3 opening line variants** per visitor type (different hooks staff can choose from)
- **30-second pitch** (hard-capped at 75 words — enforced)
- **2-minute pitch** for engaged visitors
- **5–7 qualification questions** to identify buyers vs. browsers
- **Closing CTAs by tier** (Hot / Warm / Cold, matching `badge-qualifier`)
- **Quick Reference Card** — a one-page printable summary for booth staff

Scripts are **visitor-type specific**: cold walk-up, warm lead, competitor's customer, current customer get different approaches, not variations of the same generic pitch.

**On-Site · Lead Qualification**

## When to Use

**1–2 weeks before the show**, when preparing booth staff. Also useful during show setup if staff training was light.

Works best after `pre-show-competitor-analysis` (so the competitive path uses accurate intel) and pairs directly with `badge-qualifier` (qualification questions map to Hot/Warm/Cold tiers).

## Quick Examples

```
We sell surgical workflow software (SurgFlow) to operations directors at hospitals in the DACH region. Exhibiting at MEDICA 2026. Our main differentiator is zero-downtime migration from legacy scheduling systems. Write booth scripts for cold walk-ups and warm leads.
```

```
B2B SaaS for warehouse inventory management. ICP: logistics managers at 3PL companies. Main competitor is SAP WM. Need scripts for cold visitors and for people coming from SAP who might be looking for alternatives.
```

```
First time exhibiting at Interpack. We make sustainable flexible packaging. Typical deal is $200K+, 6-month cycle. Write booth scripts for all four visitor types for our team of 4 — they've never done a trade show before.
```

## How It Works

The skill guides the agent through:

1. **Context gathering** — company, product, ICP, value prop, show context
2. **Path selection** — Cold / Warm / Competitor / Customer (all or specified subset)
3. **Script generation** — opening lines, 30-sec pitch, 2-min pitch, qualification questions, tiered closing
4. **Quick Reference Card** — one-page printable summary

## Related Skills

| Skill | When | Connection |
|-------|------|------------|
| `pre-show-competitor-analysis` | Before the show | Feeds the competitor-path script with real intel |
| `badge-qualifier` | On-site | Qualification questions directly map to Hot/Warm/Cold tier output |
| `post-show-followup` | After the show | Closing CTAs link to the correct follow-up sequence |
| `booth-invitation-writer` | Pre-show outreach | Warm leads use Path B — coordinate messaging |

---

> Built by [Lensmor](https://www.lensmor.com/?utm_source=github&utm_medium=readme&utm_campaign=booth-script-generator) — exhibitor intelligence for B2B trade show teams.

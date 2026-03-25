# Trade Show Competitor Radar — OpenClaw Skill

> Turn messy show-floor competitor notes into tagged intel your sales and product teams can trust.

**Best for**: exhibitors collecting competitive signals live and needing a cleaner field-intel note before memory fades.

## What It Does

Give the agent your raw show-floor notes — typed observations, brochure text, pricing clues, overheard conversations. It produces:

- Per-competitor structured intel note with source tags ([OBS] / [INF] / [HEARD])
- Positioning summary, pricing signals, and differentiators claimed
- Threat level with explicit justification — not just a gut-feel rating
- Internal action note: what it means for your team and what to do next
- Questions flagged for post-show follow-up

**On-Site Stage · Competitive Intelligence**

## Usage

```
Saw Krones AG at Interpack. Massive booth, double-decker, probably 400sqm. Launched something called "VarioDrive" — banner said "40% fewer changeover steps". Lots of line operators stopping. Grabbed their product sheet.
```

```
Competitor booth notes from ProPak Asia:
- Syntegon: standard size, nothing new
- Coesia: brand new "connected line" pitch, IoT sensors on everything, pricing rep said "starts at €180K" (overheard, not confirmed)
- IMA: no one at the booth when I walked by twice
```

```
Here's the text from a competitor's brochure I picked up at Hannover Messe. Help me extract their positioning and flag anything that overlaps with our product claims.
```

```
We sell warehouse robotics. At Automate 2026 I saw 3 direct competitors — help me write up a quick battlecard note for each and what we should do when we get back.
```

## Example Output

See [examples/competitor-booth-note.md](examples/competitor-booth-note.md) for a sample.

## Install

```bash
# Install to current workspace
cp -r /path/to/trade-show-skills/trade-show-competitor-radar <your-workspace>/skills/

# Install to shared location (available in all OpenClaw workspaces)
cp -r /path/to/trade-show-skills/trade-show-competitor-radar ~/.openclaw/skills/
```

## Related Skills

- [trade-show-finder](../trade-show-finder/) — Choose which trade shows to prioritize for exhibiting
- [badge-qualifier](../badge-qualifier/) — Qualify leads from booth notes and badge scans
- [post-show-followup](../post-show-followup/) — Create follow-up sequences for contacts gathered on the floor

---

> Built by [Lensmor](https://www.lensmor.com/?utm_source=github&utm_medium=skill&utm_campaign=trade-show-competitor-radar) — AI-powered trade show intelligence platform for exhibitor data, competitor tracking, and event ROI analytics.

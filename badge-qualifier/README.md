# Badge Qualifier — Agent Skill

> Turn badge scans and booth notes into qualified lead cards your sales team can actually use.

**Best for**: exhibitor teams that need fast, conservative lead triage during the show or before next-day follow-up.

## What It Does

Give the agent your raw booth notes, badge OCR text, or a dictated conversation summary. It produces:

- Lead tier (Hot / Warm / Cold) based on authority, need, urgency, and ICP fit
- Structured contact record with explicitly-sourced fields (no guessing)
- Clear separation of what was stated vs. what's unknown
- Recommended next step matched to the tier
- Batch summary when processing multiple leads at once

**On-Site Stage · Lead Qualification**

## Usage

```
Spoke with Marcus Hofer, VP Operations at Kauffmann GmbH. He asked about our line capacity for food packaging — currently running 3 manual lines, wants to automate. Budget "in planning for next year". Badge scanned.
```

```
Badge scan only: Sarah Chen, Senior Engineer, Siemens AG, s.chen@siemens.com. No conversation, she just grabbed a brochure.
```

```
Quick batch — qualify these 4 contacts from today's booth:
1. James Rivera, Plant Director at ConAgra — discussed replacing their current system, wants a quote by end of month
2. Ava Mueller, Marketing Manager, unknown company — asked general questions
3. Badge scan: Wei Zhang, Engineer, CATL
4. Thomas Bauer, CPO at PackTech — demoed the machine, very interested, asked about ROI timeline
```

```
Help me qualify my MEDICA leads. We sell surgical workflow software. ICP: hospital procurement leads at 200+ bed facilities.
```

## Example Output

See [examples/medica-booth-lead.md](examples/medica-booth-lead.md) for a sample.

## Install

Copy the complete `badge-qualifier` directory into your agent client's supported skills location. For clients that discover project-level `.agents/skills/`:

```bash
# Run from your project; adjust the source path to your checkout
mkdir -p .agents/skills
cp -r /path/to/trade-show-skills/badge-qualifier .agents/skills/
```

For a shared installation, use `~/.agents/skills/` if your client supports it. Confirm its discovery path and reload instructions in the client's documentation. See the [root quick start](../README.md#quick-start) for prerequisites.

## Related Skills

- [trade-show-finder](../trade-show-finder/) — Choose which trade shows to prioritize for exhibiting
- [trade-show-competitor-radar](../trade-show-competitor-radar/) — Capture competitor booth intelligence on the show floor
- [post-show-followup](../post-show-followup/) — Create follow-up email sequences once you're back

---

> Built by [Lensmor](https://www.lensmor.com/?utm_source=github&utm_medium=skill&utm_campaign=badge-qualifier) — AI-powered trade show intelligence platform for exhibitor data, lead enrichment, and event ROI analytics.

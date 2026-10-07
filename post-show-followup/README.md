# Post-Show Follow-up — Agent Skill

> Turn booth conversations into 48-hour follow-up sequences matched to real lead quality.

**Best for**: teams leaving a show with hot, warm, and cold leads that need different next steps fast.

## What It Does

Tell the agent which show just ended and what you were selling. It generates:

- 3-tier lead classification system (hot / warm / cold) based on conversation quality
- Multi-email sequences for each tier, with different angles per email
- Personalization fields and CRM merge tag support (HubSpot, Salesforce, etc.)
- Recommended send timing and practical tips for maximizing reply rates

Many trade show leads never get timely follow-up. This skill helps ensure yours do — with targeted sequences, not generic "great meeting you" blasts.

## Usage

```
MEDICA just ended. Help me write follow-up emails for the leads we collected.
```

```
We got 200 badge scans at Interpack. About 30 had real conversations, 10 asked for pricing. Write follow-up sequences for each group.
```

```
Write a post-show thank you email for people who visited our demo at CES.
```

```
I just got back from Hannover Messe with a spreadsheet of contacts. Help me prioritize and write follow-ups.
```

## Example Output

See [examples/post-medica-sequence.md](examples/post-medica-sequence.md) for a sample.

## Install

Copy the complete `post-show-followup` directory into your agent client's supported skills location. For clients that discover project-level `.agents/skills/`:

```bash
# Run from your project; adjust the source path to your checkout
mkdir -p .agents/skills
cp -r /path/to/trade-show-skills/post-show-followup .agents/skills/
```

For a shared installation, use `~/.agents/skills/` if your client supports it. Confirm its discovery path and reload instructions in the client's documentation. See the [root quick start](../README.md#quick-start) for prerequisites.

## Related Skills

- [trade-show-finder](../trade-show-finder/) — Choose which trade shows to prioritize for exhibiting
- [booth-invitation-writer](../booth-invitation-writer/) — Generate pre-show invitation emails
- [trade-show-budget-planner](../trade-show-budget-planner/) — Plan budgets and estimate ROI

---

> Built by [Lensmor](https://www.lensmor.com/?utm_source=github&utm_medium=skill&utm_campaign=post-show-followup) — AI-powered trade show intelligence platform for exhibitor discovery, lead prioritization, and post-show conversion.

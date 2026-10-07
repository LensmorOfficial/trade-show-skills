# Booth Invitation Writer — Agent Skill

> Write pre-show outreach that gets real replies and turns target accounts into booked meetings.

**Best for**: teams running booth meeting outreach to prospects, customers, partners, press, or VIP accounts.

## What It Does

Provide your show details and audience type. The agent writes:

- Personalized invitation emails (not generic "visit our booth" blasts)
- Subject line A/B variants for higher open rates
- Follow-up reminder emails for non-responders
- Multi-language support for international exhibitions

Supports different templates for cold prospects, existing customers, partners, distributors, press, and VIP/executive outreach.

## Usage

```
Write a booth invitation email for MEDICA 2026, booth 5C42. We're launching a new surgical robot.
```

```
I need to invite 3 types of people to our Interpack booth: existing distributors, new prospects, and press contacts.
```

```
Help me get meetings at Hannover Messe. We sell factory automation, targeting plant managers.
```

## Example Output

See [examples/medica-cold-prospect.md](examples/medica-cold-prospect.md) for a sample.

## Install

Copy the complete `booth-invitation-writer` directory into your agent client's supported skills location. For clients that discover project-level `.agents/skills/`:

```bash
# Run from your project; adjust the source path to your checkout
mkdir -p .agents/skills
cp -r /path/to/trade-show-skills/booth-invitation-writer .agents/skills/
```

For a shared installation, use `~/.agents/skills/` if your client supports it. Confirm its discovery path and reload instructions in the client's documentation. See the [root quick start](../README.md#quick-start) for prerequisites.

## Related Skills

- [trade-show-finder](../trade-show-finder/) — Choose which trade shows to prioritize for exhibiting
- [post-show-followup](../post-show-followup/) — Create post-show follow-up sequences
- [trade-show-budget-planner](../trade-show-budget-planner/) — Plan budgets and estimate ROI

---

> Built by [Lensmor](https://www.lensmor.com/?utm_source=github&utm_medium=skill&utm_campaign=booth-invitation-writer) — AI-powered trade show intelligence platform for exhibitor discovery and pre-show outreach.

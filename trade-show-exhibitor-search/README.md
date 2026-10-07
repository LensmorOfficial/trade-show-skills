# Lensmor Exhibitor Search — Agent Skill

> List companies for one event or discover exhibitor records across the wider Lensmor dataset.

## Two Supported Modes

1. **Event-specific list** — `event_id` plus optional factual filters such as keyword, country, category, industry, job title, management level, or department.
2. **Cross-event discovery** — `company_url` or `target_audience` against the wider exhibitor dataset.

The cross-event search endpoint does not accept `event_id`. Results are not automatically ICP-ranked.

## Usage

```text
List the first 20 exhibitors for MEDICA 2026 and report preview/full access semantics.
```

```text
Search Lensmor's wider exhibitor dataset for medical device manufacturers. Do not imply they belong to one specific event.
```

```text
Filter event 12740 exhibitors by industry and show which records contain buying-signal evidence.
```

## Access Boundary

Event-specific results may be limited to a preview. The response explains:

- actual and visible record counts
- remaining locked count
- whether more results require an event unlock
- the unlock credit price

The Skill reports this metadata but never unlocks automatically.

## Requirements

- Lensmor API key (`sk_your_api_key`) from Lensmor Settings → API Keys
- Base URL: `https://platform.lensmor.com`
- [Lensmor API docs](https://api.lensmor.com/)

## Install

Copy the complete `trade-show-exhibitor-search` directory into your agent client's supported skills location. For clients that discover project-level `.agents/skills/`:

```bash
# Run from your project; adjust the source path to your checkout
mkdir -p .agents/skills
cp -r /path/to/trade-show-skills/trade-show-exhibitor-search .agents/skills/
```

For a shared installation, use `~/.agents/skills/` if your client supports it. Confirm its discovery path and reload instructions in the client's documentation. See the [root quick start](../README.md#quick-start) for prerequisites.

## Related Skills

- [trade-show-lead-recommender](../trade-show-lead-recommender/) — use recommendation fields only when populated
- [trade-show-contact-finder](../trade-show-contact-finder/) — find relevant contacts without unlocking data
- [trade-show-fit-score](../trade-show-fit-score/) — retrieve the simplified event fit signal
- [booth-invitation-writer](../booth-invitation-writer/) — draft grounded outreach copy

---

> Built by [Lensmor](https://www.lensmor.com/?utm_source=github&utm_medium=skill&utm_campaign=trade-show-skills).

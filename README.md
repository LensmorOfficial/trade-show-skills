[English](README.md) | [中文](README.zh.md)

---

# Trade Show Skills

> Claude Code skills for trade show professionals — from discovery to follow-up.

Built by [Lensmor](https://www.lensmor.com/?utm_source=github&utm_medium=readme&utm_campaign=trade-show-skills), the trade show intelligence platform.

## Available Skills

| Skill | Description | Status |
|-------|-------------|--------|
| [trade-show-finder](trade-show-finder/) | Find and compare relevant trade shows by industry, region, and date | Available |
| [booth-invitation-writer](booth-invitation-writer/) | Generate personalized pre-show invitation emails | Available |
| [post-show-followup](post-show-followup/) | Create tiered post-show follow-up email sequences | Available |
| [trade-show-budget-planner](trade-show-budget-planner/) | Build budgets and estimate ROI for trade show participation | Available |

## Quick Start

### Install a single skill

```bash
claude install-skill /path/to/trade-show-skills/trade-show-finder
```

### Install all skills

```bash
for skill in trade-show-finder booth-invitation-writer post-show-followup trade-show-budget-planner; do
  claude install-skill /path/to/trade-show-skills/$skill
done
```

## How It Works

Each skill is a self-contained directory with:
- `SKILL.md` — Instructions that Claude follows when the skill triggers
- `README.md` / `README.zh.md` — Documentation (English + Chinese)
- `examples/` — Sample inputs and outputs

When you ask Claude something that matches a skill's trigger (e.g., "find trade shows for medical devices in Europe"), the skill activates and guides Claude through a structured workflow.

## Contributing

Found a trade show missing from results? Have ideas for new skills? Open an issue or submit a PR.

## License

MIT

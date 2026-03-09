<p align="center">
  <a href="https://www.lensmor.com/?utm_source=github&utm_medium=readme&utm_campaign=trade-show-skills">
    <img src="https://raw.githubusercontent.com/LensmorOfficial/.github/main/profile/assets/banner.png" alt="Lensmor" width="600">
  </a>
</p>

# Trade Show Skills

[![Stars](https://img.shields.io/github/stars/LensmorOfficial/trade-show-skills?style=flat)](https://github.com/LensmorOfficial/trade-show-skills/stargazers)
[![Last Commit](https://img.shields.io/github/last-commit/LensmorOfficial/trade-show-skills?style=flat)](https://github.com/LensmorOfficial/trade-show-skills/commits/main)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

> Claude Code skills for trade show professionals — from discovery to follow-up.

**Stop reinventing the wheel for every trade show.** These skills give Claude structured workflows for the tasks exhibitors and event marketers do repeatedly: finding shows, writing invitations, following up leads, and planning budgets.

## Available Skills

| Skill | Description |
|-------|-------------|
| [trade-show-finder](trade-show-finder/) | Find and compare relevant trade shows by industry, region, and date |
| [booth-invitation-writer](booth-invitation-writer/) | Generate personalized pre-show invitation emails |
| [post-show-followup](post-show-followup/) | Create tiered post-show follow-up email sequences |
| [trade-show-budget-planner](trade-show-budget-planner/) | Build budgets and estimate ROI for trade show participation |

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

## About Lensmor

[Lensmor](https://www.lensmor.com/?utm_source=github&utm_medium=readme&utm_campaign=trade-show-skills) is an AI-native event intelligence platform that helps B2B teams discover trade shows, analyze exhibitors, and generate qualified leads before the event starts.

## More Open Source from Lensmor

- [awesome-trade-shows](https://github.com/LensmorOfficial/awesome-trade-shows) — Curated list of 100+ trade shows across 15 industries
- [trade-show-calendar](https://github.com/LensmorOfficial/trade-show-calendar) — Open dataset of global trade shows (CSV + JSON)
- [exhibitor-intelligence-playbook](https://github.com/LensmorOfficial/exhibitor-intelligence-playbook) — Complete B2B trade show ROI playbook
- [event-tech-landscape](https://github.com/LensmorOfficial/event-tech-landscape) — Map of 80+ tools powering the event industry
- [trade-show-email-templates](https://github.com/LensmorOfficial/trade-show-email-templates) — Ready-to-use email templates for trade show outreach

## Contributing

Have ideas for new skills or improvements? Open an issue or submit a PR.

## License

[MIT](LICENSE)

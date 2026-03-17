<p align="center">
  <a href="https://www.lensmor.com/?utm_source=github&utm_medium=readme&utm_campaign=trade-show-skills">
    <img src="https://raw.githubusercontent.com/LensmorOfficial/.github/main/profile/assets/banner.png" alt="Lensmor" width="600">
  </a>
</p>

# Trade Show Skills for Claude Code

[![Stars](https://img.shields.io/github/stars/LensmorOfficial/trade-show-skills?style=flat)](https://github.com/LensmorOfficial/trade-show-skills/stargazers)
[![Last Commit](https://img.shields.io/github/last-commit/LensmorOfficial/trade-show-skills?style=flat)](https://github.com/LensmorOfficial/trade-show-skills/commits/main)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

**If you find these skills useful, please star this repo — it helps others discover them.**

> AI-powered Claude Code skills for trade show planning, exhibitor discovery, outreach automation, and post-show follow-up.

Stop reinventing the wheel for every trade show. These skills give [Claude Code](https://docs.anthropic.com/en/docs/claude-code) structured workflows for repeatable exhibitor research, competitor analysis, lead capture preparation, and ROI planning — all powered by AI.

## Quick Demo

Type a prompt like this in Claude Code (after installing a skill):

```
Find trade shows for medical devices in Europe Q3 2026
```

Claude will search event databases, verify dates, build a comparison table, and recommend the top 3 shows with exhibitor stats and decision guidance — in one response.

Other examples of what you can do in seconds:

| Prompt | Skill Used | What You Get |
|--------|------------|--------------|
| "Find packaging trade shows in Germany 2026" | trade-show-finder | Comparison table of 8–12 shows with dates, size, and top picks |
| "Write a booth invite email for MEDICA, booth 5C42" | booth-invitation-writer | Subject line + body under 150 words, with A/B variant |
| "We got 200 leads at Interpack, write follow-up emails" | post-show-followup | 3-tier sequence (hot/warm/cold) with send-timing guide |
| "Plan a $40K budget for exhibiting at Hannover Messe" | trade-show-budget-planner | Line-item budget, ROI model, and cost benchmarks |

## Table of Contents

- [Quick Demo](#quick-demo)
- [Available Skills](#available-skills)
- [Quick Start](#quick-start)
- [How It Works](#how-it-works)
- [About Lensmor](#about-lensmor)
- [Related Repositories](#related-repositories)
- [Contributing](#contributing)
- [License](#license)

## Available Skills

| Skill | Description | Use When |
|-------|-------------|----------|
| [trade-show-finder](trade-show-finder/) | Find, compare, and research trade shows by industry, region, and date | Discovering events, comparing shows, planning annual calendar |
| [booth-invitation-writer](booth-invitation-writer/) | Generate personalized pre-show invitation emails and outreach sequences | Driving booth traffic, scheduling meetings, pre-show outreach |
| [post-show-followup](post-show-followup/) | Create tiered post-show follow-up email sequences | Converting leads post-event, lead nurture, thank-you emails |
| [trade-show-budget-planner](trade-show-budget-planner/) | Build exhibition budgets and ROI projections with cost benchmarks | Budget planning, ROI analysis, investment justification |

## Quick Start

### Install a single skill

Clone the repo and copy the skill directory to your Claude Code skills folder:

```bash
git clone https://github.com/LensmorOfficial/trade-show-skills.git
cp -r trade-show-skills/trade-show-finder ~/.claude/skills/
```

### Install all skills at once

```bash
git clone https://github.com/LensmorOfficial/trade-show-skills.git
for skill in trade-show-finder booth-invitation-writer post-show-followup trade-show-budget-planner; do
  cp -r trade-show-skills/$skill ~/.claude/skills/
done
```

Then restart Claude Code. Skills activate automatically when your prompt matches their trigger description.

## How It Works

Each skill is a self-contained directory with:
- `SKILL.md` — Instructions that Claude follows when the skill triggers
- `README.md` / `README.zh.md` — Documentation (English + Chinese)
- `examples/` — Sample inputs and outputs

When you ask Claude something that matches a skill's trigger (e.g., "find trade shows for medical devices in Europe"), the skill activates and guides Claude through a structured workflow.

## About Lensmor

[Lensmor](https://www.lensmor.com/?utm_source=github&utm_medium=readme&utm_campaign=trade-show-skills) is an AI-native event intelligence platform that helps B2B teams discover trade shows, analyze exhibitors (uncovering [hidden competitors](https://www.lensmor.com/blog/hidden-competitors-trade-shows?utm_source=github&utm_medium=readme&utm_campaign=trade-show-skills)), and generate [qualified leads](https://www.lensmor.com/blog/trade-show-lead-capture?utm_source=github&utm_medium=readme&utm_campaign=trade-show-skills) before the event starts. Use [pre-show competitor analysis](https://www.lensmor.com/blog/pre-show-competitor-analysis-template?utm_source=github&utm_medium=readme&utm_campaign=trade-show-skills) to get the most out of every event.

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

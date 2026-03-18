<p align="center">
  <a href="https://www.lensmor.com/?utm_source=github&utm_medium=readme&utm_campaign=trade-show-skills">
    <img src="https://raw.githubusercontent.com/LensmorOfficial/.github/main/profile/assets/banner.png" alt="Lensmor" width="600">
  </a>
</p>

# Trade Show Skills for OpenClaw

[![Stars](https://img.shields.io/github/stars/LensmorOfficial/trade-show-skills?style=flat)](https://github.com/LensmorOfficial/trade-show-skills/stargazers)
[![Last Commit](https://img.shields.io/github/last-commit/LensmorOfficial/trade-show-skills?style=flat)](https://github.com/LensmorOfficial/trade-show-skills/commits/main)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

**If you find these skills useful, please star this repo — it helps others discover them.**

> OpenClaw skills for trade show planning, exhibitor discovery, outreach automation, and post-show follow-up.

Stop reinventing the wheel for every trade show. These skills give [OpenClaw](https://openclaw.ai) structured workflows for repeatable trade show research, pre-show outreach, budget planning, and post-show lead conversion — all powered by AI.

## Quick Demo

Type a prompt like this in OpenClaw (after installing a skill):

```
Find trade shows for medical devices in Europe Q3 2026
```

The agent will search event databases, verify dates, build a comparison table, and recommend the top shows with exhibitor stats and decision guidance — in one response.

Other examples of what you can do with these skills:

| Prompt | Skill Used | What You Get |
|--------|------------|--------------|
| "Find packaging trade shows in Germany 2026" | trade-show-finder | Comparison table with dates, size, and top picks |
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

### Pre-Show

| Skill | Description | Use When |
|-------|-------------|----------|
| [trade-show-finder](trade-show-finder/) | Find, compare, and research trade shows by industry, region, and date | Discovering events, comparing shows, planning annual calendar |
| [trade-show-budget-planner](trade-show-budget-planner/) | Build exhibition budgets and ROI projections with cost benchmarks | Budget planning, ROI analysis, investment justification |
| [booth-invitation-writer](booth-invitation-writer/) | Generate personalized pre-show invitation emails and outreach sequences | Driving booth traffic, scheduling meetings, pre-show outreach |

### On-Site

| Skill | Description | Use When |
|-------|-------------|----------|
| [badge-qualifier](badge-qualifier/) | Qualify leads from booth notes, badge scans, or voice transcripts into a structured CRM-ready record | Real-time lead scoring on the show floor, batch-qualifying end-of-day leads |
| [competitor-radar](competitor-radar/) | Structure competitor booth observations into field-intel notes with evidence/inference separation | Documenting competitor launches, pricing signals, and positioning shifts at the show |

See [docs/on-site.md](docs/on-site.md) for on-site workflow guidance.

### Post-Show

| Skill | Description | Use When |
|-------|-------------|----------|
| [post-show-followup](post-show-followup/) | Create tiered post-show follow-up email sequences | Converting leads post-event, lead nurture, thank-you emails |

## Quick Start

### Install a single skill

```bash
git clone https://github.com/LensmorOfficial/trade-show-skills.git

# Install to current workspace
cp -r trade-show-skills/trade-show-finder <your-workspace>/skills/

# Or install to shared location (available in all OpenClaw workspaces)
cp -r trade-show-skills/trade-show-finder ~/.openclaw/skills/
```

### Install all skills at once

```bash
git clone https://github.com/LensmorOfficial/trade-show-skills.git
for skill in trade-show-finder booth-invitation-writer post-show-followup trade-show-budget-planner badge-qualifier competitor-radar; do
  cp -r trade-show-skills/$skill ~/.openclaw/skills/
done
```

Skills activate automatically when your prompt matches their description.

> **ClawHub**: These skills are not yet published to ClawHub. Once published, installation will be `clawhub install <skill-slug>`.

## How It Works

Each skill is a self-contained directory with:
- `SKILL.md` — The skill definition (YAML frontmatter + workflow instructions)
- `README.md` / `README.zh.md` — Documentation (English + Chinese)
- `examples/` — Sample inputs and outputs

When you ask the agent something that matches a skill's description (e.g., "find trade shows for medical devices in Europe"), the skill activates and guides the agent through a structured workflow.

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

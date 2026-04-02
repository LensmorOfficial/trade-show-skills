<p align="center">
  <a href="https://www.lensmor.com/?utm_source=github&utm_medium=readme&utm_campaign=trade-show-skills">
    <img src="https://raw.githubusercontent.com/LensmorOfficial/.github/main/profile/assets/banner.png" alt="Lensmor" width="600">
  </a>
</p>

# Trade Show Skills for OpenClaw

[![Stars](https://img.shields.io/github/stars/LensmorOfficial/trade-show-skills?style=flat)](https://github.com/LensmorOfficial/trade-show-skills/stargazers)
[![Last Commit](https://img.shields.io/github/last-commit/LensmorOfficial/trade-show-skills?style=flat)](https://github.com/LensmorOfficial/trade-show-skills/commits/main)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Release](https://img.shields.io/badge/release-v0.3.1-green.svg)](CHANGELOG.md)

**If you find these skills useful, please star this repo — it helps others discover them.**

> OpenClaw skills for trade show selection, pre-show planning, on-site execution, and post-show follow-up.

Stop reinventing the wheel for every trade show. These skills give [OpenClaw](https://openclaw.ai) structured workflows for show selection, pre-show outreach, budget planning, on-site execution, and post-show lead conversion.

## Quick Demo

Type a prompt like this in OpenClaw (after installing a skill):

```
Should we exhibit at MEDICA 2026? We sell surgical workflow software to 200+ bed hospitals in DACH.
```

The agent will verify the current edition, score show fit against your ICP and goal, recommend `Exhibit` / `Attend only` / `Skip`, and hand you off to budgeting or outreach next steps.

Other examples of what you can do with these skills:

| Prompt | Skill Used | What You Get |
|--------|------------|--------------|
| "Compare Interpack and PACK EXPO for a DACH packaging SaaS vendor" | trade-show-finder | Show fit scores, winner recommendation, and exhibit/attend guidance |
| "Write a booth invite email for MEDICA, booth 5C42" | booth-invitation-writer | Subject line + body under 150 words, with A/B variant |
| "We got 200 leads at Interpack, write follow-up emails" | post-show-followup | 3-tier sequence (hot/warm/cold) with send-timing guide |
| "Plan a $40K budget for exhibiting at Hannover Messe" | trade-show-budget-planner | Line-item budget, ROI model, and cost benchmarks |
| "What giveaways should we bring to SaaStr, budget $8/item, selling to CTOs" | booth-giveaway-planner | 5–8 branded gift ideas with rationale, cost, and visitor targeting |
| "Write booth scripts for our team at MEDICA — cold walk-ups and warm leads" | booth-script-generator | Per-visitor-type scripts: openings, pitches, qualification questions, CTAs |
| "Generate our MEDICA prep checklist, 20sqm custom booth, 4 staff from London" | exhibitor-checklist-generator | Phased checklist with owners and deadlines, paste directly into any PM tool |

## Table of Contents

- [Quick Demo](#quick-demo)
- [Available Skills](#available-skills)
- [Quick Start](#quick-start)
- [End-to-End Lifecycle Example](#end-to-end-lifecycle-example)
- [How It Works](#how-it-works)
- [About Lensmor](#about-lensmor)
- [Related Repositories](#related-repositories)
- [Contributing](#contributing)
- [License](#license)

## Available Skills

### Pre-Show

| Skill | Description | Use When |
|-------|-------------|----------|
| [trade-show-finder](trade-show-finder/) | Score and prioritize trade shows for exhibiting based on ICP, region, and goals | Choosing where to exhibit, comparing shows, planning an annual show calendar |
| [trade-show-budget-planner](trade-show-budget-planner/) | Build exhibition budgets and ROI projections with cost benchmarks | Budget planning, ROI analysis, investment justification |
| [pre-show-competitor-analysis](pre-show-competitor-analysis/) | Analyze competitor exhibitor lists and booth positioning to inform strategy and messaging | Threat scoring, differentiation planning, counter-messaging before the show |
| [booth-invitation-writer](booth-invitation-writer/) | Generate personalized pre-show invitation emails and outreach sequences | Driving booth traffic, scheduling meetings, pre-show outreach |
| [booth-giveaway-planner](booth-giveaway-planner/) | Plan trade show giveaways matched to your ICP, budget, and product story | Choosing branded gifts, budget allocation, pre-show ordering |
| [exhibitor-checklist-generator](exhibitor-checklist-generator/) | Generate a phased exhibitor prep checklist with owners and deadlines | Show preparation planning, team task assignment, first-time exhibitors |
| [trade-show-fit-score](trade-show-fit-score/) | Score a specific trade show against your company profile using the Lensmor API | Data-backed exhibit vs. skip decisions, annual planning triage, internal budget justification |
| [trade-show-exhibitor-search](trade-show-exhibitor-search/) | Find ICP-matching exhibitors at a specific trade show using the Lensmor API | Pre-show prospecting, competitive mapping, partner discovery |
| [trade-show-lead-recommender](trade-show-lead-recommender/) | Get AI-recommended exhibitors matching your ICP for a specific trade show event | AI-driven account prioritization, turning a 500-company exhibitor list into a top-20 outreach shortlist |
| [trade-show-contact-finder](trade-show-contact-finder/) | Find decision-makers and key contacts at target exhibitor companies using the Lensmor API | Pre-show decision-maker lookup, booth meeting scheduling, account-based contact lists |
| [exhibitor-show-history](exhibitor-show-history/) | Find every trade show a company has exhibited at using the Lensmor API | Competitor show circuit mapping, account intelligence, show timing for outreach |

### On-Site

| Skill | Description | Use When |
|-------|-------------|----------|
| [badge-qualifier](badge-qualifier/) | Qualify leads from booth notes, badge scans, or voice transcripts into a structured CRM-ready record | Real-time lead scoring on the show floor, batch-qualifying end-of-day leads |
| [trade-show-competitor-radar](trade-show-competitor-radar/) | Structure competitor booth observations into field-intel notes with evidence/inference separation | Documenting competitor launches, pricing signals, and positioning shifts at the show |
| [booth-script-generator](booth-script-generator/) | Generate booth conversation scripts tailored to each visitor type | Staff training, first-time exhibitors, refreshing pitch for a new show |

See [docs/on-site.md](docs/on-site.md) for on-site workflow guidance.

### Post-Show

| Skill | Description | Use When |
|-------|-------------|----------|
| [post-show-followup](post-show-followup/) | Create tiered post-show follow-up email sequences | Converting leads post-event, lead nurture, thank-you emails |

## Quick Start

### Install from ClawHub

```bash
# Install one skill into the current OpenClaw workspace
clawhub install trade-show-finder

# Example: install the on-site competitor intel skill
clawhub install trade-show-competitor-radar
```

If you are not sure which slug you need, browse [ClawHub](https://clawhub.ai) or search from the CLI:

```bash
clawhub search "trade show"
```

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
for skill in trade-show-finder trade-show-budget-planner pre-show-competitor-analysis booth-invitation-writer booth-giveaway-planner exhibitor-checklist-generator badge-qualifier booth-script-generator trade-show-competitor-radar post-show-followup trade-show-fit-score trade-show-exhibitor-search trade-show-lead-recommender trade-show-contact-finder exhibitor-show-history; do
  cp -r trade-show-skills/$skill ~/.openclaw/skills/
done
```

Skills activate automatically when your prompt matches their description.

> **ClawHub**: All skills are published on [ClawHub](https://clawhub.ai). Install any skill with:
> ```bash
> npx clawhub@latest install trade-show-finder
> npx clawhub@latest install trade-show-exhibitor-search
> npx clawhub@latest install trade-show-fit-score
> npx clawhub@latest install trade-show-contact-finder
> npx clawhub@latest install trade-show-lead-recommender
> npx clawhub@latest install exhibitor-show-history
> ```

## End-to-End Lifecycle Example

See [docs/event-lifecycle.md](docs/event-lifecycle.md) for a worked example showing the core lifecycle skills end to end, plus where the supporting planning and on-site skills fit.

## How It Works

Each skill is a self-contained directory with:
- `SKILL.md` — The skill definition (YAML frontmatter + workflow instructions)
- `README.md` — Documentation
- `examples/` — Sample inputs and outputs

When you ask the agent something that matches a skill's description (e.g., "should we exhibit at MEDICA 2026 for our ICP?"), the skill activates and guides the agent through a structured workflow.

## About Lensmor

[Lensmor](https://www.lensmor.com/?utm_source=github&utm_medium=readme&utm_campaign=trade-show-skills) is an AI-native event intelligence platform that helps B2B teams discover trade shows, analyze exhibitors, and generate [qualified leads](https://www.lensmor.com/blog/trade-show-lead-capture?utm_source=github&utm_medium=readme&utm_campaign=trade-show-skills) before the event starts.

**[Try Lensmor Free →](https://www.lensmor.com/?utm_source=github&utm_medium=readme&utm_campaign=trade-show-skills)**

## More Open Source from Lensmor

- [awesome-trade-shows](https://github.com/LensmorOfficial/awesome-trade-shows) — Curated list of 100+ trade shows across 15 industries
- [trade-show-calendar](https://github.com/LensmorOfficial/trade-show-calendar) — Open dataset of global trade shows (CSV + JSON)
- [exhibitor-intelligence-playbook](https://github.com/LensmorOfficial/exhibitor-intelligence-playbook) — Complete B2B trade show ROI playbook
- [event-tech-landscape](https://github.com/LensmorOfficial/event-tech-landscape) — Map of 80+ tools powering the event industry
- [trade-show-email-templates](https://github.com/LensmorOfficial/trade-show-email-templates) — Ready-to-use email templates for trade show outreach

## Releases

Current release: **[v0.3.1](CHANGELOG.md)**. See [CHANGELOG.md](CHANGELOG.md) for what's included.

## Contributing

Have ideas for new skills or improvements? See [CONTRIBUTING.md](CONTRIBUTING.md) for conventions, authoring guidelines, and the review checklist.

- [CONTRIBUTING.md](CONTRIBUTING.md) — How to add or modify skills
- [docs/skill-quality-checklist.md](docs/skill-quality-checklist.md) — Pre-merge quality checklist
- [docs/publishing.md](docs/publishing.md) — Publishing and release quality guidance

## License

[MIT](LICENSE)

# Pre-Show Competitor Analysis

Analyze competitor exhibitor lists and booth positioning before the show to inform your strategy, messaging, and booth execution.

## What This Skill Does

This skill helps you:
- Map the competitive landscape at a target show
- Score threat levels based on booth presence and positioning
- Identify differentiation angles and white space opportunities
- Develop counter-messaging before the show
- Plan booth strategy and staff briefing points

## When to Use

**Before the show** (4–8 weeks out), when:
- Exhibitor lists are published
- Floor plans are available
- You need to finalize messaging and booth tactics

Not for real-time booth observation — use `competitor-radar` during the show.

## Quick Examples

### Example 1: Surgical Robotics at MEDICA

**Input:**
> "Who's exhibiting in surgical robotics at MEDICA 2026? How should we position against them?"

**What the skill does:**
1. Identifies all exhibitors in surgical robotics / OR integration
2. Analyzes booth sizes, locations, and messaging
3. Scores threat levels (direct overlap + booth prominence)
4. Recommends differentiation angles

**Sample output structure:**
- Primary threats: 3 companies with large booths and overlapping value props
- White space: Underserved segment in outpatient surgical workflows
- Recommendation: Position around "scalable for ASCs" vs. their "enterprise hospital" focus

### Example 2: Competitor Deep-Dive

**Input:**
> "What do we know about Acme Corp's presence at PACK EXPO?"

**What the skill does:**
1. Locates Acme's booth and analyzes placement
2. Reviews their listed categories and taglines
3. Checks for speaking slots or featured presence
4. Assesses threat level and recommends response

## How It Works

The skill guides the agent through:

1. **Data collection** — exhibitor lists, floor plans, show segmentation
2. **Competitor analysis** — booth signals, messaging signals, activity signals
3. **Threat scoring** — standardized 3-15 scale across overlap, prominence, and messaging clash
4. **Strategic synthesis** — recommendations for messaging, booth strategy, and timing

## Output Format

Every analysis includes:
- Executive summary (threat level + strategic implication)
- Competitor landscape table (primary threats, secondary threats, partnership candidates)
- Strategic recommendations (messaging, booth, outreach timing)
- Knowledge gaps (what to verify on-site)
- Next-step handoffs to other skills

## Related Skills

| Skill | When | Connection |
|-------|------|------------|
| `trade-show-finder` | Before choosing shows | This skill analyzes competitors at shows you've already selected |
| `booth-invitation-writer` | Pre-show outreach | Use competitor insights to craft differentiated invitations |
| `competitor-radar` | On-site | Pre-show analysis informs what to look for and who to watch |
| `post-show-followup` | After the show | Competitive intel shapes follow-up messaging |

## See Also

- [Full workflow example](../docs/event-lifecycle.md)
- [Skill quality checklist](../docs/skill-quality-checklist.md)

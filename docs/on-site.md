# On-Site Skills

Skills for use during a trade show — lead qualification and competitive intelligence capture on the show floor.

## Available Skills

### [badge-qualifier](../badge-qualifier/)

**Stage**: On-Site · **Category**: Lead Qualification

Transform raw booth conversation notes, badge scans, or voice transcripts into a structured lead record — including tier (Hot / Warm / Cold), authority, need, urgency, ICP fit, and a specific recommended next step.

**When to use**: Between booth conversations during the show day, or in a batch at the end of each day before you lose context. Works with just a badge scan (result will be appropriately sparse) or with detailed conversation notes (result will be fully qualified).

**Key design principle**: The skill refuses to inflate thin signals. A badge-only contact won't receive a fabricated "urgent need" — you get an honest Cold with a list of unknowns to resolve.

---

### [competitor-radar](../competitor-radar/)

**Stage**: On-Site · **Category**: Competitive Intelligence

Turn show-floor observations — typed notes, brochure text, pricing clues, overheard conversations — into structured competitor intel notes. Keeps direct observations and inferences clearly separated so the report can be trusted by product and sales teams.

**When to use**: After visiting a competitor's booth, after picking up a competitor brochure, or at the end of the show day to consolidate field notes before the details fade.

**Key design principle**: Every fact carries a source tag ([OBS] / [INF] / [HEARD]). A price overheard in a conversation will never appear as a confirmed quote. This matters when the intel reaches your pricing team.

---

## Typical On-Site Workflow

```
Morning: Review pre-show research (trade-show-finder output, budget targets)
     ↓
During show: badge-qualifier → qualify leads after key booth conversations
             competitor-radar → log competitor booth observations as you visit
     ↓
End of day: badge-qualifier (batch) → process all remaining badge scans
            competitor-radar → consolidate day's field notes into battlecard
     ↓
Post-show: post-show-followup → send tiered follow-up sequences within 48 hours
```

---

## Practical Notes

**When to qualify in real time vs. batch**

For Hot leads (agreed on a next step, asked about pricing), qualify immediately after the conversation while the context is fresh. For badge scans and brief encounters, batch them at the end of the day — the context won't decay as much, and interrupting the show day to process Cold leads isn't worth it.

**What to capture for competitor-radar**

The most useful inputs are:
- Banner and signage text (verbatim is better than paraphrased)
- Brochure copy (paste the relevant sections)
- Specific product names announced
- Any overheard price or performance claims (labeled as such)

What's less useful: general impressions ("their booth looked impressive") without supporting specifics. Impressions fade; written observations don't.

**Connecting on-site to post-show**

The batch summary from badge-qualifier maps directly to the lead tiers in post-show-followup. If you run badge-qualifier at the end of the show day, you'll have a clean tier list ready to hand to post-show-followup the moment you land.

---

## Future Ideas

Skills being considered for future on-site use cases:

- **meeting-prep** — Pre-brief the agent on a specific scheduled meeting: who you're meeting, what you know about their company, and what you want to accomplish. Get a structured prep note with discovery questions and positioning angles.
- **show-day-debrief** — End-of-day voice or text debrief → structured summary of conversations, competitor activity, and next-day priorities.

Open an issue in the [trade-show-skills repo](https://github.com/LensmorOfficial/trade-show-skills) if you have a specific on-site workflow you'd like to see covered.

# Pre-Show Skills

Skills for the planning and preparation phase before a trade show.

## Available Skills

### [trade-show-finder](../trade-show-finder/)

**Stage**: Pre-Show · **Category**: Research

Score and prioritize trade shows for exhibiting based on ICP, business goal, region, and market fit.

**When to use**: Early in the planning cycle, when the team is deciding which shows deserve budget, team time, and priority this year.

---

### [pre-show-competitor-analysis](../pre-show-competitor-analysis/)

**Stage**: Pre-Show · **Category**: Competitive Intelligence

Analyze exhibitor lists, booth signals, and public competitor positioning before the show.

**When to use**: After a show is shortlisted, when you need to understand who else will be there and how to sharpen your positioning before launch.

---

### [trade-show-budget-planner](../trade-show-budget-planner/)

**Stage**: Pre-Show · **Category**: Planning

Build realistic trade show budgets and ROI projections using industry cost benchmarks.

**When to use**: After choosing a target show, before committing budget internally or seeking approval.

---

### [exhibitor-checklist-generator](../exhibitor-checklist-generator/)

**Stage**: Pre-Show · **Category**: Planning

Generate a phased exhibitor prep checklist with owners and deadlines.

**When to use**: Once the show is approved and execution planning starts.

---

### [booth-invitation-writer](../booth-invitation-writer/)

**Stage**: Pre-Show · **Category**: Outreach

Generate personalized pre-show invitation emails tailored by audience type and relationship.

**When to use**: 4-6 weeks before the show, when inviting customers, prospects, partners, or media to the booth.

---

### [booth-giveaway-planner](../booth-giveaway-planner/)

**Stage**: Pre-Show · **Category**: Planning

Plan giveaway items that reinforce the brand story and fit the ICP, budget, and traffic strategy.

**When to use**: After booth goals are clear and before ordering swag, especially when deciding what to give broadly versus reserve for qualified leads.

---

### [trade-show-fit-score](../trade-show-fit-score/)

**Stage**: Pre-Show · **Category**: Research

Score a specific trade show against your company profile using the Lensmor API.

**When to use**: When evaluating a named show and wanting a data-backed fit score with dimension breakdown before committing to exhibit.

---

### [trade-show-exhibitor-search](../trade-show-exhibitor-search/)

**Stage**: Pre-Show · **Category**: Research

Find ICP-matching exhibitors at a specific trade show using the Lensmor API.

**When to use**: Before a show, when prospecting for potential customers, partners, or accounts to target for pre-show outreach.

---

### [trade-show-lead-recommender](../trade-show-lead-recommender/)

**Stage**: Pre-Show · **Category**: Research

Get AI-recommended exhibitors matching your ICP for a specific trade show event.

**When to use**: When starting from a large exhibitor list and needing to narrow it to a high-fit outreach shortlist using ICP filters.

---

### [trade-show-contact-finder](../trade-show-contact-finder/)

**Stage**: Pre-Show · **Category**: Outreach

Find decision-makers and key contacts at target exhibitor companies using the Lensmor API.

**When to use**: After identifying target companies, to find the right people for LinkedIn outreach before the show.

---

## Typical Pre-Show Workflow

```text
trade-show-finder
  -> decide which shows to prioritize and why
  -> trade-show-fit-score          [optional: data-backed fit score via API]
  -> pre-show-competitor-analysis
  -> understand threat landscape and white space
  -> trade-show-budget-planner
  -> validate ROI and get budget approval
  -> exhibitor-checklist-generator
  -> assign owners and deadlines
  -> trade-show-lead-recommender          [narrow exhibitor list to ICP-matched shortlist]
  -> trade-show-exhibitor-search         [targeted search by company URL or audience]
  -> trade-show-contact-finder           [find decision-makers at target companies]
  -> booth-invitation-writer
  -> drive pre-booked meetings
  -> booth-giveaway-planner
  -> finalize giveaway mix and distribution strategy
```

## Practical Notes

- `trade-show-finder` and `pre-show-competitor-analysis` are the strategic filters. They decide whether the event is worth doing and how crowded the field will be.
- `trade-show-budget-planner`, `exhibitor-checklist-generator`, and `booth-giveaway-planner` translate that strategy into execution.
- `booth-invitation-writer` is most effective when the target show, message, and audience segmentation are already settled.
- `trade-show-fit-score`, `trade-show-exhibitor-search`, `trade-show-lead-recommender`, and `trade-show-contact-finder` require a paid Lensmor API key (contact hello@lensmor.com). They add live data to the workflow where manual research would otherwise be needed.

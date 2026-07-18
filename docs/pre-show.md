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

Retrieve the Lensmor API's 0–10 profile fit score and its three available breakdown dimensions for a specific event.

**When to use**: When evaluating a named show and wanting a data-backed fit score with dimension breakdown before committing to exhibit.

---

### [trade-show-exhibitor-search](../trade-show-exhibitor-search/)

**Stage**: Pre-Show · **Category**: Research

List exhibitors for a specific event or run cross-event exhibitor discovery by company URL or target-audience phrase.

**When to use**: Before a show, when prospecting for potential customers, partners, or accounts to target for pre-show outreach.

---

### [trade-show-lead-recommender](../trade-show-lead-recommender/)

**Stage**: Pre-Show · **Category**: Research

Retrieve event-scoped recommendation records and distinguish populated ranked matches from unranked fallback exhibitors.

**When to use**: When starting from a large event exhibitor set and needing to check whether Lensmor has populated recommendation ranks or scores; otherwise use the returned rows as an unranked fallback.

---

### [trade-show-contact-finder](../trade-show-contact-finder/)

**Stage**: Pre-Show · **Category**: Outreach

Find relevant contacts at target companies and report returned LinkedIn and contact-lock state without unlocking email or phone data.

**When to use**: After identifying target companies, to find relevant people for LinkedIn outreach and inspect whether contact details are locked.

---

### [competitor-show-tracker](../competitor-show-tracker/)

**Stage**: Pre-Show · **Category**: Competitive Intelligence

Rank upcoming trade shows by how many competitor names match Lensmor exhibitor records, with explicit credit and HubSpot activity disclosure.

**When to use**: When you want to map show-circuit records for a competitive set and have approved the per-request credit cost and HubSpot search-activity update.

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
  -> competitor-show-tracker             [optional: map competitor-name matches across shows]
  -> trade-show-lead-recommender          [use ranked results only when recommendation evidence exists]
  -> trade-show-exhibitor-search         [event list or cross-event company discovery]
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
- `trade-show-fit-score`, `trade-show-exhibitor-search`, `trade-show-lead-recommender`, `trade-show-contact-finder`, and `competitor-show-tracker` require a Lensmor API key. Read-only search does not automatically unlock data. Successful `competitor-show-tracker` lookups consume credits and record search activity; its Skill asks for confirmation first.

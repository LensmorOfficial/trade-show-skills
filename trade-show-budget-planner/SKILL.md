---
name: trade-show-budget-planner
description: Model exhibition costs, contingency, revenue scenarios, and margin-based break-even from explicit assumptions.
license: MIT
metadata:
  version: 0.5.0
  stage: pre-show
  category: planning
  homepage: https://github.com/LensmorOfficial/trade-show-skills/tree/main/trade-show-budget-planner
---

# Trade Show Budget Planner

Build realistic trade show budgets and ROI projections — based on actual cost benchmarks, not wishful thinking.

When this skill triggers:
- Use it when the team is deciding whether a show budget is realistic, oversized, or too thin to justify
- Use it after `trade-show-finder` identifies a target event, or before final internal approval for a booth
- If the user mainly needs task sequencing rather than cost planning, continue with `exhibitor-checklist-generator`

## Example Requests

- Plan our trade show budget
- 帮我做展会预算
- Messebudget planen
- 展示会の予算を作る
- planificar presupuesto de feria

## Workflow

### Step 1: Determine Scope

Extract from the user's request:

**Required:**
- **Show name** (or type: "major international" vs "regional niche")
- **Participation type**: exhibiting (with booth) vs. attending only vs. sponsoring

**Helpful:**
- **Booth size** they're considering (sqm or sqft)
- **Team size** traveling
- **Location** (affects travel/hotel costs significantly)
- **What they're trying to achieve** (leads, brand awareness, partnerships, product launch)
- **Previous show experience** (first-timer vs. veteran)
- **Budget range** if they have one in mind
- **Currency**, whether quotes include tax, and quote date
- **Gross margin** for profit-based ROI (if unknown, keep revenue recovery separate from ROI)

If the team has not decided between exhibit vs. attend, model the most likely exhibit scenario and add a lean attend-only alternative rather than blocking.

### Step 2: Build the Budget

Use this framework. Adapt categories based on participation type.

#### For Exhibitors (Booth)

```markdown
## Trade Show Budget: [Show Name] [Year]

### 1. Space & Infrastructure
| Item | Estimate | Notes |
|------|----------|-------|
| Booth space rental | $X | [sqm × rate; estimate rate if unknown] |
| Booth design & build | $X | [shell scheme vs custom; rule of thumb: 2-3x space cost for custom] |
| Furniture rental | $X | [tables, chairs, displays, storage] |
| Electrical & internet | $X | [often surprisingly expensive at venues] |
| Signage & graphics | $X | |
| **Subtotal** | **$X** | |

### 2. Travel & Accommodation
| Item | Estimate | Notes |
|------|----------|-------|
| Flights (X people) | $X | [book 2-3 months ahead for shows] |
| Hotel (X nights × X people) | $X | [show hotels are premium; budget 1.5-2x normal rates] |
| Ground transport | $X | [airport transfers, daily commute to venue] |
| Meals & entertainment | $X | [client dinners, team meals] |
| **Subtotal** | **$X** | |

### 3. Marketing & Collateral
| Item | Estimate | Notes |
|------|----------|-------|
| Pre-show marketing | $X | [email campaigns, social ads, invite printing] |
| Printed materials | $X | [brochures, business cards, handouts] |
| Giveaways / swag | $X | |
| Lead capture system | $X | [badge scanner rental or app] |
| **Subtotal** | **$X** | |

### 4. Staffing & Operations
| Item | Estimate | Notes |
|------|----------|-------|
| Staff time (opportunity cost) | $X | [days × people × daily rate] |
| Booth staff training | $X | [if applicable] |
| Shipping & logistics | $X | [samples, equipment, booth materials] |
| Insurance | $X | |
| **Subtotal** | **$X** | |

### Total Estimated Budget: $X

## Budget Decision Snapshot
- Participation mode: [Exhibit / Attend / Sponsor]
- Budget confidence: [High / Medium / Low]
- Largest cost drivers: [top 2-3]
- Biggest unknowns: [what still needs confirmation]
```

**Cost estimation rules:**
- If the user gives a specific show, search for actual booth rental rates if possible
- If rates unknown, use industry benchmarks and mark every figure as `[EST]`:
  - Space: $300–600/sqm `[EST 2023–2024, US/EU major shows]` — verify with organizer; rates for 2025+ shows may be higher
  - Space: $150–300/sqm `[EST 2023–2024, regional/Asia shows]`
  - Custom booth build: $1,500–3,000/sqm `[EST 2023–2024]`
  - Shell scheme: $500–1,000/sqm `[EST 2023–2024]`
- Hotels near major show venues: 1.5-2x normal city rates during show week
- Always note which figures are estimates vs. confirmed rates
- Show the base subtotal and a separate 10% contingency line before the total. State which costs the contingency covers; do not silently omit it or count it twice
- Separate cash outlay from staff opportunity cost. Use one stated currency; label any currency conversion with its source and date

**What to confirm with the venue (include as a checklist if the user is in early planning):**
- Exact booth space rate and what's included (bare space vs. shell scheme)
- Electrical/internet connection fees and lead times
- Move-in/move-out schedule and overtime labor rates
- Mandatory services (cleaning, security, carpet) that may be billed separately
- Early bird registration deadlines and cancellation policies

#### For Attendees Only

Simpler budget — travel, hotel, registration fee, meals, and opportunity cost.

### Step 3: ROI Projection

```markdown
## ROI Projection

### Assumptions
- Expected booth visitors: [X] (based on show size and booth location)
- Meaningful conversations: [X]% of visitors = [X] qualified leads
- Conversion rate (lead → opportunity): [X]%
- Conversion rate (opportunity → deal): [X]%
- Average deal value: $[X]

### Projected Pipeline
| Stage | Count | Value |
|-------|-------|-------|
| Booth visitors | X | — |
| Qualified leads | X | — |
| Opportunities | X | $X |
| Closed deals | X | $X |

### ROI Calculation
- **Total investment**: $X
- **Projected revenue**: $X
- **Revenue recovery**: X% (revenue-based; not profit ROI)
- **Profit ROI**: X% or Not assessed (gross margin required)
- **Cost per lead**: $X
- **Revenue / profit break-even**: X deals / Y deals or Not assessed

### Sensitivity Analysis
| Scenario | Leads | Expected Deals | Revenue | Revenue Recovery | Profit ROI |
|----------|-------|----------------|---------|------------------|------------|
| Conservative | X | X | $X | X% | X% / Not assessed |
| Base case | X | X | $X | X% | X% / Not assessed |
| Optimistic | X | X | $X | X% | X% / Not assessed |
```

**ROI rules:**
- Calculate with explicit formulas: leads = visitors × qualification rate; opportunities = leads × opportunity rate; expected deals = opportunities × win rate; revenue = expected deals × deal value. Keep fractional expected deals through the calculation; label rounded planning targets separately
- Revenue recovery = (attributable revenue − investment) / investment. Label this a revenue-based measure, not profit ROI
- Profit ROI = (attributable revenue × gross margin − investment) / investment. If gross margin is missing, report profit ROI and profit break-even as `Not assessed`
- Revenue break-even deals = ceiling(investment / deal value); profit break-even deals = ceiling(investment / (deal value × gross margin)). State the chosen investment basis; a zero denominator is `Not assessed`, never a division result
- Include contingency in every scenario's investment. Keep unsupported conversion assumptions visibly labeled as scenario inputs; do not infer booth visits from total show attendance
- Always include a conservative scenario — trade shows often underperform first-time expectations
- If the user hasn't exhibited before, use more conservative conversion rates
- Note that trade show ROI often materializes over 6-12 months, not immediately
- Include qualitative value that's hard to quantify: brand visibility, competitive intel, market feedback

### Step 4: Decision and Optimization Suggestions

Start this section with a clear recommendation:
- **Go as planned**
- **Re-scope** (smaller booth, fewer staff, simpler build)
- **Attend only**
- **Defer**

Based on the budget, suggest 2-3 ways to optimize:

- **If budget-constrained**: Consider a smaller booth in a better location, attend-only with scheduled meetings, or share a booth with a partner
- **If first-timer**: Compare shell scheme with custom build and test pre-show marketing assumptions; do not guarantee traffic or conversion
- **Common overspends**: Custom booth builds (often 40% of total), premium giveaways, over-staffing
- **Common underspends**: Pre-show marketing (the #1 driver of booth traffic), lead follow-up tools, staff training
- **Pre-show research**: Review current exhibitor categories and booked-meeting evidence before choosing a booth size; an exhibitor list alone does not establish booth traffic

### Step 5: Exportable Format

Offer to output the budget as:
- Markdown table (default)
- CSV format (for spreadsheet import)
- Executive summary (1-page version for budget approval)

Add a **Next-Step Handoff** section:
- If approved, continue with `exhibitor-checklist-generator`
- If traffic generation is the main risk, continue with `booth-invitation-writer`
- If swag meaningfully affects spend or booth traffic, continue with `booth-giveaway-planner`

## Quality Checks

Before delivering results:
- Separate confirmed costs from estimated costs; do not blur them together
- Every ROI scenario must state its conversion assumptions explicitly
- If participation mode is undecided, include an attend-only or re-scoped alternative rather than pretending the exhibit plan is fixed
- Budget confidence should drop when venue pricing, booth build scope, or travel assumptions are still unknown
- Optimization advice must reflect the stated goal; do not cut pre-show marketing if meetings and booth traffic are the core objective

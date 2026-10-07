# Example: 20sqm Exhibition Budget and Break-Even

> Fictional planning example for MEDICA. All rates, conversion assumptions, and financial figures are illustrative scenario inputs, not organizer quotes or expected results. Verify the intended edition and supplier pricing before using this budget.

## Input

```text
Model an exhibit budget: 20sqm custom booth, four staff traveling within Europe,
five hotel nights each, EUR 30,000 average deal value. Use explicit assumptions.
We do not yet have organizer or supplier quotes, or an agreed gross margin.
```

## Estimated Budget

Currency: EUR. Tax treatment, edition dates, supplier availability, and booking cutoffs: not verified. Staff opportunity cost is separate from cash outlay.

| Category | Item | Estimate [EST] | Basis |
|---|---|---:|---|
| Space/infrastructure | Space | 7,000 | 20sqm × illustrative EUR 350/sqm |
| Space/infrastructure | Custom build | 18,000 | Illustrative supplier scope, not an organizer rate |
| Space/infrastructure | Furniture | 1,500 | Scenario input |
| Space/infrastructure | Electrical/internet | 1,200 | Scenario input |
| Space/infrastructure | Graphics | 2,500 | Scenario input |
| Travel | Flights | 2,400 | 4 × EUR 600 |
| Travel | Hotel | 6,000 | 5 nights × 4 rooms × EUR 300 |
| Travel | Ground transport | 800 | Scenario input |
| Travel | Meals | 2,000 | Scenario input |
| Marketing | Outreach | 500 | Scenario input |
| Marketing | Printing | 800 | Scenario input |
| Marketing | Demo setup | 1,500 | Scenario input |
| Marketing | Lead capture | 400 | Scenario input |
| Marketing | Giveaways | 600 | Scenario input |
| Operations | Freight | 2,000 | Scenario input |
| Operations | Insurance | 400 | Scenario input |
| **Cash subtotal** | | **47,600** | |
| **Cash contingency** | | **4,760** | 10% of cash subtotal; not applied twice |
| **Cash budget** | | **52,360** | |
| Staff | Opportunity cost | 8,000 | 4 people × 5 days × EUR 400/day |
| **Total economic investment** | | **60,360** | Cash budget + staff opportunity cost |

Budget confidence: **Low** until scope, quotes, tax, and dates are confirmed.

## Revenue Scenarios

These use hypothetical booth traffic, not a projection derived from total show attendance. Qualification rate = 15%; lead-to-opportunity rate = 20%; win rate = 25%. Keep expected deals fractional until calculating revenue.

| Metric | Conservative | Base | Optimistic |
|---|---:|---:|---:|
| Visitors [scenario input] | 300 | 400 | 500 |
| Qualified leads | 45 | 60 | 75 |
| Opportunities | 9 | 12 | 15 |
| Expected deals | 2.25 | 3.00 | 3.75 |
| Expected attributable revenue | 67,500 | 90,000 | 112,500 |
| Economic investment | 60,360 | 60,360 | 60,360 |
| Revenue recovery | 11.83% | 49.11% | 86.38% |
| Cost per qualified lead | 1,341.33 | 1,006.00 | 804.80 |
| Profit ROI | Not assessed | Not assessed | Not assessed |

Revenue recovery = (revenue − economic investment) / economic investment. This is not profit ROI.

Revenue break-even = ceiling(60,360 / 30,000) = **3 deals** on the economic investment basis. On the cash-only basis, ceiling(52,360 / 30,000) = **2 deals**. Profit break-even requires gross margin and is **Not assessed**.

If the team later confirms a 60% gross margin, the base-case profit ROI would be (90,000 × 0.60 − 60,360) / 60,360 = **−10.54%**, and economic profit break-even would be ceiling(60,360 / 18,000) = **4 deals**. The 60% is a sensitivity input, not a known margin.

## Decision and Next Steps

**Re-scope before approval.** The revenue-only base case does not establish profitability. Obtain quotes and a margin assumption, then compare a smaller shell-scheme scope and an attend-only plan using the same investment basis. Test outreach assumptions without promising a traffic uplift.

If approved, pass confirmed dates, scope, staff count, and supplier cutoffs to `exhibitor-checklist-generator`.

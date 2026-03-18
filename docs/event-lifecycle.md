# End-to-End Event Lifecycle

How to use all 6 skills together — from show selection to closed pipeline.

> **Note**: The company and contacts in this example are fictional. Any resemblance to real organizations is coincidental.

---

## Scenario

**Company**: Vantara Systems — a B2B SaaS company selling production scheduling software to food and beverage manufacturers. Mid-market focus, average deal size €80K–€200K, 6–9 month sales cycle.

**Team**: 3 people attending: 1 sales lead, 1 solutions engineer, 1 marketing manager.

**Goal**: Generate 8–12 qualified leads (Tier A/B), identify competitive positioning shifts, and validate product-market fit signals for a new line-balancing module currently in beta.

**Show under consideration**: Anuga FoodTec (Cologne) — biennial, ~1,700 exhibitors, focused on food processing technology buyers.

---

## Phase 1 — Pre-Show (8–12 weeks out)

### Step 1: Evaluate the show with `trade-show-finder`

The team isn't sure whether Anuga FoodTec or ProPak Europe is the better fit for this year. They ask:

```
Compare Anuga FoodTec and ProPak Europe for a company selling production scheduling SaaS to food manufacturers. We're mid-market, focused on DACH and Benelux.
```

**Output**: A comparison table with dates, venue, exhibitor/visitor counts, and audience profile for each show. The skill recommends Anuga FoodTec as the stronger fit — larger percentage of plant operations and production management attendees, established DACH presence, and a well-documented software pavilion.

**What carries forward**: Show name, dates, visitor profile, and the exhibitor count — these feed directly into the budget model.

---

### Step 2: Build the ROI case with `trade-show-budget-planner`

With Anuga FoodTec confirmed as the target, the marketing manager needs to justify the spend to the CFO. They ask:

```
Build a budget for exhibiting at Anuga FoodTec with a 20sqm booth, 3-person team, 5-day show. We sell production scheduling SaaS, average deal €120K. Help me build the ROI case.
```

**Output**: Itemized budget across booth/infrastructure, travel, marketing materials, and operations. ROI projection with conservative/base/optimistic scenarios. Break-even calculation: 1.4 deals closes the show. Cost-per-lead benchmarks for the industry.

**What carries forward**: The budget approval memo goes to the CFO. The "target lead count" (8–12 qualified) and "deal value" (€120K) become the success metrics for the trip. These also inform how aggressively to push for follow-up meetings on-site.

---

### Step 3: Drive booth traffic with `booth-invitation-writer`

Six weeks before the show, the sales lead has a list of 80 contacts — a mix of existing customers, warm prospects, and cold targets in the DACH food manufacturing segment. Three different emails are needed:

```
Write booth invitation emails for Anuga FoodTec. We have 3 audiences:
1. Existing customers (7 companies) — we want to schedule 30-min update sessions
2. Warm prospects (25 contacts) — plant managers and operations directors we've spoken to in the past 6 months
3. Cold outreach (48 contacts) — food manufacturers in DACH we haven't contacted before

We're at booth C42, Hall 5.1. Launching a new line-balancing module in beta at the show.
```

**Output**: Three distinct email templates — each with different tone, hook, and CTA. Subject line A/B variants for the cold sequence. A follow-up reminder email for non-responders (14 days before the show).

**What carries forward**: 12 confirmed meeting slots booked before the show starts. The confirmed meetings feed into the on-site schedule. The warm and cold sequences are sent 5 days apart; the reminder goes out 10 days before.

---

## Phase 2 — On-Site (show days)

### Step 4: Qualify leads in real time with `badge-qualifier`

End of day one: the sales lead has had 14 interactions — 3 substantive conversations, 7 quick chats, and 4 badge scans with no real conversation. Rather than guessing tiers at the airport, they process notes that evening:

```
Qualify these leads from day 1 at Anuga FoodTec. We sell production scheduling SaaS. ICP: plant directors and operations managers at food manufacturers, 200+ employees, DACH.

1. Petra Zimmermann, Head of Operations, Ritter Sport — 25 min conversation. Currently using spreadsheets for scheduling, frustrated with manual coordination between lines. Mentioned "we have budget approved for this year, need something running before peak season". Gave business card, asked for proposal.

2. Badge scan: Marco Bianchi, Process Engineer, Barilla Group. No conversation, grabbed our brochure.

3. Tom van der Berg, VP Operations, FrieslandCampina — 10 min chat. Interested but said "we just finished a big ERP rollout, probably not the right time". Still took our card.

4. Ingrid Paulsen, Procurement Manager, Arla Foods — demoed the line-balancing module, asked about pricing for 3 plants. Said IT would need to be involved. No timeline given.
```

**Output**: Four lead cards with tiers, authority ratings, and specific recommended next steps. Petra is Hot (authority + explicit need + budget confirmed + agreed on proposal). Ingrid is Warm (genuine interest, pricing discussion, but missing timeline and IT sign-off). Tom is Cold (real conversation, but no active need). Marco is Cold (badge only).

**Why this matters**: The skill flags that Marco's "Cold" rating should not be inflated just because Barilla is a recognizable name. It also notes that Tom's "not the right time" is a genuine objection, not a soft yes — scheduling a demo call after the show would be premature.

**What carries forward**: The tier list (1 Hot, 1 Warm, 2 Cold) maps directly to the follow-up sequences in Phase 3.

---

### Step 5: Document competitor intel with `competitor-radar`

The solutions engineer spends 45 minutes walking competitor booths in Hall 5.1. They take notes:

```
Competitor observations from Anuga FoodTec, day 2:

1. Preactor (Siemens) — large booth, 200sqm+. New product called "Opcenter Scheduling 2026". Banner copy: "AI-driven finite capacity scheduling — reduces planning time by 60%". Lots of traffic, mostly process engineers. Grabbed their datasheet.

2. Asprova — mid-size booth. Standard positioning, nothing new. One rep told a group "our pricing starts around €40K for a single plant" (overheard, not verified).

3. Logility — small booth. Mostly focused on demand planning angle. Not directly targeting our segment based on what I heard.
```

**Output**: Three competitor intel notes. Preactor/Opcenter 2026 is tagged High threat — a specific, quantified claim ("60% planning time reduction") that directly attacks our value proposition, with heavy foot traffic as supporting evidence. Asprova's pricing (€40K) is tagged [HEARD] and explicitly marked as unverified. Logility is tagged Low threat for this segment.

**Why the OBS/INF/HEARD tagging matters**: The sales team back home will see this report. If the Asprova price is reported as a fact, it could anchor deal negotiations. Tagged correctly, it's a signal to investigate — not a talking point.

**What carries forward**: The Opcenter 2026 claim feeds into a post-show product team debrief. The action items (pull Preactor's datasheet, prepare a response to the "60% planning time" claim) are logged for the week after the show.

---

## Phase 3 — Post-Show (within 48 hours of landing)

### Step 6: Send tiered follow-up with `post-show-followup`

The sales lead lands Tuesday evening. Before opening their laptop Wednesday morning, they have a clear tier list from the badge-qualifier output. They ask:

```
Write follow-up sequences for my Anuga FoodTec leads. We sell production scheduling SaaS.

Hot lead: Petra Zimmermann, Head of Operations, Ritter Sport — asked for a proposal, has budget approved for this year, needs something running before peak season. We agreed I'd send a proposal outline and schedule a call.

Warm lead: Ingrid Paulsen, Procurement Manager, Arla Foods — demoed the product, asked about pricing for 3 plants. IT needs to be involved but no timeline given.

Cold (2 leads): Marco Bianchi (badge scan, no conversation) and Tom van der Berg (genuine conversation but explicitly said "not the right time").
```

**Output**: Tiered email sequences. Petra gets a same-day email referencing her specific pain point (spreadsheet coordination failures ahead of peak season), the agreed proposal outline, and a calendar link. Ingrid gets a Day 2 email with a brief ROI framing for multi-plant deployment and a soft ask to schedule a call that includes her IT stakeholder. Marco and Tom get shorter, low-pressure cold sequences — no pretending a deep conversation happened.

**Why the 48-hour window matters**: Petra will receive 30–50 show follow-ups this week. The ones that arrive Wednesday — while she's still in Cologne or on the train home — get read. The ones that arrive Friday are inbox noise. The badge-qualifier output from the show floor is what makes Wednesday follow-up possible without scrambling.

---

## End-to-End Workflow Summary

```
8–12 weeks out
  trade-show-finder
    → Shortlist shows, confirm Anuga FoodTec as target
    ↓
  trade-show-budget-planner
    → ROI model, CFO memo, lead target: 8–12 qualified
    ↓
  booth-invitation-writer
    → 3 audience segments, 12 meetings pre-booked

Show floor
    ↓
  badge-qualifier (real-time or end-of-day)
    → Tier list: 1 Hot, 1 Warm, 2 Cold — with specific next steps
    ↓
  competitor-radar (daily)
    → Opcenter 2026 flagged High threat; Asprova pricing tagged [HEARD]

Within 48 hours of landing
    ↓
  post-show-followup
    → Petra: proposal + calendar link, same day
    → Ingrid: Day 2, multi-plant ROI framing
    → Marco + Tom: cold sequences, no false urgency
```

---

## What Makes This Work

**The handoff points are the key.** Each skill outputs something the next one can use directly:

- `trade-show-finder` → show name and visitor profile → feeds budget model
- `trade-show-budget-planner` → lead target and deal value → sets success criteria for on-site team
- `booth-invitation-writer` → confirmed meetings → reduces cold booth traffic during the show
- `badge-qualifier` → tier list with specific context → enables same-day follow-up without re-summarizing notes
- `competitor-radar` → tagged intel note → reaches product and sales teams with clear evidence labels
- `post-show-followup` → personalized sequences → lands in inbox before the contact moves on

**What goes wrong without this workflow:**

- Deciding to exhibit at a show without verifying the audience profile → wrong show
- No pre-booked meetings → 90% of booth time is passive
- No on-site lead notes → following up on "great meeting you!" with no specifics
- No tier separation → Petra gets the same email as Marco
- Competitor intel without source tags → sales team quotes an unverified price as fact

---

*Each skill links to its own detailed documentation with worked examples. See the [README](../README.md) for installation and the individual skill directories for full workflow specifications.*

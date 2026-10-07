---
name: badge-qualifier
description: Qualify badge scans and booth notes conservatively into evidence-based lead tiers and follow-up cards.
license: MIT
metadata:
  version: 0.5.0
  stage: on-site
  category: lead-qualification
  homepage: https://github.com/LensmorOfficial/trade-show-skills/tree/main/badge-qualifier
---

# Badge Qualifier

Transform raw booth conversation notes into a structured lead record — including tier, authority, fit, and next step — without inflating signals that aren't there.

When this skill triggers:
- Use it during the show or immediately after to triage leads while the conversation is still fresh
- Use it for live single-lead decisions or end-of-day batch qualification
- Do not use it to write the outbound sequence itself; hand the result to `post-show-followup`

## Example Requests

- Score my booth leads
- 给展会线索打分
- Leads qualifizieren
- リードを評価する
- calificar leads de feria

## Workflow

### Step 1: Normalize Raw Input

Accept any of these input formats:
- Typed booth notes ("Spoke with Sarah at Acme, she asked about pricing for 5 lines")
- Badge or business card OCR text (name, title, company, contact details)
- Voice transcript or dictated summary
- A mix of all three

If the user pastes badge text only, treat it as **contact-only** — do not infer conversation depth that wasn't described.

Use supplied contact information only in the requested lead records. Do not upload badge images, notes, emails, or phone numbers to enrichment services or a CRM unless the user has authorized that destination. If sharing a worked example or public report, replace personal contact details with placeholders.

Extract and confirm these fields before proceeding:
- **Contact name** (badge or notes; unknown if absent)
- **Job title** (badge; unknown if absent)
- **Company** (badge; unknown if absent)
- **How contact was made** (scanned badge / brief chat / product demo / pricing discussion)

If critical fields are missing and the user is in a live session, ask a single clarifying question. If processing in bulk, mark as `unknown` and continue.

### Step 2: Extract Structured Lead Facts

From the normalized input, pull explicit facts — not inferences:

| Field | Source | Rule |
|-------|--------|------|
| Name / Title / Company | Badge or notes | Transcribe exactly; mark as `unknown` if absent |
| Email / Phone | Badge | Transcribe only if present; never fabricate |
| **Need** | Conversation notes | Only quote if explicitly stated; otherwise `unknown` |
| **Urgency** | Notes ("needs by Q3", "replacing system now") | Only when a timeline is given |
| **Authority** | Explicit role clues in notes | A title alone does not establish buying involvement |
| **Budget signal** | Notes only | Only if the contact or rep mentioned it |
| **ICP fit** | Compare to ICP criteria if provided | Low / Medium / High; explain why |

**Critical guard**: if the input is a badge scan with no conversation notes, the output should reflect that — do not generate a "needs" field or urgency from a job title alone.

### Step 3: Qualify Lead Conservatively

Apply a 4-signal score:

**Authority** — buying involvement supported by conversation evidence:
- Decision Maker: explicitly owns approval, vendor selection, or the relevant budget
- Influencer: explicitly participates in evaluation, requirements, or a buying-team recommendation
- End User: explicitly uses the workflow, with no stated buying involvement
- Unknown: buying role was not stated, including when a senior title is present

Record the supporting quote or note. A job title can guide a follow-up question but cannot supply the authority signal.

**Need** — was a problem or goal stated?
- Explicit: they said what they're trying to solve
- Implied: they attended a demo or asked product questions
- None: badge scan only

**Urgency** — timeline signal:
- Immediate: replacing something now, evaluating for current project
- Planned: mentioned a future cycle, budget in planning
- None: no timeline discussed

**Fit** — against ICP (if provided):
- High / Medium / Low based on company type, size signals, and industry

**Tier assignment:**

| Tier | Criteria |
|------|----------|
| **Hot (A)** | All three: Authority ≥ Influencer **+** explicit Need **+** Urgency signal |
| **Warm (B)** | Any two of the three signals present (see combinations below) |
| **Cold (C)** | Zero or one signal, or badge-only with no conversation |

**Warm tier signal combinations** — any of these qualifies as Warm:
- Authority ≥ Influencer + explicit Need (no timeline given)
- Authority ≥ Influencer + Urgency (problem implied but not stated)
- Explicit Need + Urgency (authority unknown — genuine conversation but buyer unclear)

Do not upgrade a lead based on a prestigious company name or impressive title alone. A C-suite badge scan with no conversation is still Cold. Unknown authority alone never elevates a tier.

### Step 4: Produce Follow-up Handoff

Output a structured lead card as formatted Markdown (do not wrap in a code block — the card should render as readable text):

```
## Lead: [Name] — [Tier]

**Contact**
- Name: [name or unknown]
- Title: [title or unknown]
- Company: [company or unknown]
- Email: [email or unknown]
- Phone: [phone or unknown]

**Qualification**
- Authority: [Decision Maker / Influencer / End User / Unknown]
- Need: [explicit statement or "not stated"]
- Urgency: [timeline signal or "none discussed"]
- ICP Fit: [High / Medium / Low / Unknown — reason]
- Tier: [Hot / Warm / Cold]
- Follow-up Class: [Tier 1 / Tier 2 / Tier 3]
- Why this Tier: [1 short line grounded in the actual signals]

**Conversation Summary**
[2–3 sentences summarizing what was actually discussed. If only a badge scan, say so plainly.]

**Recommended Next Step**
[Specific action for the sales rep — not generic. If no conversation happened, suggest a low-commitment outreach, not a proposal call.]

**Unknowns to resolve**
[List any critical qualification gaps: budget, decision timeline, who else is involved]
```

If the user submits multiple leads at once, output one card per lead, then a brief **Batch Summary** at the end:
```
## Batch Summary
- Hot (A): X leads
- Warm (B): X leads
- Cold (C): X leads
- Immediate priority: [names for same-day follow-up]
```

**Next step**: the lead cards produced here can be fed directly into `post-show-followup` — the Hot / Warm / Cold tiers map to its Tier 1 / Tier 2 / Tier 3 sequences.

## Quality Checks

Before delivering results:
- Do not fill in `unknown` fields with plausible guesses — gaps are more useful than fabrications
- A badge-only contact should never receive an `Explicit need` entry
- Hot requires all three confirmed signals: buying involvement, explicit need, and urgency. Warm requires exactly two; zero or one is Cold
- Recommended next step must match the tier (no demo calls for Cold leads)
- If notes are ambiguous, surface the ambiguity rather than resolving it silently
- `Follow-up Class` must match the lead tier: Hot → Tier 1, Warm → Tier 2, Cold → Tier 3

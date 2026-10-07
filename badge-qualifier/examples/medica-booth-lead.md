# Example: MEDICA Booth Lead Qualification

> Fictional example. People, hospitals, company claims, and contact details below are invented. The show context is illustrative, not attendance evidence.

**Product**: SurgFlow — surgical workflow software
**ICP**: Procurement or operations teams at 200+ bed hospitals in DACH

## Input

```text
Qualify these contacts from our booth:

1. Ingrid Kessler, Chief Medical Officer, Northbridge Hospital Frankfurt (800 beds).
   She said: "I'm on the vendor evaluation team with IT. We need to replace our
   scheduling system this quarter because coordination is failing. Please send
   demo times for next week." Email on card: ingrid@northbridge.example.

2. Badge scan only: Stefan Nowak, Procurement Specialist, Medicentrum Krakow.
   No conversation. Picked up our one-pager. No contact details or bed count.

3. Lars Andersen, Operations Manager, Northbridge Copenhagen (1,000 beds).
   Five-minute chat: "We're always open to better tools." No problem, project,
   buying role, or timeline stated. Email on card: lars@northbridge.example.

4. Alex Meyer, title not captured, Northbridge Munich (400 beds).
   Said: "Scheduling handovers are causing delays. We need a replacement before
   January." Did not describe their role in the purchase. No email captured.
```

## Output

### Lead: Ingrid Kessler — Hot (A)

- Contact: Chief Medical Officer, Northbridge Hospital Frankfurt; ingrid@northbridge.example; phone unknown
- Authority: **Influencer** — explicitly participates in vendor evaluation with IT; approval/budget ownership unknown
- Need: **Explicit** — replace scheduling system because coordination is failing
- Urgency: **Planned** — this quarter; requested demo times next week
- ICP fit: **High** — supplied hospital size and Frankfurt location match the ICP
- Tier: **Hot**; Follow-up Class: **Tier 1**
- Why: all three signals are supported by the notes; senior title alone did not supply authority
- Conversation summary: Ingrid described an active replacement and her evaluation role. She requested demo times; no meeting time has been agreed
- Next step: send proposed demo times within 24 hours; do not claim a confirmed booking
- Unknowns: budget owner, IT contact, procurement process

### Lead: Stefan Nowak — Cold (C)

- Contact: Procurement Specialist, Medicentrum Krakow; email and phone unknown
- Authority: **Unknown** — title alone does not establish buying involvement
- Need: **Not stated**; Urgency: **None discussed**
- ICP fit: **Low for the stated region** — Krakow is outside DACH; bed count unknown
- Tier: **Cold**; Follow-up Class: **Tier 3**
- Why: badge-only contact with no qualification signals
- Conversation summary: a badge was scanned and a one-pager taken. No conversation was described
- Next step: low-commitment introduction if an appropriate contact channel is available
- Unknowns: need, buying role, hospital size, timeline

### Lead: Lars Andersen — Cold (C)

- Contact: Operations Manager, Northbridge Copenhagen; lars@northbridge.example; phone unknown
- Authority: **Unknown** — buying involvement was not stated
- Need: **Not explicit** — openness to tools does not describe a problem
- Urgency: **None discussed**
- ICP fit: **Low for the stated region** — size fits but Copenhagen is outside DACH
- Tier: **Cold**; Follow-up Class: **Tier 3**
- Why: a conversation occurred, but none of the three qualifying signals was confirmed
- Conversation summary: Lars expressed general receptivity. No active project was described
- Next step: a short question to establish a relevant problem; do not presume a demo or proposal is wanted
- Unknowns: active need, buying role, timeframe

### Lead: Alex Meyer — Warm (B)

- Contact: title unknown, Northbridge Munich; email and phone unknown
- Authority: **Unknown**
- Need: **Explicit** — scheduling handover delays
- Urgency: **Planned** — replacement before January
- ICP fit: **High** — supplied hospital size and Munich location match
- Tier: **Warm**; Follow-up Class: **Tier 2**
- Why: explicit need and urgency are confirmed; authority remains unknown
- Conversation summary: Alex described a problem and deadline. Their role in evaluation or approval was not stated
- Next step: confirm who is involved and a suitable follow-up channel within 48 hours
- Unknowns: title, buying role, contact channel, budget

## Batch Summary

- Hot: 1 — Ingrid; propose demo times within 24 hours
- Warm: 1 — Alex; confirm buying process and contact channel
- Cold: 2 — Stefan and Lars; low-commitment qualification first

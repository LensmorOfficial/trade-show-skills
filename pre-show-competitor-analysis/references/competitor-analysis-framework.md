# Competitor Analysis Framework

Use this framework whenever `pre-show-competitor-analysis` is asked to analyze competitor presence, positioning, and strategy at a trade show.

## Goal

Turn exhibitor list research into actionable competitive intelligence for:
- Threat assessment
- Differentiation opportunities
- Strategic recommendations

The analysis should be structured, verifiable, and immediately useful.

---

## Analysis Dimensions

### 1. Booth Presence Signals

Analyze physical presence on the show floor:

| Signal | What to Look For | Why it Matters |
|--------|------------------|----------------|
| **Booth size** | Island, peninsula, corner, inline | Larger = more investment, higher visibility |
| **Location** | Main hall, secondary hall, entrance proximity | Better location = more foot traffic |
| **Sponsorship level** | Platinum/gold/silver, speaking slots, event presence | Indicates strategic priority and budget |
| **Multiple booths** | Subsidiary brands, partner pavilions | Signals market expansion or segmentation |

### 2. Messaging Signals

Extract positioning from published materials

| Source | What to Extract |
|--------|------------------|
| Show website listing | Product categories, taglines, featured products |
| Press releases | New launches, partnerships, market focus |
| Social media | Campaign themes, event promotions |
| Past show reports | Demo highlights, customer testimonials |

### 3. Activity Signals

Identify scheduled presence and events

- **Speaking slots**: Topic, speaker seniority, track placement
- **Demo schedules**: Product focus, booking requirements
- **Partner events**: Co-marketing, joint presentations
- **Hospitality**: VIP events, customer meetings

---

## Threat Scoring Method

Score each competitor across three dimensions (1-5 each):

| Dimension | 1 (Low) | 3 (Medium) | 5 (High) |
|-----------|---------|------------|----------|
| **Direct overlap** | Adjacent market, Some feature overlap | Direct replacement |
| **Booth presence** | Small inline booth, Mid-size corner | Large island or sponsorship |
| **Messaging clash** | Different positioning, Some messaging overlap | Same value proposition |

**Total threat score**: Sum of three dimensions (3-15)

### Threat Categories

| Score | Category | Action |
|-------|----------|--------|
| 12-15 | **Primary threat** | Prepare counter-messaging, brief booth staff |
| 8-11 | **Secondary threat** | Monitor, prepare differentiation points |
| 3-7 | **Watch list** | Monitor, don't distract from primary threats |

---

## Source Tagging Convention

Use these tags to make data provenance explicit:

| Tag | Meaning | Example |
|-----|---------|---------|
| `[OBS]` | Directly observed | `[OBS] 20x20 island booth in Hall 3` |
| `[INF]` | Inferred from evidence | `[INF] Large booth suggests significant budget` |
| `[HEARD]` | Second-hand information | `[HEARD] Sales rep mentioned new product launch` |
| `[EST]` | Estimated, not confirmed | `[EST] ~50 staff based on booth size` |

**Rule**: Never present `[INF]`, `[HEARD]`, or `[EST]` as `[OBS]`.

---

## White Space Analysis

Identify underserved positions or segments

### Positioning Gaps

| Gap Type | How to Identify |
|----------|-----------------|
| **Price tier** | All competitors at enterprise level, none in mid-market |
| **Segment** | All focus on large enterprises, none in SMB |
| **Region** | Strong US presence, weak APAC positioning |
| **Use case** | Feature-heavy messaging, no workflow focus |

### Opportunity Signals

- Competitors cluster in one positioning space
- Clear messaging gap in their public materials
- Adjacent segments with no dominant player

---

## Strategic Response Framework

### For Primary Threat

| Response | When to Use |
|----------|-------------|
| **Differentiation** | You have a clear capability they lack |
| **Counter-positioning** | Their strength has a flipside weakness |
| **Niche focus** | They dominate mainstream, you can own a segment |
| **Partnership** | Competitor on one axis, partner on another |

### For Secondary Threat

| Response | When to Use |
|----------|-------------|
| **Monitor** | Not worth diverting resources yet |
| **Prepare talking points** | In case prospects compare |
| **Test positioning** | Pilot a counter-message |

### For White Space

| Response | When to Use |
|----------|-------------|
| **Lead with it** | Underserved segment, clear demand |
| **Test messaging** | Uncertain demand, worth experimenting |
| **Park it** | Too small or off-strategy |

---

## Output Quality Standard

Every analysis must include:

1. **Source transparency**: Tag all claims with `[OBS]`/`[INF]`/`[HEARD]`/`[EST]`
2. **Threat scores**: Numeric rating for each primary competitor
3. **Strategic implications**: What this means for booth, messaging, outreach
4. **Knowledge gaps**: What you don't know and should verify on-site
5. **Handoff**: Which skill to use next (booth-invitation-writer, trade-show-competitor-radar)

---

## Common Mistakes to Avoid

- **Overclaiming**: Stating `[INF]` as fact
- **Under-scoring**: Marking a direct competitor as "watch list"
- **Missing context**: Ignoring regional or segment differences
- **No handoff**: Leaving the analysis without next steps
- **Perfectionism**: Waiting for complete data instead of working with what's available

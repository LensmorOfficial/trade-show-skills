# Example: Industrial IoT Vendor Scoring Hannover Messe 2026

## Scenario

You sell industrial IoT sensor software to plant managers and operations directors at European mid-market manufacturers (200–2,000 employees). You are deciding whether to commit a €45K booth budget to Hannover Messe 2026.

## Step 1: Resolve Event ID

```bash
curl -X GET "https://platform.lensmor.com/external/events/list?query=Hannover+Messe+2026" \
  -H "Authorization: Bearer uak_your_api_key"
```

Response (abbreviated):

```json
{
  "items": [
    {
      "id": "evt_hannovermesse_2026",
      "name": "Hannover Messe 2026",
      "dates": "April 20–24, 2026",
      "location": "Hannover, Germany"
    }
  ]
}
```

Event ID confirmed: `evt_hannovermesse_2026`

## Step 2: Call Fit-Score

```bash
curl -X POST https://platform.lensmor.com/external/events/fit-score \
  -H "Authorization: Bearer uak_your_api_key" \
  -H "Content-Type: application/json" \
  -d '{
    "event_id": "evt_hannovermesse_2026"
  }'
```

## API Response

```json
{
  "event": {
    "id": "evt_hannovermesse_2026",
    "name": "Hannover Messe 2026",
    "dates": "April 20–24, 2026",
    "location": "Hannover, Germany",
    "website": "https://www.hannovermesse.de"
  },
  "score": 82,
  "recommendation": "Strong fit for exhibiting. High concentration of industrial automation and manufacturing technology buyers. ICP profile aligns closely with Halls 9 and 11 visitor demographics. Competitive density is moderate, indicating active market demand without overcrowding. Recommend exhibiting.",
  "breakdown": {
    "icp_alignment": 88,
    "audience_volume": 79,
    "competitive_density": 74,
    "geo_reach": 91,
    "content_relevance": 78
  }
}
```

## Formatted Score Card

```markdown
## Event Fit Score — Hannover Messe 2026

| Dimension | Score |
|-----------|-------|
| Overall Fit | **82 / 100** |
| ICP Alignment | 88 |
| Audience Volume | 79 |
| Competitive Density | 74 |
| Geographic Reach | 91 |
| Content Relevance | 78 |

**Decision band**: Priority 1 — Exhibit

**Recommendation**: Strong fit for exhibiting. High concentration of industrial automation and manufacturing technology buyers. ICP profile aligns closely with Halls 9 and 11 visitor demographics. Competitive density is moderate, indicating active market demand without overcrowding. Recommend exhibiting.

### Dimension Notes
- **ICP Alignment (88)**: Excellent — plant managers and ops directors are core Hannover Messe attendees
- **Audience Volume (79)**: Large show (200K+ visitors); even a small conversion rate represents significant pipeline
- **Competitive Density (74)**: Moderate competitor presence — stand-out messaging needed; industrial IoT is a contested category here
- **Geographic Reach (91)**: Near-perfect match — European manufacturer concentration is highest in DACH, Benelux, and Nordics
- **Content Relevance (78)**: Strong — "Industry 4.0" and "Smart Factory" are primary show themes that align with product story
```

## Next Steps

- Score ≥ 80: Move forward with exhibiting
- Use `lensmor-recommendations` with `event_id: evt_hannovermesse_2026` to get AI-ranked ICP exhibitors for pre-show prospecting
- Use `trade-show-budget-planner` to model the €45K booth investment against expected pipeline

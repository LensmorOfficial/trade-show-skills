# GitHub Growth Operating Guide

This guide keeps repository growth measurable and tied to useful adoption rather than stars alone.

## Growth Funnel

Track the repository as a simple funnel:

1. **Discovery** — unique visitors and external referrers
2. **Interest** — stars, README depth, and ClawHub page visits
3. **Adoption** — clones and skill installs
4. **Product intent** — clicks to Lensmor signup, API docs, or demo booking
5. **Community** — useful issues, pull requests, and repeat contributors

Clones are a directional adoption signal, not a count of verified users. Automated systems can clone repositories too.

## Weekly Snapshot

GitHub traffic endpoints expose a rolling 14-day window. Capture the numbers weekly so the history is not lost:

```bash
bash scripts/github-growth-report.sh
```

The report includes:

- Views and unique visitors
- Clones and unique cloners
- Stars and forks
- Top referring sites

Keep raw traffic exports outside the public repository unless there is a deliberate reason to publish them.

## Conversion Tracking

Repository links use explicit UTM parameters:

| Destination | Campaign purpose |
|-------------|------------------|
| `app.lensmor.com/signup` | Product signup intent |
| `api.lensmor.com` | Developer intent |
| Calendly | Sales or partnership intent |
| `clawhub.ai` | Skill installation intent |

Review GitHub traffic and website analytics together. A star without downstream use is awareness; a qualified click or install is adoption.

## Monthly Release Cadence

For each meaningful release:

1. Update `CHANGELOG.md`
2. Run `bash scripts/validate-repo.sh`
3. Verify README links and install commands
4. Publish a GitHub Release with concise notes
5. Share one concrete prompt and output pattern externally
6. Capture traffic and conversion baselines before and two weeks after launch

Prefer a smaller, useful monthly release over frequent cosmetic commits.

## Suggested Scorecard

| Metric | Why it matters |
|--------|----------------|
| Unique visitors | Reach into the repository |
| External referrers | Distribution beyond GitHub |
| Stars per unique visitor | README and positioning resonance |
| Unique clones | Directional adoption signal |
| Signup/API/demo clicks | Product intent |
| External issues and PRs | Community participation |

Set targets after two complete weekly snapshots. Avoid setting goals from a single day or launch spike.

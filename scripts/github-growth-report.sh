#!/usr/bin/env bash
set -euo pipefail

REPOSITORY="${1:-LensmorOfficial/trade-show-skills}"

command -v gh >/dev/null 2>&1 || {
  echo "gh is required: https://cli.github.com/" >&2
  exit 1
}

command -v jq >/dev/null 2>&1 || {
  echo "jq is required: https://jqlang.github.io/jq/" >&2
  exit 1
}

gh auth status >/dev/null 2>&1 || {
  echo "GitHub CLI is not authenticated. Run: gh auth login" >&2
  exit 1
}

repo_json="$(gh api "repos/${REPOSITORY}")"
views_json="$(gh api "repos/${REPOSITORY}/traffic/views")"
clones_json="$(gh api "repos/${REPOSITORY}/traffic/clones")"
referrers_json="$(gh api "repos/${REPOSITORY}/traffic/popular/referrers")"

captured_at="$(date -u +%Y-%m-%dT%H:%M:%SZ)"

jq -n \
  --arg captured_at "$captured_at" \
  --arg repository "$REPOSITORY" \
  --argjson repo "$repo_json" \
  --argjson views "$views_json" \
  --argjson clones "$clones_json" \
  --argjson referrers "$referrers_json" \
  '{
    captured_at: $captured_at,
    repository: $repository,
    rolling_window_days: 14,
    views: $views.count,
    unique_visitors: $views.uniques,
    clones: $clones.count,
    unique_cloners: $clones.uniques,
    stars: $repo.stargazers_count,
    forks: $repo.forks_count,
    top_referrers: $referrers
  }'

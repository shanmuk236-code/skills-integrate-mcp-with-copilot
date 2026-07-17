#!/usr/bin/env bash
set -euo pipefail

# Usage:
# export GITHUB_TOKEN="ghp_xxx"  # set locally, never paste tokens in chat
# ./scripts/create_issues_from_drafts.sh
# Optional env overrides: OWNER, REPO, ISSUES_DIR

OWNER="${OWNER:-shanmuk236-code}"
REPO="${REPO:-skills-integrate-mcp-with-copilot}"
ISSUES_DIR="${ISSUES_DIR:-.github/ISSUES}"

if [[ -z "${GITHUB_TOKEN:-}" ]]; then
  echo "Error: GITHUB_TOKEN is not set. Export your PAT locally and retry."
  exit 1
fi

shopt -s nullglob
files=("$ISSUES_DIR"/*.md)
if [[ ${#files[@]} -eq 0 ]]; then
  echo "No draft issue files found in $ISSUES_DIR"
  exit 0
fi

for f in "${files[@]}"; do
  echo "Processing $f"
  title=$(sed -n '1s/^Title: //p' "$f" | sed -e 's/[\r\n]$//')
  if [[ -z "$title" ]]; then
    echo "  Skipping $f — missing Title line"
    continue
  fi

  # Body is the rest of the file (after the first line)
  body=$(sed '1d' "$f")

  payload=$(python3 - <<PY
import json,sys
title=sys.argv[1]
body=sys.stdin.read()
print(json.dumps({"title": title, "body": body, "labels": ["enhancement"]}))
PY
  "$title" <<<"$body")

  echo "  Creating issue: $title"
  resp=$(curl -sS -X POST \
    -H "Authorization: token $GITHUB_TOKEN" \
    -H "Accept: application/vnd.github+json" \
    -H "Content-Type: application/json" \
    -d "$payload" \
    "https://api.github.com/repos/$OWNER/$REPO/issues") || true

  url=$(python3 - <<PY
import sys,json
try:
  d=json.load(sys.stdin)
  print(d.get('html_url',''))
except Exception:
  print('')
PY
  <<<"$resp")

  if [[ -n "$url" ]]; then
    echo "  Created: $url"
  else
    echo "  Failed to create issue for $title"
    echo "  Response:"
    echo "$resp"
  fi
done

echo "Done."

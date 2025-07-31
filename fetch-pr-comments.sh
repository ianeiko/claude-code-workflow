#!/bin/bash

# Script to fetch PR review comments using gh CLI and output as markdown
# Usage: ./fetch-pr-comments.sh <pr-id>

set -e

PR_ID="$1"

if [ -z "$PR_ID" ]; then
    echo "Usage: $0 <pr-id>"
    echo "Example: $0 123"
    exit 1
fi

OUTPUT_FILE=".claude/tasks/pr-comments-${PR_ID}.md"

echo "Fetching PR review comments for PR #${PR_ID}..."

# Create output directory if it doesn't exist
mkdir -p .claude/tasks

# Fetch PR details
PR_TITLE=$(gh pr view "$PR_ID" --json title -q .title)
PR_URL=$(gh pr view "$PR_ID" --json url -q .url)
REPO=$(gh repo view --json nameWithOwner -q .nameWithOwner)

# Start markdown file
cat > "$OUTPUT_FILE" << EOF
# PR Review Comments - #${PR_ID}

---

EOF

# Fetch review comments (inline comments on code)
echo "## Review Comments" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

gh pr view "$PR_ID" --repo "$REPO" --json reviewRequests,reviews --jq '
.reviews | sort_by(.submittedAt) | reverse | .[0] | select(.state == "COMMENTED" or .state == "CHANGES_REQUESTED" or .state == "APPROVED") |
{
  author: .author.login,
  state: .state,
  body: .body,
  submittedAt: .submittedAt
}' | jq -r '
"### Review by @" + .author + " (" + .state + ")"
+ "\n**Date:** " + .submittedAt
+ "\n\n" + (.body // "No general comment")
+ "\n"
' >> "$OUTPUT_FILE"

# Fetch inline comments on specific lines
echo "" >> "$OUTPUT_FILE"
echo "## Inline Comments" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

gh api "repos/${REPO}/pulls/${PR_ID}/comments" --jq '.[] |
{
  author: .user.login,
  path: .path,
  line: .line,
  body: .body,
  created_at: .created_at
}' | jq -r '
"### " + .path + ":" + (.line | tostring)
+ "\n**Author:** @" + .author
+ "\n**Date:** " + .created_at
+ "\n\n```"
+ "\n" + .body
+ "\n```"
+ "\n"
' >> "$OUTPUT_FILE"

echo "PR review comments saved to: $OUTPUT_FILE"
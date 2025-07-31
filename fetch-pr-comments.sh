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

echo "Fetching PR review comments for PR #${PR_ID}..."

# Create output directory if it doesn't exist
mkdir -p .claude/tasks

# Fetch PR details
PR_TITLE=$(gh pr view "$PR_ID" --json title -q .title)
PR_URL=$(gh pr view "$PR_ID" --json url -q .url)
REPO=$(gh repo view --json nameWithOwner -q .nameWithOwner)

# Get the latest review ID 
REVIEW_ID=$(gh pr view "$PR_ID" --repo "$REPO" --json reviews --jq '.reviews | sort_by(.submittedAt) | reverse | .[0] | .id')

# Get the latest review's submission date to match with comments
LATEST_REVIEW_DATE=$(gh pr view "$PR_ID" --repo "$REPO" --json reviews --jq '.reviews | sort_by(.submittedAt) | reverse | .[0] | .submittedAt')

if [ -z "$REVIEW_ID" ]; then
    echo "No reviews found for PR #${PR_ID}"
    exit 1
fi

OUTPUT_FILE=".claude/tasks/pr-comments-${REVIEW_ID}.md"

echo "Using review ID: ${REVIEW_ID} (Date: ${LATEST_REVIEW_DATE})"

# Start markdown file
cat > "$OUTPUT_FILE" << EOF
# PR Review Comments - #${PR_ID} (Review: ${REVIEW_ID})

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

# Fetch ALL inline comments (not just from latest review)
echo "" >> "$OUTPUT_FILE"
echo "## Inline Comments" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# Get all comments and find the one that's closest to but before the latest review date
# This handles the case where inline comments are created slightly before the review submission
NUMERIC_REVIEW_ID=$(gh api "repos/${REPO}/pulls/${PR_ID}/comments" | jq --arg latest_date "$LATEST_REVIEW_DATE" '
  [.[] | select(.created_at <= $latest_date)] | sort_by(.created_at) | reverse | .[0].pull_request_review_id
')

if [ "$NUMERIC_REVIEW_ID" = "null" ] || [ -z "$NUMERIC_REVIEW_ID" ]; then
    echo "No inline comments found for the latest review." >> "$OUTPUT_FILE"
else
    echo "Found comments from review ID: $NUMERIC_REVIEW_ID" >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"
    
    gh api "repos/${REPO}/pulls/${PR_ID}/comments" | jq --arg review_id "$NUMERIC_REVIEW_ID" '.[] |
    select(.pull_request_review_id == ($review_id | tonumber)) |
    {
      author: .user.login,
      path: .path,
      line: (.line // .original_line // "unknown"),
      body: .body,
      created_at: .created_at
    }' | jq -r '
    "### " + .path + ":" + ((.line) | tostring)
    + "\n**Author:** @" + .author
    + "\n**Date:** " + .created_at
    + "\n\n```"
    + "\n" + .body
    + "\n```"
    + "\n"
    ' >> "$OUTPUT_FILE"
fi

echo "PR review comments saved to: $OUTPUT_FILE"
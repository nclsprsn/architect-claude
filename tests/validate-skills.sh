#!/usr/bin/env bash
set -euo pipefail

ERRORS=0
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

pass() { echo "  ✓ $1"; }
fail() { echo "  ✗ $1"; ERRORS=$((ERRORS + 1)); }

SKILLS=(
  "architecture-review"
  "gap-analysis"
  "risk-radar"
  "data-architecture"
  "integration-architecture"
  "data-pipeline-review"
  "migration-plan"
  "trade-off-analysis"
  "adr-generator"
  "executive-summary"
  "stakeholder-communication"
  "new-arch-doc"
)

POSTURES=(
  "Working Backwards"
  "Innovation Pressure"
  "Three Horizons"
  "Commoditisation Pressure"
  "Bold Needs Evidence"
  "Second-Order Effects"
  "Highest Standards"
)

echo "=== Validating skill files ==="

for skill in "${SKILLS[@]}"; do
  echo ""
  echo "--- $skill ---"
  file="$REPO_ROOT/skills/$skill/SKILL.md"

  if [[ ! -f "$file" ]]; then
    fail "SKILL.md missing"
    continue
  fi
  pass "SKILL.md exists"

  # Frontmatter: file must start with ---
  if head -1 "$file" | grep -q "^---"; then
    pass "frontmatter present"
  else
    fail "missing YAML frontmatter (file must start with ---)"
  fi

  # Required sections
  for section in "## Core Mindset" "## TOGAF Detection" "## Standards Bar"; do
    if grep -q "^${section}" "$file"; then
      pass "section: $section"
    else
      fail "missing section: $section"
    fi
  done

  # All 7 Core Mindset postures
  for posture in "${POSTURES[@]}"; do
    if grep -q "$posture" "$file"; then
      pass "posture: $posture"
    else
      fail "missing posture: $posture"
    fi
  done

  # Command wrapper
  cmd="$REPO_ROOT/commands/$skill.md"
  if [[ -f "$cmd" ]]; then
    pass "command wrapper exists"
  else
    fail "command wrapper missing: commands/$skill.md"
  fi

  # Command must reference the skill name
  if grep -q "$skill" "$cmd" 2>/dev/null; then
    pass "command references skill"
  else
    fail "command does not reference skill name"
  fi
done

echo ""
echo "=== Validating package.json ==="

pkg="$REPO_ROOT/package.json"
if [[ ! -f "$pkg" ]]; then
  fail "package.json missing"
else
  if node -e "JSON.parse(require('fs').readFileSync('$pkg','utf8'))" 2>/dev/null; then
    pass "package.json is valid JSON"
  else
    fail "package.json is invalid JSON"
  fi

  version=$(node -e "console.log(JSON.parse(require('fs').readFileSync('$pkg','utf8')).version)" 2>/dev/null || echo "")
  if [[ -n "$version" ]]; then
    pass "package.json has version: $version"
  else
    fail "package.json missing version field"
  fi
fi

echo ""
echo "=== Validating CLAUDE.md ==="

claude_md="$REPO_ROOT/CLAUDE.md"
if [[ ! -f "$claude_md" ]]; then
  fail "CLAUDE.md missing"
else
  pass "CLAUDE.md exists"
  for skill in "${SKILLS[@]}"; do
    if grep -q "$skill" "$claude_md"; then
      pass "CLAUDE.md references: $skill"
    else
      fail "CLAUDE.md does not reference: $skill"
    fi
  done
fi

echo ""

if [[ $ERRORS -eq 0 ]]; then
  echo "All checks passed."
  exit 0
else
  echo "$ERRORS check(s) failed."
  exit 1
fi

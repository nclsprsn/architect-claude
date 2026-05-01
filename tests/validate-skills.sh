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
  "capability-assessment"
  "technology-architecture"
  "architect-router"
  "preliminary"
  "architecture-vision"
  "requirements-management"
  "implementation-governance"
  "change-management"
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

  # --- Frontmatter ---

  # File must start with ---
  if head -1 "$file" | grep -q "^---"; then
    pass "frontmatter present"
  else
    fail "missing YAML frontmatter (file must start with ---)"
  fi

  # Frontmatter must have name: and description: fields
  frontmatter=$(sed -n '2,/^---$/p' "$file")
  if echo "$frontmatter" | grep -q "^name:"; then
    pass "frontmatter: name field"
  else
    fail "frontmatter missing name: field"
  fi

  if echo "$frontmatter" | grep -q "^description:"; then
    pass "frontmatter: description field"
  else
    fail "frontmatter missing description: field"
  fi

  # --- Required sections ---

  for section in "## Core Mindset" "## TOGAF Detection" "## Information to Gather" "## Output Discipline" "## Standards Bar"; do
    if grep -q "^${section}" "$file"; then
      pass "section: $section"
    else
      fail "missing section: $section"
    fi
  done

  # Artifact Selection Guide required for all skills except new-arch-doc (delegates to phase files)
  if [[ "$skill" != "new-arch-doc" ]]; then
    if grep -q "^## Artifact Selection Guide" "$file"; then
      pass "section: ## Artifact Selection Guide"
    else
      fail "missing section: ## Artifact Selection Guide"
    fi
  fi

  # --- TOGAF Detection branching ---

  for branch in "TOGAF mode" "Framework-agnostic mode"; do
    if grep -q "$branch" "$file"; then
      pass "togaf detection: $branch"
    else
      fail "togaf detection: missing '$branch'"
    fi
  done

  # --- Output Discipline: four rules ---

  for rule in "Confidence marker" "Reversibility tag" "Named owner" "Broad Responsibility"; do
    if grep -q "$rule" "$file"; then
      pass "output discipline: $rule"
    else
      fail "missing output discipline rule: $rule"
    fi
  done

  # Confidence levels: all three must be documented
  for level in "[proven]" "[informed estimate]" "[working hypothesis]"; do
    if grep -qF "$level" "$file"; then
      pass "confidence level: $level"
    else
      fail "missing confidence level: $level"
    fi
  done

  # Reversibility vocabulary: both labels must appear
  for label in "one-way door" "two-way door"; do
    if grep -q "$label" "$file"; then
      pass "reversibility: $label"
    else
      fail "missing reversibility label: $label"
    fi
  done

  # --- Information to Gather: batch questions discipline ---

  if grep -q "Batch all missing questions into a single message" "$file"; then
    pass "information: batch questions rule"
  else
    fail "information: missing batch questions rule"
  fi

  # --- Core Mindset postures ---

  for posture in "${POSTURES[@]}"; do
    if grep -q "$posture" "$file"; then
      pass "posture: $posture"
    else
      fail "missing posture: $posture"
    fi
  done

  # --- Standards Bar quality question ---

  if grep -q "Does this meet the bar" "$file"; then
    pass "standards bar: quality question present"
  else
    fail "standards bar: missing quality question"
  fi

  # --- Command wrapper ---

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

  # Command wrapper must have description field
  if grep -q "^description:" "$cmd" 2>/dev/null; then
    pass "command: description field"
  else
    fail "command: missing description field"
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

  name=$(node -e "console.log(JSON.parse(require('fs').readFileSync('$pkg','utf8')).name)" 2>/dev/null || echo "")
  if [[ -n "$name" ]]; then
    pass "package.json has name: $name"
  else
    fail "package.json missing name field"
  fi
fi

echo ""
echo "=== Validating plugin.json ==="

plugin="$REPO_ROOT/.claude-plugin/plugin.json"
if [[ ! -f "$plugin" ]]; then
  fail "plugin.json missing"
else
  if node -e "JSON.parse(require('fs').readFileSync('$plugin','utf8'))" 2>/dev/null; then
    pass "plugin.json is valid JSON"
  else
    fail "plugin.json is invalid JSON"
  fi

  for field in name description version; do
    val=$(node -e "const f=JSON.parse(require('fs').readFileSync('$plugin','utf8')).$field; console.log(f||'')" 2>/dev/null || echo "")
    if [[ -n "$val" ]]; then
      pass "plugin.json has $field"
    else
      fail "plugin.json missing $field field"
    fi
  done
fi

echo ""
echo "=== Validating repository files ==="

for reqfile in "README.md" "CHANGELOG.md" "CLAUDE.md"; do
  if [[ -f "$REPO_ROOT/$reqfile" ]]; then
    pass "$reqfile exists"
  else
    fail "$reqfile missing"
  fi
done

echo ""
echo "=== Validating CLAUDE.md skill references ==="

claude_md="$REPO_ROOT/CLAUDE.md"
if [[ -f "$claude_md" ]]; then
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

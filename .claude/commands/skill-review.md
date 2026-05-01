---
description: Audit an existing skill against the full validator schema and quality bar — structural compliance, TOGAF accuracy, output discipline completeness, and content depth.
argument-hint: "<skill-name> — kebab-case, e.g. data-architecture"
---

You are auditing an existing skill in the architect-claude-plugin. Your job is two-stage: first confirm structural compliance (everything `validate-skills.sh` checks), then assess content quality (the things the script cannot check).

## Step 1 — Identify the skill

If a skill name was provided as an argument, use it. Otherwise list the available skills from `tests/validate-skills.sh` and ask which one to review.

Read `skills/<name>/SKILL.md` and `commands/<name>.md` in full before making any judgement.

## Step 2 — Structural compliance audit

Run through every check in `tests/validate-skills.sh` manually. Report pass ✓ or fail ✗ for each item.

### Frontmatter
- [ ] File starts with `---`
- [ ] `name:` field present
- [ ] `description:` field present

### Required sections (exact heading match)
- [ ] `## Core Mindset`
- [ ] `## TOGAF Detection`
- [ ] `## Information to Gather`
- [ ] `## Output Discipline`
- [ ] `## Standards Bar`
- [ ] `## Artifact Selection Guide` *(skip for `new-arch-doc`)*

### TOGAF Detection branches
- [ ] Contains "TOGAF mode"
- [ ] Contains "Framework-agnostic mode"

### Output Discipline rules
- [ ] "Confidence marker"
- [ ] "Reversibility tag"
- [ ] "Named owner"
- [ ] "Broad Responsibility"

### Confidence levels
- [ ] `[proven]`
- [ ] `[informed estimate]`
- [ ] `[working hypothesis]`

### Reversibility vocabulary
- [ ] "one-way door"
- [ ] "two-way door"

### Information to Gather discipline
- [ ] "Batch all missing questions into a single message"

### Core Mindset postures (all seven required)
- [ ] "Working Backwards"
- [ ] "Innovation Pressure"
- [ ] "Three Horizons"
- [ ] "Commoditisation Pressure"
- [ ] "Bold Needs Evidence"
- [ ] "Second-Order Effects"
- [ ] "Highest Standards"

### Standards Bar
- [ ] "Does this meet the bar"

### Command wrapper
- [ ] `commands/<name>.md` exists
- [ ] File references the skill name
- [ ] `description:` field present

Then confirm by running: `bash tests/validate-skills.sh 2>&1 | grep -A 50 "^--- <name> ---"`

## Step 3 — Content quality audit

These are the things the script cannot check. Assess each honestly.

### TOGAF accuracy
- Do artifact names in the Artifact Selection Guide match official TOGAF names for the relevant ADM phase(s)?
- Are catalog, matrix, and diagram names taken from the TOGAF standard (not generic descriptions)?
- Does the TOGAF Detection section correctly describe what TOGAF mode changes vs framework-agnostic mode?
- For ADR-adjacent skills: does the skill correctly distinguish ADRs (industry practice) from TOGAF's Architecture Principles, Architecture Contracts, and Governance Logs?

### Architect Mindset depth
- Does `## Core Mindset` give domain-specific guidance for each posture, or is it generic filler?
- Does `## Information to Gather` use multiple-choice questions where options are meaningful? Are questions specific to this domain?
- Does `## Assessment Process` give a concrete step-by-step that a reviewer could follow without needing to invent their own method?

### Output Format completeness
- Does the output format include a Verdict line?
- Does it include a `> [!abstract]` callout for non-technical stakeholders?
- Does it end with a **Broad Responsibility** section and a **Standards Bar** question?
- Are Fix List columns complete (severity, finding, fix, owner, reversibility, review trigger)?
- Do all tables use `proven / informed estimate / working hypothesis` in confidence columns?

### Artifact Selection Guide
- Are diagrams specific to this domain (not just generic flowcharts)?
- Is there a Fix list row in the Tables section?
- Are Mermaid rules documented (line breaks, edge labels)?
- Are Obsidian callout types used appropriately (`warning` / `important` / `tip` / `info`)?

### Anti-pattern or checklist section (if present)
- Is it specific enough to be actionable, or is it generic advice that applies to any domain?
- Does each item name the risk if the pattern is present?

## Step 4 — Report

Produce a structured report:

```
## Structural Compliance

✓ N checks passing
✗ N checks failing:
  - [failing check]: [what is missing and where to add it]

## Content Quality

### TOGAF Accuracy: Pass / Needs Work / Fail
[Finding per sub-item]

### Architect Mindset Depth: Pass / Needs Work / Fail
[Finding per sub-item]

### Output Format Completeness: Pass / Needs Work / Fail
[Finding per sub-item]

### Artifact Selection Guide: Pass / Needs Work / Fail
[Finding per sub-item]

## Recommended Fixes

| Priority | Item | What to change |
|----------|------|----------------|
| Critical | [item] | [specific fix] |
| High     | [item] | [specific fix] |
| Medium   | [item] | [specific fix] |
```

## Step 5 — Fix

If the user confirms, apply all fixes and re-run `bash tests/validate-skills.sh` to confirm zero failures before reporting done.

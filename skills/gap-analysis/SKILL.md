---
name: gap-analysis
description: Produce a structured gap analysis between baseline and target state. Scores gaps by domain, priority, and effort. Sequences into H1/H2/H3 roadmap. TOGAF-aware by default, framework-agnostic fallback.
---

# Gap Analysis

You are producing a structured gap analysis. Your job is to make the distance between current state and target state concrete, prioritised, and actionable — not a vague list of "things to improve."

## Core Mindset

**Working Backwards:** Start from the target state and reason backwards. What must be true for the target to be achieved? What is currently false? The gap is the delta between what must be true and what is currently true.

**Innovation Pressure:** Before finalising the gap table, ask: is the target state ambitious enough? Surface one disruptive alternative — a target that challenges whether the current direction is bold enough, or whether an emerging approach makes the planned target obsolete before it is reached.

**Three Horizons:** Sequence every gap into H1 (now → 12 months), H2 (12–24 months), or H3 (24+ months). A gap table with no sequencing is an observation, not a plan.

**Commoditisation Pressure:** Flag any gap where the closure plan involves custom-building something that is drifting toward commodity. Name the commodity alternative and the cost delta.

**Bold Needs Evidence:** Every priority and effort score must be justified in one line. "High priority" without a rationale is not evidence.

**Second-Order Effects:** Name at least one second-order effect — a downstream consequence of closing the highest-priority gap that affects a component or team outside the immediate scope.

**Highest Standards:** Before presenting output, ask: "Does this meet the bar I would set for a client deliverable?" If no, iterate.

## TOGAF Detection

TOGAF signals present → **TOGAF mode**: align gaps to ADM phase B/C/D structure and label with building block types.

No TOGAF signals → **Framework-agnostic mode**: domain-neutral gap table with roadmap sequencing.

## Output Discipline

Every output MUST satisfy the four rules below. They operationalise the Andes accountability principles (Bias for Action, Earn Trust, Have Backbone, Deliver Results, Broad Responsibility). Skip a rule only by writing `N/A — [reason]` so the omission is visible.

1. **Confidence marker** on every claim, score, and recommendation:
   - `[proven]` — measured at scale or supported by a published benchmark
   - `[informed estimate]` — extrapolated from analogous case, reference architecture, or first-principles reasoning
   - `[working hypothesis]` — directional only; validate with a spike, PoC, or external evidence before commitment
2. **Reversibility tag** on every decision and recommendation: **one-way door** (slow, deliberate, expensive to undo) or **two-way door** (cheap to undo, move fast and learn fast). Defaults are not neutral — name the door.
3. **Named owner + review trigger** on every recommendation, risk, gap, and decision. Owner is a human role (not a team). Review trigger is an evidence threshold or event, not just a calendar date. "Re-evaluate Q3" fails; "Re-evaluate when monthly active users exceed 50k or vendor X raises prices" passes.
4. **Broad Responsibility line** — one line on the societal, environmental, regulatory, or customers-of-customers implication. Skip with explicit `N/A — [reason]` only when no plausible downstream impact exists. Never silent.

## Analysis Process

1. Identify the domains to analyse — infer from context or ask: capabilities, processes, data, application, technology, organisation.
2. For each domain: describe baseline state, target state, the gap (what must change), priority (H/M/L), effort (H/M/L), and phase (H1/H2/H3).
3. Score priority based on business impact of the gap remaining open.
4. Score effort based on complexity, team capability, and dependency count.
5. Flag inter-domain dependencies: which gaps must close before others can start?
6. Sequence into a roadmap using dependency order + priority.
7. State the primary assumption underlying the sequencing — what breaks if it is wrong?
8. Surface one disruptive alternative to the target state.
9. Name one second-order effect of closing the highest-priority gap.

## Output Format

```
## Gap Analysis Summary
[One paragraph: how big is the gap overall? What is the critical path? Working backwards from the target — what must happen first?]

## Gap Table
| Domain | Baseline | Target | Gap | Priority | Effort | Phase | Confidence | Owner (role) | Review trigger |
|--------|----------|--------|-----|----------|--------|-------|------------|--------------|----------------|
| [domain] | [current state] | [target state] | [what must change] | H/M/L | H/M/L | H1/H2/H3 | proven / informed estimate / working hypothesis | [role accountable for closing the gap] | [evidence threshold or event] |

## Dependency Map
[Which gaps must close before others can start — numbered list or short prose. Flag circular dependencies if present.]

## Sequenced Roadmap
**H1 (now → 12 months):** [gaps to close first, with rationale] — Sponsor: [executive role committing budget and air cover]
**H2 (12–24 months):** [gaps that follow, with H1 dependencies named] — Sponsor: [role]
**H3 (24+ months):** [gaps that require H2 foundations] — Sponsor: [role]

## Quick Wins (H1)
[Top 2–3 gaps closeable immediately with low risk, no blocking dependencies, and visible business value. Bias for Action — ship these in the first quarter to build momentum and earn trust.]
| Quick win | Owner (role) | Reversibility | Target | Confidence |
|-----------|--------------|---------------|--------|------------|
| [gap] | [role] | one-way / two-way | [next quarter / 90 days] | proven / informed estimate / working hypothesis |

## Critical Path Risk
**Primary assumption:** [stated explicitly]
**Failure scenario:** [what breaks and how badly if this assumption is wrong]

## Disruptive Alternative
[One option that challenges whether the target state is ambitious enough, or whether an emerging approach makes the planned target obsolete]

## TOGAF Building Block Mapping *(TOGAF mode only)*
[Which gaps map to which ADM phase (B/C/D) and building block type]

## Second-Order Effect
[One non-obvious downstream consequence of closing the highest-priority gap]

## Broad Responsibility
[One line: societal, environmental, regulatory, or customers-of-customers implication of the gap closure plan — e.g., GDPR/AI Act remediation timeline, sustainability impact of the migration, downstream client experience. `N/A — [reason]` if none applies.]

## Standards Bar
Does this meet the bar for a client deliverable? [Yes / No — reason]
```

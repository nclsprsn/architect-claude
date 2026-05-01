---
name: trade-off-analysis
description: Evaluate 2-3 architectural options against quality attributes and produce a clear recommendation with ADR-ready output. Works backwards from business outcome. Surfaces disruptive alternatives. TOGAF-aware by default, framework-agnostic fallback.
---

# Trade-off Analysis

You are producing a structured trade-off analysis that ends in a clear recommendation. Your job is to make the decision easier — not to present options as equals.

## Core Mindset

**Working Backwards:** Start by restating the customer or business outcome this decision serves. Every option is scored against how well it delivers that outcome — not just how technically elegant it is.

**Innovation Pressure:** Before scoring the presented options, ask whether the problem has been framed correctly. Surface one option outside the presented solution space that works backwards from the outcome.

**Three Horizons:** Label each option with its natural horizon (H1 / H2 / H3). A team solving an H3 problem with three H1 options has not looked far enough.

**Commoditisation Pressure:** For each option, apply the commoditisation curve. An option that custom-builds a component becoming a product is a red flag.

**Bold Needs Evidence:** Every score in the comparison table must have a rationale. "High resilience" without an explanation is not evidence.

**Second-Order Effects:** For the recommended option, name one second-order effect — a downstream impact on a system or team outside the immediate scope.

**Highest Standards:** Before presenting output, ask: "Does this meet the bar I would set for a client deliverable?" If no, iterate.

## TOGAF Detection

TOGAF signals in context → **TOGAF mode**: format output as a full ADR (Context / Decision / Consequences / Alternatives Considered).

No TOGAF signals → **Framework-agnostic mode**: recommendation memo with comparison table.

## Analysis Process

1. Restate the decision context: what problem is being solved, for whom, under what constraints.
2. State the business outcome being worked backwards from.
3. Select the 3–5 quality attributes most relevant to this decision.
4. Score each option: High / Medium / Low with a one-line rationale per score.
5. Name the horizon of each option (H1 / H2 / H3).
6. Name the recommended option clearly. If genuinely a tie, name the tiebreaker criterion — "it depends" without a tiebreaker is not a recommendation.
7. Surface the disruptive alternative outside the presented options.
8. Name the second-order effect of the recommended option.
9. Write the ADR decision statement (TOGAF mode) or recommendation memo close (agnostic mode).

## Output Format (TOGAF mode)

```
## Context
[Decision context: problem, constraints, drivers — one paragraph]

## Business Outcome
[What customer or business result this decision serves — working backwards]

## Options Considered
| Option | [Attr 1] | [Attr 2] | [Attr 3] | Horizon | Notes |
|--------|----------|----------|----------|---------|-------|
| Option A | H/M/L — rationale | ... | ... | H1/H2/H3 | ... |
| Option B | ... | ... | ... | ... | ... |

## Recommendation
**[Option name]** — [one-sentence rationale anchored in the business outcome]

## Decision
[ADR-ready statement: "We will adopt [option] because [reason]. This decision is [reversible / irreversible] under the following conditions: ...]

## Consequences
**Positive:** ...
**Negative:** ...
**Risks:** ...

## Alternatives Considered
[Why each non-recommended option was rejected — one line each]

## Disruptive Alternative
[One option outside the original solution space, working backwards from the outcome]

## Horizon
**Problem horizon:** H1 / H2 / H3
**Recommended option horizon:** H1 / H2 / H3
[Flag if mismatched]

## Second-Order Effect
[One non-obvious downstream consequence of the recommended decision]
```

## Output Format (framework-agnostic mode)

```
## Decision Context
[Problem, constraints, drivers]

## Business Outcome
[What this decision serves — working backwards]

## Options Compared
| Option | [Top 3–5 quality attributes] | Horizon |
|--------|------------------------------|---------|

## Recommendation
**[Option]** — [rationale anchored in business outcome]

## Disruptive Alternative
[Outside the current solution space]

## Second-Order Effect
[Downstream consequence of the recommendation]

## Standards Bar
Does this meet the bar for a client deliverable? [Yes / No — reason]
```

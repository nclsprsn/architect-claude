---
name: adr-generator
description: Write a clean ADR (Architectural Decision Record) in MADR format from a decision already made or a discussion. Faster than trade-off-analysis — for decisions where the choice is resolved. TOGAF-aware.
---

# ADR Generator

You are writing an Architectural Decision Record for a decision that has already been made. Your job is to create a clean, permanent record that future team members can understand without needing to re-live the original discussion.

## Core Mindset

**Working Backwards:** The ADR must state the business or customer outcome that motivated this decision. A decision record that starts from the technology without naming the business problem it solves is incomplete and will confuse future readers.

**Innovation Pressure:** In the "Options Considered" section, include at least one option that was more ambitious or disruptive than the chosen option — even if it was quickly dismissed. This documents the full solution space that was evaluated and prevents the same conversation from recurring.

**Three Horizons:** Name the horizon of the decision (H1 / H2 / H3). A decision that optimises H1 at the expense of H3 agility is a different risk profile than one that invests H1 effort in H2 foundations. Make it explicit.

**Commoditisation Pressure:** Apply the commoditisation check: is the chosen option building something that is drifting toward commodity? If yes, state the exit trigger — the condition under which this decision should be revisited.

**Bold Needs Evidence:** The rationale must be grounded in evidence: benchmarks, reference architectures, first-principles reasoning, or stated constraints. "We chose X because it felt right" is not a rationale.

**Second-Order Effects:** Name one second-order effect — a downstream consequence of this decision that affects a component or team outside the immediate scope.

**Highest Standards:** Before presenting output, ask: "Does this meet the bar I would set for a client deliverable?" If no, iterate.

## TOGAF Detection

TOGAF signals present → **TOGAF mode**: add ADM phase tag, impacted building blocks, and gap analysis pointer if relevant.

No TOGAF signals → **Framework-agnostic mode**: clean MADR without TOGAF enrichment.

## Output Discipline

Every output MUST satisfy the four rules below. They operationalise the Andes accountability principles (Bias for Action, Earn Trust, Have Backbone, Deliver Results, Broad Responsibility). Skip a rule only by writing `N/A — [reason]` so the omission is visible.

1. **Confidence marker** on every claim, score, and recommendation:
   - `[proven]` — measured at scale or supported by a published benchmark
   - `[informed estimate]` — extrapolated from analogous case, reference architecture, or first-principles reasoning
   - `[working hypothesis]` — directional only; validate with a spike, PoC, or external evidence before commitment
2. **Reversibility tag** on every decision and recommendation: **one-way door** (slow, deliberate, expensive to undo) or **two-way door** (cheap to undo, move fast and learn fast). Defaults are not neutral — name the door.
3. **Named owner + review trigger** on every recommendation, risk, gap, and decision. Owner is a human role (not a team). Review trigger is an evidence threshold or event, not just a calendar date. "Re-evaluate Q3" fails; "Re-evaluate when monthly active users exceed 50k or vendor X raises prices" passes.
4. **Broad Responsibility line** — one line on the societal, environmental, regulatory, or customers-of-customers implication. Skip with explicit `N/A — [reason]` only when no plausible downstream impact exists. Never silent.

## Generation Process

1. Extract from the provided context:
   - The decision that was made (one clear active sentence)
   - The options that were considered (minimum two, including one more ambitious option)
   - The rationale for the chosen option
   - The constraints or drivers that shaped the decision
2. If any of these are missing and cannot be inferred, ask before generating — do not fabricate context.
3. Identify consequences: positive (what this enables), negative (what this constrains or costs), risks introduced.
4. Apply commoditisation check to the chosen option.
5. Name the horizon and second-order effect.
6. Write the ADR in MADR format.

## Output Format

```
# ADR-[NNN or TBD]: [Decision title — short, active, specific]

**Date:** [YYYY-MM-DD]
**Status:** Accepted
**Horizon:** H1 / H2 / H3
**Reversibility:** one-way door / two-way door — [one-line rationale]
**Decision owner (role):** [role accountable for the decision and its review]
**Review trigger:** [evidence threshold or event that mandates revisiting — not a calendar date]
**Confidence:** proven / informed estimate / working hypothesis — [one-line evidence]

## Context
[What is the situation that requires this decision? What constraints and drivers apply? Working backwards: what business or customer outcome does this decision serve?]

## Decision
[The decision that was made — one clear active sentence. "We will adopt X for Y because Z."]

## Options Considered
| Option | Why not chosen |
|--------|---------------|
| [option] | [rationale for rejection — one line] |
| [disruptive option considered] | [rationale — even if dismissed early, name it] |

## Consequences
**Positive:** [what this decision enables]
**Negative:** [what this decision constrains or costs]
**Risks introduced:** [new risks created by this decision]

## Commoditisation Check
[Is the chosen option building something drifting toward commodity? If yes: exit trigger — the condition under which this decision should be revisited.]

## Second-Order Effect
[One non-obvious downstream consequence affecting a component or team outside the immediate scope]

## Broad Responsibility
[One line: societal, environmental, regulatory, or customers-of-customers implication of this decision — e.g., GDPR/AI Act exposure, sustainability footprint, downstream client experience. `N/A — [reason]` if none applies.]

## TOGAF Context *(TOGAF mode only)*
**ADM phase:** A / B / C / D
**Impacted building blocks:** [list]
**Related gap analysis:** [pointer if applicable]

## Standards Bar
Does this meet the bar for a client deliverable? [Yes / No — reason]
```

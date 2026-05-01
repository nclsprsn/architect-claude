---
name: migration-plan
description: Generate a phased migration plan from gap-analysis output or a described current/target state. Sequences work into H1/H2/H3 delivery waves based on dependencies, risk, and business value. Produces a critical path, quick wins, and migration risks. TOGAF Transition Architecture aware.
---

# Migration Plan

You are producing a migration plan. Your job is to turn a gap analysis or a described current-to-target state into a sequenced, dependency-aware delivery roadmap — one that a delivery team can act on and a steerco can approve.

## Core Mindset

**Working Backwards:** Start from the business outcome the migration must deliver and the deadline (or horizon) it must reach. Reason backwards to the sequence of changes required. A migration plan that sequences work by technical convenience rather than business value delivery is the wrong plan.

**Innovation Pressure:** Surface at least one disruptive alternative to the phasing approach — a big-bang migration where the team assumed incremental, a strangler-fig pattern where they assumed a rewrite, a data-first approach where they assumed application-first. Challenge whether the assumed migration pattern is the fastest path to the business outcome.

**Three Horizons:** Every item in the plan is classified as H1 (now → 12 months), H2 (12–24 months), or H3 (24+ months). H1 must deliver visible business value — not just technical foundations that nobody outside the team can see. H2 and H3 items must have explicit triggers that move them forward.

**Commoditisation Pressure:** Apply the commoditisation curve to migration tooling and transition state choices. If the plan includes building a custom migration framework, a bespoke data sync layer, or a hand-rolled feature flag system — challenge it. These are commoditised. The migration should use them, not build them.

**Bold Needs Evidence:** Every effort estimate must have a rationale. "Large effort" without an explanation is not a plan. Name the teams involved, the dependencies that drive the estimate, and the assumption being made. Flag estimates that are guesses as working hypotheses.

**Second-Order Effects:** Name at least one second-order consequence of the sequencing — the team that is blocked while another team completes a prerequisite, the performance degradation in the transition state, the technical debt introduced by the strangler-fig layer that must be cleaned up in H2.

**Highest Standards:** Before presenting output, ask: "Does this meet the bar I would set for a client deliverable?" If no, iterate.

## TOGAF Detection

TOGAF signals present → **TOGAF mode**: structure the roadmap as a TOGAF Transition Architecture — define Transition Architecture states (T1, T2…) between baseline and target, each as a coherent deployable state. Tag each wave to its ADM phase.

No TOGAF signals → **Framework-agnostic mode**: phased delivery roadmap with H1/H2/H3 wave structure, dependency sequencing, and critical path.

## Planning Process

1. Establish the migration context:
   - Source: gap-analysis output, architecture review findings, or described current/target states
   - Constraints: hard deadlines, budget cycles, regulatory timelines, team capacity, parallel delivery streams
   - Migration pattern: incremental (strangler-fig, feature flags) / big-bang / parallel run / phased cutover
2. Identify all migration items — from gap table rows or described changes. For each item:
   - Effort estimate (H/M/L with rationale)
   - Business value delivered (H/M/L — what becomes possible when this item is complete?)
   - Hard dependencies (items that must complete before this one can start)
   - Soft dependencies (items that are better done first but not blocking)
   - Risk level (H/M/L — what is the rollback complexity if this item fails?)
3. Sequence items into delivery waves:
   - Apply dependency order first — no item starts before its hard dependencies are complete
   - Within each wave, prioritise by business value (highest value, lowest risk first)
   - Flag items that unlock large downstream value — these are critical path enablers
4. Identify the critical path: the longest chain of hard dependencies that determines the minimum overall migration duration
5. Flag the top three migration risks: the assumptions that, if wrong, collapse the sequencing
6. Surface H1 quick wins: items that deliver visible business value early, with low risk and no blocking dependencies
7. TOGAF mode: define Transition Architecture states — each wave produces a coherent, deployable state that the organisation can operate in during the migration
8. Name the transition state risk: what is the operational burden of running in a partially-migrated state?

## Output Format

```
## Migration Overview
[One paragraph: overall migration horizon, number of phases, critical path length, the single most important assumption underlying the sequencing]

## Migration Pattern
**Chosen pattern:** [incremental / big-bang / parallel run / phased cutover]
**Rationale:** [why this pattern fits the risk appetite, team capacity, and business constraints]
**Exit from transition state:** [when is the migration complete? what is the definition of done?]

## Phased Delivery Roadmap

### H1 (now → 12 months) — Foundation & Quick Wins
| Item | Effort | Business Value | Hard Dependencies | Risk |
|------|--------|---------------|-------------------|------|
| [item] | H/M/L | H/M/L | [none / item N] | H/M/L |

### H2 (12–24 months) — Core Migration
| Item | Effort | Business Value | Hard Dependencies | Risk |
|------|--------|---------------|-------------------|------|
| [item] | H/M/L | H/M/L | [item N] | H/M/L |

### H3 (24+ months) — Strategic Capabilities
| Item | Effort | Business Value | Hard Dependencies | Risk |
|------|--------|---------------|-------------------|------|
| [item] | H/M/L | H/M/L | [item N] | H/M/L |

## Critical Path
[The chain of hard dependencies that determines the minimum migration duration. Format: Item A → Item B → Item C → ... → done. Estimated duration. What must not slip.]

## Quick Wins
[Top 2–3 H1 items that deliver visible business value early, have no blocking dependencies, and can start immediately. Named owner and target completion quarter if known.]

## Migration Risks
1. **[Assumption]** — [What breaks and how badly if this assumption is wrong] — Mitigation: [one action that reduces the exposure]
2. **[Assumption]** — [What breaks] — Mitigation: [action]
3. **[Assumption]** — [What breaks] — Mitigation: [action]

## Transition State Risk
[What is the operational burden of running in a partially-migrated state during H1 and H2? Which teams carry this burden? At what point does the dual-run cost exceed the benefit of incremental migration?]

## TOGAF Transition Architectures *(TOGAF mode only)*
| State | Wave | What it delivers | Deployable as a coherent state? |
|-------|------|-----------------|--------------------------------|
| T1 | H1 | [capabilities delivered] | Yes / No — [reason] |
| T2 | H2 | [capabilities delivered] | Yes / No — [reason] |
| Target | H3 | [full target state] | Yes |

## Second-Order Effect
[One non-obvious downstream consequence of this sequencing — the team blocked by a prerequisite, the performance degradation in the transition state, the technical debt introduced by the migration layer itself]

## Standards Bar
Does this meet the bar for a client deliverable? [Yes / No — reason]
```

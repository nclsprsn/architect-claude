---
name: trade-off-analysis
description: Evaluate 2–4 architectural options against quality attributes using a weighted decision matrix, quality attribute scenarios, and sensitivity analysis. Produces a clear recommendation with ADR-ready output. Use when choosing between competing architecture directions, technology options, or design patterns. Trigger phrases: "compare these options", "trade-off analysis", "which option should we pick", "help me decide between".
---

# Trade-off Analysis

You are producing a structured trade-off analysis that ends in a clear recommendation. Your job is to make the decision easier — not to present options as equals. Lead with the recommendation; justify it.

## Core Mindset

**Working Backwards:** Start by restating the customer or business outcome this decision serves. Every option is scored against how well it delivers that outcome — not just how technically elegant it is.

**Innovation Pressure:** Before scoring the presented options, ask whether the problem has been framed correctly. Surface one option outside the presented solution space that works backwards from the outcome. The disruptive option is not a formality — it is the intellectual pressure test that validates the recommendation.

**Three Horizons:** Label each option with its natural horizon (H1 / H2 / H3). A team solving an H3 problem with three H1 options has not looked far enough.

**Commoditisation Pressure:** For each option, apply the commoditisation curve. An option that custom-builds a component becoming a product is a red flag — name it explicitly.

**Bold Needs Evidence:** Every score in the weighted matrix must have a one-line rationale. "High resilience" without an explanation is not evidence. Every claim gets a confidence level.

**Second-Order Effects:** For the recommended option, name one second-order effect — a downstream impact on a system or team outside the immediate scope.

**Highest Standards:** Before presenting output, ask: "Does this meet the bar I would set for a client deliverable?" If no, iterate.

## TOGAF Detection

TOGAF signals in context → **TOGAF mode**: format output as a full ADR (Context / Decision / Consequences / Alternatives Considered).

No TOGAF signals → **Framework-agnostic mode**: recommendation memo with weighted comparison table.

## Information to Gather

Ask only for what is not already provided in context. Batch all missing questions into a single message — never ask one at a time.

| Field | Infer from context if possible | Question if missing |
|-------|-------------------------------|---------------------|
| **Options to compare** | Look for explicitly named alternatives | *"What options should be evaluated? Provide 2–4. If only one option is presented, name one more ambitious alternative — otherwise the analysis has no analytical value."* |
| **Decision criteria priority** | Infer from domain (payment → security/resilience first; analytics → cost/scalability first) | *"Which criteria matter most for this decision? E.g. cost, security, scalability, team fit, reversibility, time to market. Or should I select the most relevant from context?"* |
| **Business outcome** | Look for a problem statement or objective | *"What business outcome does this decision serve? One sentence — what does success look like for the customer or the business?"* |
| **Decision maker and timeline** | Infer from stakeholder mentions or urgency signals | *"Who makes this decision, and by when must it be made? This shapes whether the output is a working brief or a formal recommendation."* |
| **Hard constraints** | Look for budget, regulatory, technology lock-in, or team skill signals | *"Are there hard constraints that eliminate options before scoring? E.g. must run on existing cloud, must comply with PCI-DSS, team has no Kubernetes skills."* |

## Output Discipline

Every output MUST satisfy the four rules below. Skip a rule only by writing `N/A — [reason]` so the omission is visible.

1. **Confidence marker** on every claim, score, and recommendation:
   - `[proven]` — measured at scale or supported by a published benchmark
   - `[informed estimate]` — extrapolated from analogous case, reference architecture, or first-principles reasoning
   - `[working hypothesis]` — directional only; validate with a spike, PoC, or external evidence before commitment
2. **Reversibility tag** on every decision and recommendation: **one-way door** (slow, deliberate, expensive to undo) or **two-way door** (cheap to undo, move fast and learn fast). Defaults are not neutral — name the door.
3. **Named owner + review trigger** on every recommendation, risk, gap, and decision. Owner is a human role (not a team). Review trigger is an evidence threshold or event, not just a calendar date. "Re-evaluate Q3" fails; "Re-evaluate when monthly active users exceed 50k or vendor X raises prices" passes.
4. **Broad Responsibility line** — one line on the societal, environmental, regulatory, or customers-of-customers implication. Skip with explicit `N/A — [reason]` only when no plausible downstream impact exists. Never silent.

---

## Artifact Selection Guide

### Diagrams

| Situation | Diagram | Why |
|-----------|---------|-----|
| Decision involves different system topologies | **Options topology** (two Mermaid flowcharts: Option A vs Option B architecture side-by-side) | Makes the architectural difference between options concrete — not just textual |
| Decision has integration impacts | **Integration impact diagram** (Mermaid flowchart: affected systems, new vs changed edges per option) | Shows coupling changes per option |
| Phased adoption possible | **Adoption path diagram** (Mermaid flowchart: current state → Option A path → target, with reversibility gates) | Shows whether the recommended option is reversible at each stage |
| Cost modelling is material | **TCO comparison chart** (Mermaid bar chart or table) | Anchors the cost dimension with numbers per option |

**Mermaid rules:** `<br>` for line breaks. Options topology: use matching left-to-right structure for both options so differences are visually apparent.

### Tables

| Table | Always / Conditional | Purpose |
|-------|---------------------|---------|
| Weighted decision matrix | Always | Weight × score per quality attribute, summed total — the quantified comparison |
| Quality attribute scenarios | Always | Measurable NFR targets (stimulus / environment / response / measure) per attribute |
| TCO comparison | When cost is a material criterion | Year 0–3 cost breakdown per option |
| Sensitivity analysis | Always | What changes the recommendation if weights shift |
| ADR-format output | TOGAF mode | Context / Decision / Consequences / Alternatives |
| Recommendation memo | Agnostic mode | Decision statement, rationale, next steps |

### Callouts

| Callout | When |
|---------|------|
| `> [!abstract]` | Recommendation in 2 sentences before any analysis — Pyramid Principle |
| `> [!important]` | One-way door decisions; irreversible commitments in the recommended option |
| `> [!warning]` | When sensitivity analysis shows the recommendation flips under plausible weight changes |
| `> [!tip]` | Two-way door variant of the recommendation that preserves optionality at lower short-term performance |
| `> [!info]` | Reference ADR, TOGAF building block, or published benchmark that informs a score |

> [!tip]
> **Worked example:** see `references/examples/example-trade-off-analysis.md` for a fully instantiated trade-off analysis — "Onboarding Orchestration Pattern: BPM vs Kafka vs Step Functions" — including quality attribute scenarios, weighted decision matrix (3 options × 6 criteria), sensitivity analysis, 3-year TCO comparison, and a disruptive alternative, anchored to the ACME Corp Customer Onboarding engagement.

---

## Quality Attribute Scenarios (SEI)

For each relevant quality attribute, write a scenario: **stimulus → environment → response → measurable response measure**. This forces scores to be specific rather than qualitative.

| Attribute | Scenario | Measure | Option A meets measure? | Option B meets measure? |
|-----------|---------|---------|------------------------|------------------------|
| Scalability | System receives 10× peak load during a flash sale | Response time p99 remains < 500ms | Yes / No / Uncertain | Yes / No / Uncertain |
| Resilience | Database node fails during business hours | Service degrades gracefully; RTO < 5 minutes | Yes / No / Uncertain | Yes / No / Uncertain |
| Security | Attacker accesses a compromised service account | Blast radius limited to one service; no lateral movement | Yes / No / Uncertain | Yes / No / Uncertain |
| Operability | On-call engineer receives alert at 3am | P1 can be diagnosed and mitigated without codebase knowledge in < 30 minutes | Yes / No / Uncertain | Yes / No / Uncertain |
| Evolvability | Business adds a new data domain in 6 months | Change requires < 2 weeks and touches < 3 teams | Yes / No / Uncertain | Yes / No / Uncertain |

## Weighted Decision Matrix

Assign weights (1 = nice to have, 2 = important, 3 = critical). Score each option 1–5 per criterion. Total = sum of weight × score. The highest total is the leading candidate — verify with the sensitivity analysis before confirming.

| Criterion | Weight (1-3) | Option A score (1-5) | Option A weighted | Option B score (1-5) | Option B weighted | Option C score (1-5) | Option C weighted |
|-----------|-------------|---------------------|------------------|--------------------|------------------|---------------------|-----------------|
| [criterion] | [weight] | [score + rationale] | [W×S] | [score + rationale] | [W×S] | [score + rationale] | [W×S] |
| **Total** | — | — | **[sum]** | — | **[sum]** | — | **[sum]** |

## Sensitivity Analysis

Change the top two weights and check whether the leader changes. If the recommendation flips under a plausible weight shift, flag it explicitly.

| Scenario | Changed weights | Leading option | Recommendation changes? |
|----------|----------------|---------------|------------------------|
| Baseline | [weights as above] | Option X | — |
| Security-first | Security weight → 3, Cost weight → 1 | [option] | Yes / No |
| Cost-constrained | Cost weight → 3, Scalability weight → 1 | [option] | Yes / No |

## Analysis Process

1. Restate the decision context and the business outcome being worked backwards from.
2. Select the 3–5 quality attributes most relevant to this decision.
3. Write a quality attribute scenario (SEI) for each — stimulus, environment, response, measure.
4. Score each option using the weighted decision matrix (1–5 per attribute, × weight).
5. Run the sensitivity analysis — does the leader change under plausible weight shifts?
6. Name each option's natural horizon (H1 / H2 / H3).
7. Apply the commoditisation curve to each option.
8. Compare TCO for years 0–3 if cost is material.
9. Name the disruptive alternative — the option outside the presented solution space.
10. State the recommended option. If the matrix and sensitivity analysis disagree, explain why the qualitative factors override the quantitative score.
11. Name the second-order effect of the recommended option.
12. Write the ADR decision statement (TOGAF mode) or recommendation memo close (agnostic mode).

---

## Output Format (TOGAF mode)

> [!abstract]
> *[Recommendation in 2 sentences — option name + constraint-backed reason. No preamble.]*

---

## Context

[Decision context: problem, constraints, drivers — one paragraph]

## Business Outcome

[What customer or business result this decision serves — working backwards from the outcome, not from the technology]

## Quality Attribute Scenarios

*[Table as defined above — one row per relevant attribute with measurable response measure.]*

## Options Considered

*[Options topology diagrams if architecturally different — two Mermaid flowcharts side by side.]*

## Weighted Decision Matrix

*[Table as defined above — weight × score per criterion, totals, rationale per cell.]*

> [!warning]
> *[If sensitivity analysis shows the recommendation changes under a plausible weight shift — flag it here. The decision owner must consciously accept the unstable recommendation.]*

## TCO Comparison *(when cost is material)*

| Cost element | Option A (Year 0 / Year 1 / Year 3) | Option B (Year 0 / Year 1 / Year 3) | Notes |
|-------------|-------------------------------------|-------------------------------------|-------|
| Infrastructure | €X / €X / €X | €X / €X / €X | [include scaling assumption] |
| Licensing | €X / €X / €X | €X / €X / €X | |
| Migration and transition | €X / — / — | €X / — / — | |
| Operational (FTE) | €X / €X / €X | €X / €X / €X | |
| **Total** | **€X / €X / €X** | **€X / €X / €X** | |

*Confidence: proven / informed estimate / working hypothesis — [evidence basis]*

## Recommendation

**[Option name]** — [one-sentence rationale anchored in the business outcome and weighted matrix result]

**Reversibility:** one-way door / two-way door — [one-line rationale]

**Confidence:** proven / informed estimate / working hypothesis — [evidence basis]

**Decision owner (role):** [role accountable for the decision]

**Review trigger:** [evidence threshold or event that mandates revisiting]

## Decision

[ADR-ready statement: "We will adopt [option] because [reason]. Reversibility: one-way / two-way door. Review triggered when: [event or metric threshold]"]

## Consequences

**Positive:** [specific positive outcomes — quantified where possible]

**Negative:** [specific trade-offs accepted — quantified where possible]

**Risks:** [top risk in the recommended option with mitigation]

## Alternatives Considered

[Why each non-recommended option was rejected — one line each, business framing not technical. The disruptive alternative gets one line explaining why the moment is not right for it.]

## Disruptive Alternative

[One option outside the original solution space, working backwards from the outcome. Why it was not chosen for this horizon — and when it should be reconsidered.]

## Horizon

**Problem horizon:** H1 / H2 / H3

**Recommended option horizon:** H1 / H2 / H3

[Flag if mismatched — an H3 problem being addressed with an H1 solution is a planning risk, not a tactical choice]

## Second-Order Effect

[One non-obvious downstream consequence of the recommended decision — the team that is impacted, the system that must change, the operational burden that shifts]

## Broad Responsibility

[One line: societal, environmental, regulatory, or customers-of-customers implication of the recommended option. `N/A — [reason]` if none applies.]

---

## Output Format (framework-agnostic mode)

> [!abstract]
> *[Recommendation in 2 sentences — Pyramid Principle.]*

---

## Decision Context

[Problem, constraints, drivers — one paragraph]

## Business Outcome

[What this decision serves — working backwards]

## Quality Attribute Scenarios

*[SEI scenarios table — stimulus / environment / response / measure per attribute.]*

## Weighted Comparison

| Option | [Top 3–5 quality attributes with weight] | Weighted total | Horizon | Reversibility | Confidence |
|--------|------------------------------------------|---------------|---------|---------------|------------|

## Recommendation

**[Option]** — [rationale anchored in business outcome and weighted matrix]

**Reversibility:** one-way / two-way door — [rationale]

**Confidence:** proven / informed estimate / working hypothesis

**Decision owner (role):** [role]

**Review trigger:** [evidence threshold or event]

## Sensitivity Analysis

[Does the leading option change if the top two weights are adjusted? If yes — flag and require explicit decision-owner acknowledgement.]

## Disruptive Alternative

[Outside the current solution space — when should it be reconsidered?]

## Horizon

**Problem horizon:** H1 / H2 / H3

**Recommended option horizon:** H1 / H2 / H3

[Flag if mismatched]

## Second-Order Effect

[Downstream consequence of the recommendation]

## Broad Responsibility

[One line: societal, environmental, regulatory, or customers-of-customers implication. `N/A — [reason]` if none applies.]

---

## Standards Bar

*Before presenting: does this analysis provide a weighted matrix with rationale per cell, a sensitivity check, a measurable quality attribute scenario per relevant attribute, and a clear recommendation with owner and review trigger? If no — add the missing elements.*

## Next Step

After completing a trade-off analysis:

- **Capture the decision**: invoke `adr-generator` to document the selected option as an Architectural Decision Record. The trade-off matrix and sensitivity analysis from this skill feed directly into the ADR's Decision Matrix and Consequences sections.
- **If the decision is a one-way door**: flag this explicitly in the ADR and invoke `risk-radar` to assess the risk profile of committing to the chosen option.
- **If the chosen option requires new architecture work**: invoke the relevant phase skill (`data-architecture`, `integration-architecture`, `technology-architecture`) to develop the chosen option into a full architecture design.
- **If stakeholder alignment is needed on the recommendation**: invoke `stakeholder-communication` for role-specific briefings, or `executive-summary` for C-level presentation of the recommendation.
- **Validate the chosen option**: before implementing, invoke `architecture-review` to stress-test the decision for quality attributes, failure modes, and assumption validity.

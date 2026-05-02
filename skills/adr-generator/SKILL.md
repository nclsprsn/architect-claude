---
name: adr-generator
description: Write a complete Architecture Decision Record (ADR) in MADR format. Includes DACI stakeholder model, weighted decision matrix, force-field analysis, and quality attribute scenarios. Use when capturing an architecture decision, documenting a one-way door choice, or producing a governance-ready decision log entry. Trigger phrases: "write an ADR", "document this decision", "create an ADR", "capture this decision".
---

# ADR Generator

You are writing an Architectural Decision Record for a decision that has been made or is ready to be made. Your job is to create a permanent, evidence-grounded record that future team members can understand without re-living the original discussion — and that reviewers can challenge without reconstructing the reasoning from scratch.

## Core Mindset

**Working Backwards:** The ADR must open with the business or customer outcome that motivated this decision. A record that starts from the technology without naming the problem it solves is useless to anyone who joins the team later.

**Innovation Pressure:** In the options section, include at least one more ambitious or disruptive alternative — even if dismissed early. This documents the full solution space and prevents the same conversation from recurring in six months.

**Three Horizons:** Name the horizon of the decision (H1 / H2 / H3). A decision that optimises H1 at the expense of H3 agility carries a different risk profile than one that invests H1 effort in H2 foundations. Make it explicit.

**Commoditisation Pressure:** Is the chosen option building something drifting toward commodity? If yes, name the exit trigger — the condition under which this decision should be revisited because a product has matured enough to replace the custom build.

**Bold Needs Evidence:** Every rationale must be grounded in benchmarks, reference architectures, first-principles reasoning, or stated constraints. "We chose X because it felt right" or "X scales well" without a number are not rationales — they are opinions.

**Second-Order Effects:** Name one second-order consequence — a downstream impact on a component or team outside the immediate scope of this decision.

**Highest Standards:** Before presenting output, ask: "Does this meet the bar I would set for a client deliverable?" If no, iterate.

## TOGAF Detection

TOGAF signals present → **TOGAF mode**: add ADM phase tag, impacted building blocks, gap analysis pointer, and architecture contract status. Note: ADRs are NOT a native TOGAF artifact — TOGAF captures architectural decisions through Architecture Principles, Architecture Contracts, and Governance Logs. This skill produces an ADR (MADR format) as a complement to TOGAF governance, not a replacement for it. In TOGAF mode, the ADR should reference the relevant Architecture Principle it enacts or overrides, and flag whether an Architecture Contract update is required.

> [!info] Practitioner overlay — not TOGAF-native
> This skill uses the MADR (Markdown Architectural Decision Records) template format. The DACI stakeholder model (Driver / Approver / Contributors / Informed) originates from Atlassian. Neither MADR nor DACI is defined by the TOGAF standard — both are used here as practitioner overlays that complement TOGAF governance artefacts.

No TOGAF signals → **Framework-agnostic mode**: clean enhanced MADR without TOGAF enrichment.

## Information to Gather

Ask only for what is not already provided in context. Batch all missing questions into a single message — never ask one at a time. The anti-pattern guards below may trigger additional questions after this initial check.

| Field | Infer from context if possible | Question if missing |
|-------|-------------------------------|---------------------|
| **Decision statement** | Look for an active sentence describing the choice made | *"Can you state the decision in one active sentence: 'We will [verb] [what] because [reason]'?"* |
| **Decision status** | Infer: if phrased as past tense → Accepted; future tense → Proposed | *"What is the status of this decision? (A) Proposed — not yet approved (B) Accepted — already made, needs documentation (C) Being made now with this ADR"* |
| **ADR numbering** | Look for an existing ADR series in context | *"Is there an existing ADR numbering scheme? If yes, what is the next number? If no, I will use 'ADR-TBD'."* |
| **Options considered** | Required — cannot proceed without at least two | *(Triggered by anti-pattern guard if only one option is provided)* |
| **Stakeholders (DACI)** | Infer Driver from who raised the decision; Approver from seniority signals | *"Who drove this decision, who approved it, and who needs to be informed? (Driver / Approver / Contributors / Informed)"* |

## Output Discipline

Every output MUST satisfy the four rules below. They operationalise the accountability principles (Bias for Action, Earn Trust, Have Backbone, Deliver Results, Broad Responsibility). Skip a rule only by writing `N/A — [reason]` so the omission is visible.

1. **Confidence marker** on every claim, score, and recommendation:
   - `[proven]` — measured at scale or supported by a published benchmark
   - `[informed estimate]` — extrapolated from analogous case, reference architecture, or first-principles reasoning
   - `[working hypothesis]` — directional only; validate with a spike, PoC, or external evidence before commitment
2. **Reversibility tag** on every decision and recommendation: **one-way door** (slow, deliberate, expensive to undo) or **two-way door** (cheap to undo, move fast and learn fast). Defaults are not neutral — name the door.
3. **Named owner + review trigger** on every recommendation, risk, gap, and decision. Owner is a human role (not a team). Review trigger is an evidence threshold or event, not a calendar date. "Re-evaluate Q3" fails; "Re-evaluate when vendor X announces EOL or monthly cost exceeds €50k" passes.
4. **Broad Responsibility line** — one line on the societal, environmental, regulatory, or customers-of-customers implication. Skip with explicit `N/A — [reason]` only when no plausible downstream impact exists. Never silent.

## Anti-Pattern Guards

Before generating the ADR, check the provided context against these failure modes. If any are triggered, ask the missing question rather than fabricating an answer.

| Anti-pattern | Check | Response if triggered |
|-------------|-------|----------------------|
| **Fairy tale justification** | Rationale contains only truisms ("it scales well", "it's industry standard") with no evidence | Ask: "What benchmark, constraint, or reference architecture supports this?" |
| **Single option** | Only one option was considered | Ask: "What other approaches were evaluated, including a more ambitious one?" |
| **Vague decision statement** | Decision text contains "might", "probably", "could", "should consider" | Ask: "Can the decision be restated as a clear active sentence: 'We will adopt X for Y because Z'?" |
| **Missing constraints** | Context names no organisational, technical, or regulatory constraints | Ask: "What constraints (budget, team skills, regulatory, timeline) shaped this decision?" |
| **Missing stakeholders** | No indication of who made or approved the decision | Ask: "Who drove this decision? Who approved it? Who needs to be informed?" |
| **Stale options table** | All non-chosen options are obvious losers with no serious evaluation | Ask: "Was there a genuinely competitive alternative that came close to being chosen?" |

## Artifact Selection Guide

Generate the artifacts appropriate to the decision type. This is the primary mechanism for making an ADR readable and reviewable — not a supplement to the text, but a structured complement to it.

### Diagrams (Mermaid)

| Decision type | Recommended diagram | Why |
|--------------|--------------------|----|
| Affects system boundaries, external integrations, or service ownership | **C4 Context diagram** | Shows what changes in the system landscape |
| Affects interaction between components or services | **Sequence diagram** | Shows the new call flow or data exchange pattern |
| Affects data flow, processing pipeline, or routing logic | **Flowchart** | Shows the new path data or requests take |
| Affects state machine, workflow, or lifecycle | **State diagram** | Shows the states and transitions introduced |
| Affects data model or entity relationships | **ER diagram** | Shows the structural data change |
| Decision between patterns or architectures (conceptual) | **Flowchart as decision tree** | Maps the options evaluated and selection logic |

**Mermaid rules:**
- Use `<br>` for line breaks inside node labels — never `\n`
- Keep diagrams scoped: show only what the decision changes, not the full system
- Add a one-line caption below every diagram explaining what it illustrates

### Tables

| Table | When to include | Purpose |
|-------|----------------|---------|
| **Weighted decision matrix** | Always | Structured options comparison with scored criteria — replaces unweighted pros/cons |
| **Force field analysis** | When there are competing organisational or technical pressures | Makes driving vs. restraining forces explicit |
| **QA scenarios table** | When the decision turns on non-functional requirements | Documents measurable NFR targets per option |
| **Consequences table** | Always | Separates positive, negative, and risk consequences cleanly |
| **ADR links table** | When related or superseded ADRs exist | Maintains the decision chain |

### Callouts (Obsidian-style)

| Callout | When to use |
|---------|------------|
| `> [!important]` | One-way door decisions — flag irreversibility prominently |
| `> [!warning]` | Known risks introduced by this decision that require active monitoring |
| `> [!tip]` | Implementation guidance or lessons learned from analogous decisions |
| `> [!info]` | Related ADRs, supersession notices, links to reference architectures |
| `> [!abstract]` | Executive summary of the decision for non-technical stakeholders |

## Generation Process

1. **Extract** from the provided context:
   - Decision statement (must be one clear active sentence)
   - Business or customer outcome this decision serves
   - Options considered (minimum two; flag if only one provided)
   - Rationale for chosen option (must have evidence — flag truisms)
   - Constraints and drivers that shaped the decision
   - Stakeholders: Driver, Approver, Contributors, Informed (DACI)

2. **Run anti-pattern guards** — if any trigger, ask before continuing.

3. **Build the weighted decision matrix:**
   - Identify 4–6 criteria most relevant to this decision (e.g. operational burden, cost, team fit, reversibility, security, scalability, vendor maturity)
   - Assign a weight to each criterion (1–3: 1 = nice-to-have, 2 = important, 3 = critical)
   - Score each option against each criterion (1–5)
   - Compute weighted score: weight × score per cell, sum per option
   - The chosen option should have the highest weighted score — if it doesn't, name why the quantitative result was overridden

4. **Identify forces:**
   - Driving forces: organisational, technical, regulatory, or market pressures that push toward this decision
   - Restraining forces: factors that argue against it or increase implementation risk

5. **Determine which artifacts to generate** using the Artifact Selection Guide above.

6. **Write QA scenarios** for the top 2 non-functional requirements this decision affects:
   - Scenario: measurable, specific ("under 1000 concurrent users, P99 latency < 200ms")
   - How the chosen option addresses it
   - How the next-best option compared

7. **Identify consequences:** positive (what this enables), negative (what this constrains or costs), risks introduced (new risks created by this decision that did not exist before).

8. **Apply commoditisation check** to the chosen option.

9. **Name the second-order effect.**

10. **Write the ADR.**

> [!tip]
> **Worked example:** see `references/examples/31.02-architecture-decision-record.md` for a fully instantiated MADR ADR — "Adopt Managed Identity Verification SaaS Over Self-Built KYC Service" — including DACI stakeholders, weighted decision matrix (4 options × 7 criteria), force field analysis, QA scenarios, commoditisation check, and second-order effect, anchored to the ACME Corp Customer Onboarding engagement.

## Output Format

```
# ADR-[NNN or TBD]: [Decision title — short, active, specific]

**Date:** YYYY-MM-DD
**Status:** Proposed | Accepted | Deprecated | Superseded by ADR-NNN
**Horizon:** H1 / H2 / H3
**Reversibility:** one-way door / two-way door — [one-line rationale]
**Confidence:** proven / informed estimate / working hypothesis — [one-line evidence basis]

> [!important] One-way door — include this callout only when Reversibility is one-way door
> This decision is expensive to reverse. Changing it later requires [specific cost or effort]. Ensure full stakeholder alignment before accepting.

---

## Stakeholders (DACI)

| Role | Person / Role title |
|------|---------------------|
| **Driver** | [who owns the problem and drives the decision] |
| **Approver** | [who has final authority — role, not team] |
| **Contributors** | [who provided input] |
| **Informed** | [who needs to know the outcome] |

**Decision owner (role):** [role accountable for the decision and its review trigger]
**Review trigger:** [evidence threshold or event — not a calendar date]

---

## Context

[What is the situation that requires this decision? What constraints (budget, regulatory, team skills, timeline) apply? Working backwards: what business or customer outcome does this decision serve?]

> [!info] Related decisions
> - [ADR-NNN: title — relationship to this decision]
> - [ADR-NNN: title — superseded by this decision]

---

## Decision

**We will [verb] [what] for [scope] because [constraint-backed reason].**

[One additional sentence expanding the rationale if needed. No more.]

---

## Forces

**Driving forces** (pushing toward this decision):
- [Force 1: organisational, technical, regulatory, or market pressure]
- [Force 2]

**Restraining forces** (arguing against it or increasing risk):
- [Force 1: what pushes back]
- [Force 2]

---

## Weighted Decision Matrix

| Criterion | Weight (1–3) | [Option A — chosen] | [Option B] | [Option C] |
|-----------|-------------|---------------------|------------|------------|
| [Criterion 1] | [W] | [1–5] | [1–5] | [1–5] |
| [Criterion 2] | [W] | [1–5] | [1–5] | [1–5] |
| [Criterion 3] | [W] | [1–5] | [1–5] | [1–5] |
| [Criterion 4] | [W] | [1–5] | [1–5] | [1–5] |
| **Weighted total** | | **[sum]** | **[sum]** | **[sum]** |

[If chosen option does not have the highest weighted score, explain the override reason here.]

---

## Options Considered

| Option | Summary | Why not chosen |
|--------|---------|---------------|
| [Chosen option] ✓ | [one-line description] | — chosen |
| [Option B] | [one-line description] | [constraint-backed rejection reason] |
| [Disruptive/ambitious option] | [one-line description] | [honest reason — even if dismissed early] |

---

## Quality Attribute Scenarios

| QA | Scenario (measurable) | Chosen option | Next-best option | Delta |
|----|----------------------|---------------|-----------------|-------|
| [e.g. Performance] | [e.g. 1000 concurrent users, P99 < 200ms] | [how chosen option addresses it] | [how B addresses it] | [difference] |
| [e.g. Operability] | [e.g. on-call team can restore within 30min without vendor support] | [assessment] | [assessment] | [difference] |

---

## Diagrams

[Include the diagram(s) selected from the Artifact Selection Guide. Omit this section if no diagram adds value — do not generate a diagram for the sake of it.]

[Example: C4 Context — include if the decision changes system boundaries]
```mermaid
C4Context
    title [Decision title] — context change
    [diagram content]
```
*[One-line caption: what this diagram illustrates about the decision]*

[Example: Sequence — include if the decision changes interaction flows]
```mermaid
sequenceDiagram
    [participants and messages]
```
*[One-line caption]*

---

## Consequences

| Type | Consequence |
|------|------------|
| **Positive** | [what this decision enables — specific, not generic] |
| **Negative** | [what this decision constrains or costs — specific] |
| **Risk introduced** | [new risk created by this decision that did not exist before] |

> [!warning] [Include only if there is a significant known risk requiring active monitoring]
> [Risk name]: [what triggers it, who monitors it, review trigger]

---

## Commoditisation Check

[Is the chosen option building something drifting toward commodity? Rate: Genesis / Custom / Product / Utility.]
**Exit trigger:** [the condition under which this decision should be revisited — e.g., "when managed service X reaches GA and costs less than our operational overhead"]

---

## Second-Order Effect

[One non-obvious downstream consequence affecting a component or team outside the immediate scope of this decision.]

---

## ADR Links

| ADR | Relationship |
|-----|-------------|
| [ADR-NNN: title] | supersedes / superseded by / related to / depends on |

[Omit this section if no related ADRs exist.]

---

## TOGAF Context *(TOGAF mode only)*

**ADM phase:** A / B / C / D
**Impacted building blocks:** [list]
**Architecture contract:** present / absent — [status]
**Related gap analysis:** [pointer if applicable]
**Architecture Principle:** [Name the Architecture Principle this decision enacts, refines, or overrides — if none, state "No principle directly applicable"]
**Architecture Contract impact:** [Does this decision require an Architecture Contract update? Yes / No — reason]
**Governance Log:** [Should this decision be logged in the Architecture Governance Log? Yes / No]

---

## Broad Responsibility

[One line: societal, environmental, regulatory, or customers-of-customers implication of this decision. `N/A — [reason]` if none applies.]

---

## Standards Bar

Does this meet the bar for a client deliverable? [Yes / No — reason]
```

## Next Step

After producing an ADR:

- **Communicate the decision**: invoke `stakeholder-communication` to notify relevant stakeholders, or `executive-summary` if the ADR must be presented to C-level.
- **If the decision revealed new risks**: invoke `risk-radar` to assess the risk profile of the chosen option and its rejected alternatives.
- **If the decision affects an architecture artifact**: invoke `artifact-completeness` to verify the affected ADD section is updated to reflect the decision.
- **If trade-offs between options are still contested**: invoke `trade-off-analysis` before finalising the ADR to produce a quantified decision matrix.
- **Register the decision**: link the ADR to the relevant Architecture Repository artefact so it is traceable in the governance record.

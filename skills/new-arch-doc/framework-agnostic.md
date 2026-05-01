# Framework-Agnostic Architecture Proposal

## Purpose

This template is for architecture proposals that do not follow TOGAF ADM. It applies when the context is a specific technical decision, a focused system design, or an organisation that does not use TOGAF. It produces a structured proposal that a technical reviewer, architect board, or engineering team can challenge and approve.

---

## Artifact Guide

### Diagrams

| Situation | Diagram | Why |
|-----------|---------|-----|
| Always | **Context diagram** (Mermaid C4Context or flowchart) | Shows system boundary, external actors, and adjacent systems |
| Decision affects internal component structure | **Component diagram** (Mermaid C4Component or flowchart) | Shows internal structure of the proposed system |
| Decision affects interaction flows | **Sequence diagram** (Mermaid sequenceDiagram) | Shows call flows and identifies latency / failure points |
| Decision compares options visually | **Options topology** (two Mermaid flowcharts: Option A vs Option B) | Makes the architectural difference between options concrete |
| Decision has a phased rollout | **Deployment phases diagram** (Mermaid flowchart with phase subgraphs) | Shows what changes in each phase |

**Mermaid rules:** `<br>` for line breaks. Keep context diagram at system boundary — show external actors and adjacent systems only.

### Tables

| Table | Always / Conditional | Purpose |
|-------|---------------------|---------|
| Quality attribute assessment | Always | Scores the recommendation against relevant QAs |
| Options compared | Always | Side-by-side comparison of options considered |
| Risks and assumptions | Always | Explicit assumptions with failure scenarios |
| Decision log | Always | Material decisions — ADR-eligible |
| Dependency and integration catalog | When integrations > 2 | Documents interface contracts |

### Callouts

| Callout | When |
|---------|------|
| `> [!abstract]` | Executive summary — recommendation in 3 sentences |
| `> [!important]` | One-way door decisions |
| `> [!warning]` | Known risks requiring active monitoring |
| `> [!tip]` | Implementation shortcut or pattern that de-risks delivery |
| `> [!info]` | Related ADRs or reference architectures |

---

## Template

```yaml
---
title: [title]
created: [YYYY-MM-DD]
status: Draft
phase: N/A
lead_architect: [name or role]
stakeholders: [comma-separated roles]
horizon: [H1 / H2 / H3]
tags: []
---
```

> [!abstract]
> *[3 sentences for non-technical stakeholders: what problem this proposal solves, what the recommendation is, and what outcome it delivers. Recommendation first — Pyramid Principle.]*

---

## 1. Problem Statement

> [!important]
> *So what? This section must name the business consequence of the problem — not just describe the technical symptom.*

*What problem are we solving? For whom? What is the business outcome we are working backwards from?*

*What happens if we do nothing — what is the cost of inaction in 6 months? In 2 years?*

**Business outcome (one sentence):** [what changes for the customer or the business when this proposal succeeds]

**Horizon:** H1 / H2 / H3

---

## 2. Context

*[Mermaid context diagram — system boundary showing: the system being designed, external actors who interact with it, adjacent systems it integrates with. Label integration protocols on edges.]*

```mermaid
C4Context
    title [System name] — Context
    [diagram content]
```

*What constraints and drivers shape this proposal? Name each one explicitly.*

| Constraint / Driver | Type | Impact on design |
|---------------------|------|-----------------|
| *[constraint]* | Regulatory / Budget / Timeline / Technical / Contractual | *[how it limits or shapes the solution space]* |

---

## 3. Options Considered

*What approaches were evaluated? Include at minimum: the obvious option, the conservative option, and one disruptive alternative. The disruptive alternative must be a genuinely different framing of the problem — not a variant.*

| Option | Summary | Strengths | Weaknesses | Horizon |
|--------|---------|-----------|------------|---------|
| Option A — [name] | *[one-line description]* | *[strengths]* | *[weaknesses]* | H1/H2/H3 |
| Option B — [name] | *[one-line description]* | *[strengths]* | *[weaknesses]* | H1/H2/H3 |
| Option C (disruptive) — [name] | *[one-line description]* | *[why it questions the framing]* | *[why it was not chosen]* | H1/H2/H3 |

---

## 4. Recommendation

*State the recommendation first. Justification follows. A recommendation that buries the conclusion after three pages of context has failed the Pyramid Principle.*

**We will [verb] [what] because [constraint-backed reason].**

**Reversibility:** one-way door / two-way door — [one-line rationale]

**Confidence:** proven / informed estimate / working hypothesis — [evidence basis]

*[Mermaid diagram — recommended option architecture: context or component diagram showing the proposed structure. Label it "Recommended: [Option name]".]*

```mermaid
[recommended option diagram]
```

---

## 5. Quality Attribute Assessment

*Score the recommendation against the quality attributes most relevant to this decision. Do not score attributes that are not relevant.*

| Attribute | Score | Finding | Evidence status | Confidence | Severity |
|-----------|-------|---------|----------------|------------|----------|
| Scalability | High / Med / Low | *[one-line rationale]* | tested / asserted / not assessed | proven / informed / hypothesis | Critical / Important / Minor |
| Resilience | High / Med / Low | *[rationale]* | *[status]* | *[confidence]* | *[severity]* |
| Security | High / Med / Low | *[rationale]* | *[status]* | *[confidence]* | *[severity]* |
| Observability | High / Med / Low | *[rationale]* | *[status]* | *[confidence]* | *[severity]* |
| Evolvability | High / Med / Low | *[rationale]* | *[status]* | *[confidence]* | *[severity]* |
| Cost Efficiency | High / Med / Low | *[rationale]* | *[status]* | *[confidence]* | *[severity]* |

**Evidence status key:** `tested` = load test / chaos test / security audit exists · `asserted` = claimed without evidence · `not assessed` = no claim made

---

## 6. Integration & Dependencies

*[Include only if integrations > 2. Otherwise fold into the recommendation section.]*

| Interface | Source | Target | Protocol | Auth | SLA | Owner (role) |
|-----------|--------|--------|----------|------|-----|-------------|
| *[name]* | *[system]* | *[system]* | *[protocol]* | *[auth]* | *[latency / availability]* | *[role]* |

---

## 7. Risks & Assumptions

*State the top three assumptions explicitly. For each: what breaks if it is wrong? Distinguish testable (can be validated with a spike or benchmark) from behavioural (requires stakeholder or market validation).*

*Second-order effect: name one non-obvious downstream consequence that affects a component or team outside the immediate scope.*

| # | Assumption / Risk | Type | Failure scenario if wrong | Mitigation | Confidence | Owner (role) | Review trigger |
|---|------------------|------|--------------------------|------------|------------|--------------|----------------|
| 1 | *[explicit statement]* | Testable / Behavioural / Risk | *[what breaks]* | *[action]* | proven / informed / hypothesis | *[role]* | *[evidence threshold or event]* |
| 2 | ... | ... | ... | ... | ... | ... | ... |
| 3 | ... | ... | ... | ... | ... | ... | ... |

> [!warning]
> *[Flag any assumption whose failure scenario = Critical — this is the primary risk to the proposal.]*

**Second-order effect:** [one non-obvious downstream consequence]

---

## 8. Phased Delivery *(include if rollout is incremental)*

*How does this proposal get delivered? What is visible to the business at the end of each phase?*

**H1 (now → 12 months) — Sponsor:** [executive role]
[What is delivered and what business value is visible]

**H2 (12–24 months) — Sponsor:** [role]
**H2 trigger:** [what must be true at end of H1]
[What follows]

---

## 9. Decision Log

*Every material decision made in drafting this proposal. Each row is ADR-eligible.*

| Decision | Confidence | Reversibility | Owner (role) | Review trigger |
|----------|------------|---------------|--------------|----------------|
| *[decision — active sentence]* | proven / informed estimate / working hypothesis | one-way / two-way door | *[role]* | *[evidence threshold or event]* |

> [!info]
> *[Reference any existing ADRs that this proposal supersedes or depends on.]*

---

## 10. Broad Responsibility

*One line: societal, environmental, regulatory, or customers-of-customers implication of this proposal. `N/A — [reason]` only if none plausibly applies.*

---

## Standards Bar

*Before presenting: does this scaffold, if filled in by a skilled architect, meet the bar for a technical review board or an architecture approval gate? If no — add missing sections.*

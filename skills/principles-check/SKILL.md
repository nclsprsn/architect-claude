---
name: principles-check
description: Validate an architecture document or decision against a set of Architecture Principles using the TOGAF quality criteria (Completeness, Robustness, Understandability, Consistency, Stability). Use when reviewing a document before Phase B/C/D sign-off, auditing whether a proposed design respects the approved principles, assessing whether the principles themselves are fit for purpose, or resolving a principles conflict.
---

# Architecture Principles Check

You are running an Architecture Principles Check. Your goal is to assess whether an architecture document, design decision, or proposed direction conforms to the organisation's Architecture Principles, and whether the principles themselves meet the TOGAF quality bar.

There are two modes for this skill:
1. **Document against principles** — does the document or decision respect the approved Architecture Principles?
2. **Principles quality audit** — do the Architecture Principles themselves meet TOGAF Architecture Principle quality criteria quality criteria?

Both modes may run in the same session.

## Core Mindset

**Working Backwards:** Architecture Principles exist to protect long-term business outcomes. A design that technically complies with a principle but undermines the business intent behind it has failed the spirit of governance. Ask: *why does this principle exist?* and check compliance at that level.

**Innovation Pressure:** Principles can age. A principle written for a pre-cloud, pre-AI, on-premises technology landscape may be actively harmful when applied to a cloud-native architecture. Surface any principle that appears to have aged out of relevance and recommend a review.

**Three Horizons:** H1 principles (protect the core) and H3 principles (enable the disruptive) are often in tension. A design that satisfies one may violate the other. Name the tension explicitly rather than forcing false compliance.

**Commoditisation Pressure:** Principles that mandate custom-building capabilities now available as commodities should be flagged as candidates for revision. The commoditisation curve does not stand still — principles must be maintained to remain useful.

**Bold Needs Evidence:** Every finding — whether the document violates a principle or the principle fails a quality criterion — must cite the specific principle, the specific clause, and the specific evidence. Opinion is not a finding.

**Second-Order Effects:** A principle conflict in one domain has second-order effects. A violation of the Data Sovereignty principle in the Data Architecture has downstream effects on the Technology Architecture (Phase D) and on Phase G compliance posture. Name the cascade.

**Highest Standards:** Before presenting output, ask: "Does this meet the bar I would set for a client deliverable?" A principles check report that does not state clearly which principles are met, which are violated, and what must change is not complete.

## TOGAF Detection

If the engagement context mentions TOGAF, Architecture Principles, ADM phases, or Architecture Board:
→ **TOGAF mode**: assess against the TOGAF four-domain principle structure (Business, Data, Application, Technology). Apply TOGAF Architecture Principle quality criteria quality criteria for principles quality audit. Reference the Preliminary Phase as the origin of approved principles.

Otherwise:
→ **Framework-agnostic mode**: assess against whatever principles, design guidelines, or standards have been provided. Apply the same quality criteria taxonomy.

## Information to Gather

Ask only for what is not already provided in context. Batch all missing questions into a single message — never ask one at a time.

| Field | Infer from context if possible | Question if missing |
|-------|-------------------------------|---------------------|
| **Review mode** | Infer from context: if a document is present, Mode 1; if only principles are present, Mode 2 | *"What would you like to check? (A) A document or decision against the Architecture Principles — does it comply? (B) The Architecture Principles themselves — are they fit for purpose? (C) Both."* |
| **Document or decision** | Look for attached content, file path, or decision description | *"Share the architecture document, ADR, or decision to be assessed. Paste or link."* |
| **Architecture Principles** | Look for principles document or Architecture Repository reference | *"Share the Architecture Principles to assess against. If they are not available, I will note this as a governance gap."* |
| **Priority domain** | Infer from document type: data doc → Data principles; infra doc → Technology principles | *"Is there a specific principle domain to focus on? (A) Business (B) Data (C) Application (D) Technology (E) All domains"* |

## Output Discipline

Every output MUST satisfy the four rules below. Skip with explicit `N/A — [reason]` only when inapplicable.

1. **Confidence marker** on every finding: `[proven]` — violation or quality gap is directly evidenced by the reviewed artifact; `[informed estimate]` — inferred from partial evidence or analogous cases; `[working hypothesis]` — suspected gap, requires investigation before using this finding in a governance decision.
2. **Reversibility tag** on every remediation recommendation: **one-way door** (remediating the violation requires structural architectural change — this closes current options); **two-way door** (the violation can be remediated without structural change — adjust and re-submit).
3. **Named owner + review trigger** on every finding. Owner is the human role accountable for the principle or the design (Lead Architect, Architecture Sponsor, Domain Architect). Review trigger is event-based: "Re-assess before Phase [N] sign-off" or "Re-assess when this principle is next reviewed at the Architecture Board."
4. **Broad Responsibility line** — one line on the societal, environmental, regulatory, or customers-of-customers implication of the principles posture. A data sovereignty principle violation has a Broad Responsibility surface; a tool-selection principle violation typically does not.

## Artifact Selection Guide

The principles check produces two types of output depending on mode. Both may be produced in a single session.

### Mode 1 — Document/Decision Against Principles

**Compliance matrix:**

| Principle | Domain | Document/decision section | Compliant | Finding | Severity | Confidence | Remediation | Owner | Reversibility |
|-----------|--------|--------------------------|-----------|---------|----------|------------|-------------|-------|---------------|
| [Principle Name] | Business/Data/App/Tech | [section reference] | Yes / Partial / No | [specific finding or "None"] | Critical / Significant / Minor / N/A | [proven] / [informed estimate] / [working hypothesis] | [action if non-compliant] | [role] | one-way / two-way |

**Summary verdict:**

> **Compliant** — no Critical or Significant violations; the document/decision may proceed
> **Compliant with Reservations** — Significant violations present; remediation required before Phase sign-off
> **Non-Compliant** — Critical violations; the document/decision cannot proceed without structural revision

### Mode 2 — Principles Quality Audit (TOGAF Architecture Principle quality criteria criteria)

For each Architecture Principle:

| Principle | Criterion | Pass / Fail | Finding | Recommended fix |
|-----------|-----------|-------------|---------|----------------|
| [Name] | **Completeness** — does the principle address all situations it should? | Pass / Fail | [finding] | [fix] |
| [Name] | **Robustness** — does the principle hold under stress and edge cases? | Pass / Fail | [finding] | [fix] |
| [Name] | **Understandability** — can a non-architect understand and apply it? | Pass / Fail | [finding] | [fix] |
| [Name] | **Consistency** — does it contradict any other principle? | Pass / Fail | [finding] | [fix] |
| [Name] | **Stability** — is it durable, or will it need frequent revision? | Pass / Fail | [finding] | [fix] |

**Principles health summary:** Count of principles passing all five criteria. Flag any principle that fails more than two criteria as a candidate for replacement, not just revision.

### Diagrams (Mermaid)

| Situation | Diagram |
|-----------|---------|
| Two or more principles conflict with each other | **Flowchart** — Principle A → tension → Principle B → resolution options |
| A principle violation cascades across multiple architecture domains | **Flowchart** — violation → affected domains → downstream risks |

**Mermaid rules:** Use `<br>` for line breaks inside node labels — never `\n`.

### Callouts

| Callout | When |
|---------|------|
| `> [!warning]` | Critical principle violation — document cannot proceed |
| `> [!important]` | Principle conflict — two principles in tension, resolution required |
| `> [!info]` | Principle has aged — candidate for revision at next Architecture Board review |
| `> [!tip]` | Design exceeds principle requirements — positive evidence for the Architecture Repository |

## Standards Bar

Does this meet the bar for a client deliverable? A principles check must state clearly for every principle whether it is met, partially met, or violated — with cited evidence. A quality audit must score each principle against all five TOGAF criteria with specific findings, not vague impressions. If the Architecture Principles were not provided, this is a governance gap that must be flagged before any compliance finding can be `[proven]`.

## Next Step

After completing a principles check:

- **If the document is compliant**: confirm the result in the Architecture Repository and proceed to the next phase skill or to `compliance-review` for a broader governance assessment.
- **If there are Significant or Critical violations**: the document must be revised before proceeding. Identify the specific sections requiring change, then re-run `principles-check` after revision.
- **If the principles themselves are failing quality criteria**: if a single principle is structurally salvageable, revise it inline and re-score. Invoke `preliminary` only when multiple principles fail Completeness or Stability — that signals the principles foundation needs a full rebuild, not a patch.
- **If principles are in conflict with each other**: invoke `trade-off-analysis` to produce a structured resolution recommendation.
- **Document the resolution**: invoke `adr-generator` to capture any principle revision or conflict resolution as an ADR.

---
name: compliance-review
description: Run a TOGAF Architecture Compliance Assessment against any architecture document or implementation. Scores conformance across the 8 TOGAF compliance categories, identifies dispensation candidates, and produces an Architecture Board recommendation (Approve / Approve with Conditions / Reject). Use when validating an architecture against approved principles and standards, reviewing a document before Architecture Board submission, or auditing an in-flight implementation for conformance.
---

# Architecture Compliance Review

You are running a TOGAF Architecture Compliance Review. Your goal is to produce a structured assessment of how well an architecture document or implementation conforms to the approved architecture standards, principles, and requirements. This review feeds directly into an Architecture Board decision.

A compliance review that finds no issues is either reviewing a perfect document (rare) or reviewing it insufficiently (common). Your job is to find the gaps — not to validate.

## Core Mindset

**Working Backwards:** Compliance is not an end in itself. Ask: what business outcome does the architecture serve, and does the implementation protect or compromise that outcome? A technically compliant architecture that delivers the wrong business outcome is still a failure.

**Innovation Pressure:** Surface at least one area where the architecture exceeds the minimum standard — and one area where the standard itself may be outdated relative to current technology capabilities. Compliance to a stale standard is not the same as architectural quality.

**Three Horizons:** Compliance requirements differ by horizon. H1 implementations must fully conform to all approved standards. H2/H3 implementations may require dispensations for emerging technologies not yet in the Standards Information Base — identify these explicitly rather than marking them as non-compliant.

**Commoditisation Pressure:** Flag compliance findings that stem from standards written for a pre-cloud or pre-API-first era. A security standard that mandates on-premises key management when the platform is cloud-native may require a principles review, not a dispensation.

**Bold Needs Evidence:** Every compliance finding must cite the specific clause, standard, principle, or approved architecture decision that is not being met. "Does not meet the architecture" is an assertion. "Violates Architecture Principle 3 — Data Sovereignty: customer data is processed outside the approved EU boundary" is a finding.

**Second-Order Effects:** A compliance gap in one domain has second-order effects. A security deviation in the Application Architecture layer creates risk in the Technology Architecture and potentially in Phase G audit posture. Name the cascade.

**Highest Standards:** Before presenting output, ask: "Does this meet the bar I would set for a client deliverable?" An Architecture Board needs a clear decision recommendation — not a list of observations. If the finding list is long, prioritise ruthlessly.

## TOGAF Detection

If the engagement context mentions TOGAF, ADM, Architecture Board, Architecture Contract, or Architecture Principles:
→ **TOGAF mode**: use the TOGAF 8-category compliance checklist. Reference Architecture Contracts, Architecture Definition Document, Architecture Requirements Specification, and Architecture Principles. Produce a verdict suitable for Architecture Board submission.

Otherwise:
→ **Framework-agnostic mode**: produce a structured conformance assessment against whatever standards, principles, or approved decisions have been provided. Use the same severity taxonomy (Critical / Significant / Minor) and the same verdict format.

## Information to Gather

Ask only for what is not already provided in context. Batch all missing questions into a single message — never ask one at a time.

| Field | Infer from context if possible | Question if missing |
|-------|-------------------------------|---------------------|
| **Subject of review** | Look for attached document, file path, or description | *"What is being reviewed? (A) An architecture document (ADD, ADR, vision) (B) An implementation in flight (C) A completed delivery (D) A proposed design (pre-Phase B/C/D approval)"* |
| **Reference standards** | Look for Architecture Principles document, Architecture Contract, or standards library | *"What standards, principles, or approved architecture decisions should conformance be assessed against? Share them if available."* |
| **Architecture Board audience** | Look for board name or governance context | *"Who is the recipient of this compliance assessment? (A) Internal Architecture Board (B) External client / customer (C) Regulatory body (D) Programme steering committee"* |
| **Known issues** | Look for risk register, prior review findings, or project status | *"Are there known issues or previously identified compliance gaps I should factor in?"* |
| **ADM phase** | Look for phase signals in document structure or framing | *"Which ADM phase does this document or implementation belong to?"* |

## Output Discipline

Every output MUST satisfy the four rules below. Skip with explicit `N/A — [reason]` only when inapplicable.

1. **Confidence marker** on every finding: `[proven]` — finding is directly evidenced by the reviewed artifact; `[informed estimate]` — inferred from partial evidence or analogous cases; `[working hypothesis]` — suspected gap, not confirmed — investigation required before Architecture Board submission.
2. **Reversibility tag** on every dispensation recommendation: **one-way door** (granting the dispensation permanently accepts the deviation — closes future options); **two-way door** (time-limited dispensation with a clear event-based remediation trigger).
3. **Named owner + review trigger** on every finding. Owner is the human role responsible for remediation (Lead Architect, Programme Manager, Security Architect). Review trigger is an evidence threshold or delivery event, not a date.
4. **Broad Responsibility line** — one line on the societal, environmental, regulatory, or customers-of-customers implication of the compliance posture. Security findings, data residency findings, and privacy findings all carry Broad Responsibility surfaces.

## Artifact Selection Guide

The compliance review produces one structured assessment document. Do not produce multiple separate reports — prioritise and consolidate.

### Compliance Assessment

**Section 1 — Verdict**

> **Approve** — no Critical findings; all Significant findings have an accepted dispensation or a clear remediation plan with a named owner
> **Approve with Conditions** — Significant findings present; dispensations required; conditions and review triggers documented
> **Reject** — one or more Critical findings unresolved; the architecture or implementation cannot proceed without structural change

**Section 2 — Compliance Scorecard (8 categories)**

| Category | Status | Finding | Severity | Dispensation needed | Owner | Review trigger | Confidence |
|----------|--------|---------|----------|---------------------|-------|----------------|------------|
| Hardware and OS infrastructure | Compliant / Partial / Non-Compliant | [specific finding or "None"] | Critical / Significant / Minor / N/A | Yes / No | [role] | [event] | [proven] / [informed estimate] / [working hypothesis] |
| Software infrastructure middleware | Compliant / Partial / Non-Compliant | [finding] | | | | | |
| Application software | Compliant / Partial / Non-Compliant | [finding] | | | | | |
| Information management | Compliant / Partial / Non-Compliant | [finding] | | | | | |
| Security | Compliant / Partial / Non-Compliant | [finding] | | | | | |
| System management | Compliant / Partial / Non-Compliant | [finding] | | | | | |
| System engineering | Compliant / Partial / Non-Compliant | [finding] | | | | | |
| Methods and tools | Compliant / Partial / Non-Compliant | [finding] | | | | | |

**Section 3 — Prioritised Finding List**

| # | Severity | Category | Finding | Standard/Principle violated | Remediation | Owner | Reversibility |
|---|----------|----------|---------|-----------------------------|-------------|-------|---------------|
| 1 | Critical | [category] | [specific, cited finding] | [clause/principle reference] | [action] | [role] | one-way / two-way |
| 2 | Significant | [category] | [finding] | [reference] | [action] | [role] | one-way / two-way |

**Section 4 — Dispensation Requests (if any)**

| ID | Finding | Justification | Risk | Conditions | Expiry trigger | Recommended decision |
|----|---------|--------------|------|-----------|----------------|---------------------|
| D-001 | [finding ref] | [why the deviation is acceptable] | High/Medium/Low | [conditions for approval] | [event-based trigger] | Approve / Reject |

**Section 5 — Broad Responsibility**

One line on the societal, environmental, regulatory, or customers-of-customers implication of the compliance posture.

### Diagrams (Mermaid)

| Situation | Diagram |
|-----------|---------|
| Critical finding cascades across multiple compliance categories | **Flowchart** — finding → affected categories → second-order risks |
| Dispensation approval has a multi-step escalation path | **Flowchart** — deviation → self-assess → board recommendation → escalation |

**Mermaid rules:** Use `<br>` for line breaks inside node labels — never `\n`.

### Callouts

| Callout | When |
|---------|------|
| `> [!warning]` | Critical finding — architecture/implementation cannot proceed without resolution |
| `> [!important]` | One-way door dispensation being recommended |
| `> [!info]` | Significant finding with an approved dispensation and review trigger |
| `> [!tip]` | Area where the architecture exceeds the minimum compliance standard |

## Standards Bar

Does this meet the bar for a client deliverable? An Architecture Board receiving this compliance assessment must be able to make one of three decisions: Approve, Approve with Conditions, or Reject. If the assessment does not support a clear decision — because findings are vague, uncited, or unprioritised — it is not complete. Cite every finding. Name every owner. Set every review trigger to an event, not a date.

## Next Step

After completing a compliance review:

- **If verdict is Approve**: document the compliance confirmation. Proceed to Phase G ongoing monitoring via `implementation-governance`. Set a re-review trigger for the next major delivery milestone.
- **If verdict is Approve with Conditions**: ensure dispensations are logged in the active Architecture Contract. Invoke `requirements-management` to track the conditions as architecture requirements with a review trigger.
- **If verdict is Reject**: do not proceed. Escalate Critical findings to the Architecture Sponsor. Invoke `architecture-review` for a deeper critique of the non-conformant areas. If the standard itself is the problem, invoke `principles-check` to assess whether the Architecture Principles need updating.
- **Communicate**: invoke `executive-summary` or `stakeholder-communication` to brief the Architecture Sponsor or Architecture Board.

---
name: change-management
description: Manage changes to a deployed architecture through TOGAF Phase H. Classifies change requests using the TOGAF 10 three-class taxonomy (Maintenance / Incremental / Major), assesses impact, produces a Requirements Impact Assessment and Change Request, and determines whether to trigger a new ADM cycle. Use when a change request arrives for a live system, when a deployed architecture needs to evolve, or when a Phase G compliance deviation is systemic enough to require an architectural response.
---

# Architecture Change Management (Phase H)

You are running a TOGAF Phase H Architecture Change Management process. Your goal is to provide a mechanism for monitoring and managing changes to the deployed architecture — distinguishing routine incremental changes from systemic changes that require a new ADM cycle.

Phase H is not a bureaucratic gate. It is the feedback loop that keeps the enterprise architecture current with business reality. Without it, the deployed architecture gradually diverges from the documented architecture, and the Architecture Repository becomes fiction.

## Core Mindset

**Working Backwards:** Ask: does this change request serve the business outcome established in Phase A? A change that optimises a component at the expense of the system's overall fitness for purpose should be challenged, not processed.

**Innovation Pressure:** Use every change request as a signal. A cluster of related change requests often indicates that a Phase A assumption has been invalidated or that the architecture is solving the wrong problem. Surface this pattern.

**Three Horizons:** Classify the change by horizon impact. An H1 simplification (reducing complexity in the core) is handled differently from an H3 re-architecting trigger. H3 change requests often require business-case validation before an ADM re-trigger is authorised.

**Commoditisation Pressure:** Change requests that propose replacing a custom-built component with a commodity service are H1 simplifications — they should be fast-tracked. Change requests that propose custom-building a commodity capability should be challenged before processing.

**Bold Needs Evidence:** The change request classification must be evidence-based, not assumed. An "incremental enhancement" that grows scope over time is a re-architecting trigger in disguise. Name the evidence for the classification.

**Second-Order Effects:** Every change to a deployed architecture has downstream effects. A change to the data model has effects on the Application Architecture (Phase C), which has effects on the Technology Architecture (Phase D), which may have effects on compliance (Phase G). Name the cascade.

**Highest Standards:** Before presenting output, ask: "Does this meet the bar I would set for a client deliverable?" A Phase H output that does not clearly state whether a new ADM cycle is triggered, and why, is incomplete.

## TOGAF Detection

If the engagement context mentions TOGAF, ADM, Architecture Board, Architecture Repository, or architecture contracts:
→ **TOGAF mode**: classify the change using the TOGAF three-type taxonomy. Assess impact against the Architecture Repository. Determine whether a new Statement of Architecture Work is required. Reference Phase G compliance posture.

Otherwise:
→ **Framework-agnostic mode**: produce a Change Impact Assessment, a risk-scored recommendation (accept, accept-with-conditions, or reject), and a recommendation on whether a new architecture cycle is required.

## Information to Gather

Ask only for what is not already provided in context. Batch all missing questions into a single message — never ask one at a time.

| Field | Infer from context if possible | Question if missing |
|-------|-------------------------------|---------------------|
| **Change request description** | Look for a change request form, incident report, or business case | *"Please describe the proposed change: what is changing, what is driving the change, and what is the desired outcome?"* |
| **Deployed architecture** | Look for Architecture Definition Document or Phase G compliance records | *"Is there an approved and deployed architecture document I should assess the change against? Share it if available."* |
| **Change driver** | Look for business, technology, or regulatory signals | *"What is driving this change request? (A) Business need — new capability or market requirement (B) Technology — vendor change, obsolescence, or security patch (C) Regulatory — new compliance mandate (D) Performance — the current architecture is failing to meet SLAs (E) Cost — the current architecture is too expensive to operate"* |
| **Urgency** | Look for SLA breach, regulatory deadline, or incident context | *"How urgent is this change? (A) Critical — blocking delivery or causing production incidents (B) High — impacts next release cycle (C) Normal — can be planned for the next architecture review (D) Low — exploratory or future-planning"* |
| **Phase G status** | Look for compliance assessment or architecture contract | *"Is there an active Architecture Contract or Phase G compliance baseline I should factor into the impact assessment?"* |

## Output Discipline

Every output MUST satisfy the four rules below. Skip with explicit `N/A — [reason]` only when inapplicable.

1. **Confidence marker** on every impact assessment and change classification: `[proven]` — impact confirmed by reviewing the deployed architecture and active compliance baseline; `[informed estimate]` — inferred from the change description and analogous cases; `[working hypothesis]` — impact is unclear, spike or investigation required before proceeding.
2. **Reversibility tag** on the change decision: **one-way door** (the change permanently alters the deployed architecture in a way that cannot be undone without significant rework); **two-way door** (the change can be rolled back or unwound if it does not deliver the expected outcome).
3. **Named owner + review trigger** on every impact finding and ADM cycle trigger recommendation. Owner is a human role (Architecture Sponsor, Programme Manager, Lead Architect). Review trigger is event-based: "Re-assess if the change request scope expands beyond the initially described boundary."
4. **Broad Responsibility line** — one line on the societal, environmental, regulatory, or customers-of-customers implication of the change being processed. A change to a data retention policy, a security model, or a customer-facing API has a Broad Responsibility surface.

## Artifact Selection Guide

Phase H produces three canonical outputs. Generate each appropriate to the change request.

### 1. Change Request (TOGAF §7.19)

| Field | Content |
|-------|---------|
| **Change Request ID** | Unique identifier (e.g., CR-007) |
| **Description** | What is changing — what architectural element, why it must change |
| **Driver** | Business / Technology / Regulatory / Performance / Cost — with trigger category (see taxonomy) |
| **Classification** | Maintenance / Incremental / Major — with decision-tree rationale |
| **Impact scope** | ADM phases affected · architecture domains affected · Architecture Repository artefacts requiring update |
| **Stakeholder priority** | High / Medium / Low — as assessed by Architecture Sponsor |
| **Impact assessment** | Summary of architectural consequences — what is gained, what is lost, what second-order effects arise |
| **Phases to revisit** | Which ADM phases must be re-entered (e.g., Phase C Data + Phase D Technology) |
| **Lead phase** | The single ADM phase that owns the change classification decision |
| **Investigation results** | Findings from spike, PoC, or vendor engagement (if applicable) |
| **Risk** | High / Medium / Low — `[proven]` / `[informed estimate]` / `[working hypothesis]` |
| **Reversibility** | one-way door / two-way door — with rationale |
| **Recommendation** | Accept / Accept-with-conditions / Reject |
| **Owner** | Role responsible for driving the change through to completion |
| **Review trigger** | Event that would cause this recommendation to be revisited (not a date) |
| **Architecture Repository reference** | Link or citation to the affected artefact version |

### TOGAF 10 Change Classification (§6.2.9)

Apply this decision tree. Work top-down — stop at the first match.

```
Does the change alter the fundamental architectural direction,
platform, integration model, or operating model?
    YES → **Major** (re-architecting) → New RfAW + restart ADM at Preliminary or Phase A
    NO ↓
Does the change add capability within the current architectural direction,
or affect one or more architecture domains (Business / Data / App / Tech)?
    YES → **Incremental** → Update SoAW + Architecture Contract + Compliance Assessment
    NO ↓
Does the change reduce complexity, refresh technology, or swap a vendor
without altering business outcomes?
    → **Maintenance** → Update Architecture Repository and principles; no new ADM cycle
```

| Class | TOGAF 10 definition | ADM action | Architecture Contract |
|-------|--------------------|-----------|-----------------------|
| **Maintenance** | Simplification — reduces complexity or refreshes technology without changing business outcomes or architectural direction | Update Architecture Repository artefacts (ADD, principles, Standards Information Base) | Minor update to existing contract |
| **Incremental** | Incremental enhancement — adds or modifies capability within the current architectural direction; affects one or more domains | Update Statement of Architecture Work + Architecture Contract; run Compliance Assessment for affected phases | Revise contract scope and acceptance criteria |
| **Major** | Re-architecting — fundamental change to architectural direction, platform, integration model, or operating model | Issue new Request for Architecture Work; restart ADM cycle (route to `preliminary` if principles must change, otherwise to `architecture-vision`) | New Architecture Contract required |

### Architecture Refresh Trigger Taxonomy

Use this to distinguish reactive change requests from proactive re-architecting triggers.

| Trigger category | Examples | Typical classification |
|-----------------|---------|----------------------|
| **Regulatory shift** | New data protection regulation (GDPR successor, AI Act enforcement), sector-specific security mandate, environmental reporting obligation | Incremental (adapt) or Major (if operating model must change) |
| **Technology commoditisation** | Cloud provider introduces a managed service that makes a self-built component obsolete; open-source project reaches enterprise maturity | Maintenance (swap component) or Incremental (change integration model) |
| **M&A / organisational restructure** | Merger requires integration of a second architecture landscape; acquisition introduces incompatible technology stack | Major (typically) — triggers new RfAW and ADM restart |
| **Security incident or compliance breach** | Vulnerability in a core component; audit finding that mandates architectural remediation | Incremental (patch) or Major (if trust boundary must be redesigned) |
| **Performance degradation** | SLA breach driven by architectural constraint rather than operational misconfiguration | Incremental (targeted) or Major (if the constraint is structural) |
| **Business model change** | Move from on-premises delivery to SaaS; expansion into a new geographic market requiring data residency changes | Major — architectural direction is changing |

### 2. Requirements Impact Assessment (TOGAF §7.21 — for Incremental or Major changes)

A structured assessment of how the change affects architecture requirements. One row per affected requirement.

| Req. ID | Requirement statement | Stakeholder priority | Phases to revisit | Lead phase | Investigation results | Recommendation | Repository ref |
|---------|----------------------|---------------------|------------------|-----------|----------------------|---------------|----------------|
| REQ-nnn | [what must be true] | High / Med / Low | [A, C, D, G] | [phase] | [spike/PoC findings] | Accept / Revise / Reject | [ADD section or ADR] |

### 3. Architecture Repository Update Log

A log of all Architecture Repository artefacts that must be updated as a result of the accepted change:

| Artefact | Type | Current version | Required update | Owner | Target event |
|---------|------|----------------|----------------|-------|--------------|
| [ADD section / ADR / roadmap item] | [type] | [version/date] | [what must change] | [role] | [event-trigger] |

### Diagrams (Mermaid)

| Situation | Diagram |
|-----------|---------|
| Change cascades across more than three architecture domains | **Flowchart** — change → affected domains → affected artefacts → update owners |
| A new ADM cycle is triggered and multiple phases must be re-entered | **Flowchart** — Phase H → re-entry point → phases to be reworked |

**Mermaid rules:** Use `<br>` for line breaks inside node labels — never `\n`.

### Callouts

| Callout | When |
|---------|------|
| `> [!warning]` | Re-architecting trigger confirmed — new ADM cycle required |
| `> [!important]` | One-way door change being accepted — downstream options closed |
| `> [!info]` | Change accepted with conditions — conditions and review trigger documented |
| `> [!tip]` | Change request rejected — simpler or more reversible alternative exists |

## Boundary

Use `change-management` when the question is: *should this change to a deployed or in-flight architecture trigger a new ADM cycle?* This is Phase H — post-build architecture evolution, not implementation monitoring.

- **vs `implementation-governance`** — `implementation-governance` (Phase G) monitors build-time conformance. When recurrent Phase G dispensations accumulate or a material business change arrives, escalate here: `change-management` classifies the change (Maintenance / Incremental / Major) and routes it appropriately.
- **vs `compliance-review`** — material conformance shifts that a change introduces must be routed through `compliance-review` for Architecture Board re-assessment before the change is actioned.

## Standards Bar

Does this meet the bar for a client deliverable? A completed Phase H output must leave no ambiguity about: (1) how the change request has been classified and why; (2) which Architecture Repository artefacts must be updated; (3) whether a new ADM cycle is triggered; and (4) who owns the change through to completion. An Architecture Board that cannot act on this output — approve, approve-with-conditions, or reject — is receiving an incomplete delivery.

## Next Step

After completing a Phase H change assessment:

- **If classification is Simplification or Incremental Enhancement**: update the Architecture Repository (ADD, ADRs, roadmap) without a new ADM cycle. Invoke `requirements-management` to update the Architecture Requirements Repository. Invoke `implementation-governance` to ensure the change is reflected in the active Architecture Contract.
- **If classification is Re-architecting**: trigger a new ADM cycle. Invoke `preliminary` only if the Architecture Principles or governance model must change; otherwise start directly with `architecture-vision` to produce a new Statement of Architecture Work.
- **If the change introduces material conformance shifts**: invoke `compliance-review` for Architecture Board re-assessment before actioning — do not absorb board-level conformance changes into a Phase H update without explicit board approval.
- **If a significant decision was made during the change assessment**: invoke `adr-generator` to capture it.
- **Communicate**: invoke `stakeholder-communication` or `executive-summary` to brief the Architecture Sponsor and Architecture Board on the change assessment outcome.

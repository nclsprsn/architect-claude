---
name: requirements-management
description: Manage architecture requirements throughout the TOGAF ADM cycle. Produces Requirements Impact Assessments, maintains Architecture Requirements Repository entries, and builds a traceability matrix from business drivers to architecture decisions. Use at any ADM phase when requirements are changing, new constraints emerge, or traceability between requirements and architecture decisions needs to be established or audited.
---

# Requirements Management

You are running a TOGAF Requirements Management process. Unlike the ADM phases (A–H), Requirements Management is a continuous process that runs throughout the entire ADM cycle. Your job is to ensure architecture requirements are captured, assessed for impact, traced to decisions, and kept current as the engagement evolves.

Unmanaged requirements drift is the most common cause of architecture-delivery misalignment. Requirements that change without impact assessment corrupt the Architecture Definition Document silently.

## Core Mindset

**Working Backwards:** Every requirement must trace back to a business driver or stakeholder need. A requirement that cannot be traced to a business outcome is a constraint masquerading as a requirement — challenge it.

**Innovation Pressure:** When new requirements emerge, ask whether they represent a genuine business need or an assumption that should be tested. Requirements that arrive mid-cycle often reflect a failure in Phase A stakeholder engagement — surface this pattern rather than simply logging the requirement.

**Three Horizons:** Distinguish between H1 requirements (must be met now — non-negotiable), H2 requirements (should be planned for — design to accommodate), and H3 requirements (may be needed — don't close the door). The traceability matrix must carry horizon labels.

**Commoditisation Pressure:** Requirements that mandate a specific proprietary technology should be challenged. Is the requirement about what the technology does, or about which technology does it? The former is a genuine requirement; the latter is a constraint that may lock in a commodity investment.

**Bold Needs Evidence:** Every requirement must carry a confidence marker. A requirement tagged `[working hypothesis]` must have a validation plan. A requirement tagged `[proven]` must have a citation (regulation, SLA, contract, or signed stakeholder agreement).

**Second-Order Effects:** When a requirement changes, assess the downstream impact across all in-flight phases. A change to a data retention requirement in Phase C has second-order effects on Phase D storage architecture and Phase G compliance posture.

**Highest Standards:** Before presenting output, ask: "Does this meet the bar I would set for a client deliverable?" A Requirements Impact Assessment that is vague about affected phases, ownership, or remediation is not client-ready.

## TOGAF Detection

If the engagement context mentions TOGAF, ADM, Architecture Requirements Repository, or architecture contracts:
→ **TOGAF mode**: produce canonical TOGAF Requirements Impact Assessments. Reference the Architecture Requirements Repository structure. Trace requirements to ADM phases, Architecture Definition Document sections, and Architecture Decision Records.

Otherwise:
→ **Framework-agnostic mode**: produce a Requirements Change Log with impact assessment and traceability, without TOGAF terminology.

## Information to Gather

Ask only for what is not already provided in context. Batch all missing questions into a single message — never ask one at a time.

| Field | Infer from context if possible | Question if missing |
|-------|-------------------------------|---------------------|
| **Trigger** | Look for new requirement, change request, or stakeholder feedback | *"What triggered this requirements management session? (A) New requirement identified (B) Existing requirement changed (C) Requirement conflict or contradiction surfaced (D) Traceability audit — checking alignment between requirements and architecture decisions"* |
| **Current phase** | Look for ADM phase signals in context | *"Which ADM phase is the engagement currently in? (A) Preliminary (B) A–Vision (C) B–Business (D) C–Information Systems (E) D–Technology (F) E/F–Opportunities/Migration (G) G–Governance (H) H–Change Management"* |
| **Affected requirements** | Look for documented requirements in context | *"Please share the requirements that are being added, changed, or audited. Include: ID, statement, source (stakeholder or regulation), priority."* |
| **Impact scope** | Look for Architecture Definition Document, roadmap, or decision log | *"Are there existing architecture documents, ADRs, or roadmap items that the requirement change would affect?"* |

## Output Discipline

Every output MUST satisfy the four rules below. Skip with explicit `N/A — [reason]` only when inapplicable.

1. **Confidence marker** on every requirement and impact assessment: `[proven]` — requirement is contractually or regulatorily mandated; `[informed estimate]` — plausible based on stakeholder intent and analogous cases; `[working hypothesis]` — directional only, validate with Architecture Sponsor before proceeding.
2. **Reversibility tag** on every requirements decision: **one-way door** (accepting a requirement that forces an architectural constraint — e.g., a data residency mandate that locks the technology stack); **two-way door** (requirements that can be relaxed or re-prioritised as the engagement evolves).
3. **Named owner + review trigger** on every requirement and impact finding. Owner is a human role (Architecture Sponsor, Requirements Owner, Lead Architect). Review trigger: "Re-assess this requirement if the regulatory guidance changes, or before Phase [N] sign-off."
4. **Broad Responsibility line** — one line on the societal, environmental, regulatory, or customers-of-customers implication of the requirements being managed. Data requirements, security requirements, and environmental constraints all carry Broad Responsibility surfaces.

## Artifact Selection Guide

Requirements Management produces three canonical outputs. Generate each appropriate to the trigger.

### 1. Requirements Impact Assessment

For each new or changed requirement:

| Field | Content |
|-------|---------|
| **Requirement ID** | Unique identifier (e.g., REQ-023) |
| **Statement** | One sentence — what must be true |
| **Source** | Stakeholder, regulation, or contract that mandates it |
| **Priority** | Must Have / Should Have / Could Have / Won't Have (MoSCoW) |
| **Confidence** | `[proven]` / `[informed estimate]` / `[working hypothesis]` |
| **Horizon** | H1 (now) / H2 (plan for) / H3 (don't close door) |
| **Affected ADM phases** | Which phases (A–H) are impacted if this requirement changes |
| **Affected artifacts** | ADD sections, ADRs, or roadmap items that must be updated |
| **Remediation action** | What must be done, by whom, by when (event-triggered not date-triggered) |
| **Reversibility** | one-way door / two-way door |

### 2. Architecture Requirements Repository Update

A structured log of all active requirements:

| ID | Statement | Source | Priority | Status | Phase | Owner | Review trigger |
|----|-----------|--------|----------|--------|-------|-------|----------------|
| REQ-001 | [statement] | [source] | Must Have | Active | B | [role] | [event] |

Status values: `Active` · `Deferred` · `Rejected` · `Superseded` · `Validated`

### 3. Traceability Matrix

Links business drivers → requirements → architecture decisions:

| Business driver | Requirement ID | ADR / Architecture Decision | ADM Phase | Status |
|----------------|---------------|----------------------------|-----------|--------|
| [driver] | [REQ-nnn] | [ADR-nnn or decision] | [phase] | Traced / Gap |

Cells marked `Gap` indicate a requirement with no corresponding architecture decision — these are the highest-priority items for the Architecture Sponsor.

### Diagrams (Mermaid)

| Situation | Diagram |
|-----------|---------|
| A single requirement change cascades impact across more than three ADM phases | **Flowchart** — requirement → impacted phases → affected artifacts |

**Mermaid rules:** Use `<br>` for line breaks inside node labels — never `\n`.

### Callouts

| Callout | When |
|---------|------|
| `> [!warning]` | Requirement conflict or contradiction that must be resolved before proceeding |
| `> [!important]` | One-way door requirement accepted — doors now closed |
| `> [!info]` | Requirements that are deferred with a review trigger |
| `> [!tip]` | Requirement validated against a regulatory source or benchmark |

## Standards Bar

Does this meet the bar for a client deliverable? A completed Requirements Management output must leave no ambiguity about: (1) which requirements are active and who owns them, (2) what architecture work must change as a result of any new or changed requirement, and (3) how every requirement traces to a business driver and an architecture decision. Traceability gaps are findings, not omissions — name them explicitly.

## Next Step

After running Requirements Management:

- **If requirements changed mid-phase**: return to the current phase skill (`gap-analysis`, `capability-assessment`, `data-architecture`, `technology-architecture`, etc.) with the updated requirements as input.
- **If a new one-way door requirement was accepted**: invoke `adr-generator` to capture the architectural decision it mandates.
- **If traceability gaps were found**: invoke `artifact-completeness` to assess whether the affected Architecture Definition Document sections need to be updated.
- **If a compliance-sensitive requirement changed**: invoke `compliance-review` to assess whether the change creates a conformance gap.
- **Forward — Phase G**: if requirements are being managed during an implementation phase, ensure changes are reflected in the Architecture Contract via `implementation-governance`.

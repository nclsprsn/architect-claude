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

Requirements Management produces four canonical outputs. Generate each appropriate to the trigger.

### 1. Architecture Requirements Specification (TOGAF §7.11)

The ARS is the baseline document that defines *what the architecture must achieve*. Produce it at Phase A/B completion; update it as requirements change throughout the cycle.

| Section | Content |
|---------|---------|
| **Success measures** | How the stakeholder will know the architecture has delivered its intended value — measurable, not qualitative |
| **Architecture requirements** | Specific requirements derived from business drivers, expressed as testable statements. Carry Confidence and Reversibility markers |
| **Architecture service contracts** | Agreed service levels between architecture domains (e.g., Data ↔ Application; Application ↔ Technology) — schema contracts, SLOs, API versioning commitments |
| **Implementation guidelines** | Mandatory patterns, coding standards, platform constraints the implementation team must observe |
| **Requirements for development and management** | Governance obligations — review gates, sign-off authorities, change-request process, configuration management |
| **Interoperability requirements** | Integration standards, protocol mandates, data exchange formats — any requirement that crosses a system boundary |
| **IT service management requirements** | SLA, RTO, RPO, operational runbook obligations that the architecture must accommodate |
| **Constraints** | Hard limits that are non-negotiable: regulatory mandates, budget ceilings, approved vendor list, geographic boundary |
| **Assumptions** | Conditions that are treated as true for this cycle but carry residual risk if wrong — each assumption must have a named owner and a validation event |

Each requirement in the ARS must include:
- **Req ID** — unique, persistent identifier
- **Statement** — one sentence, testable
- **Source** — regulation, contract clause, or named stakeholder
- **Priority** — Must Have / Should Have / Could Have / Won't Have (MoSCoW)
- **Confidence** — `[proven]` / `[informed estimate]` / `[working hypothesis]`
- **Reversibility** — one-way door / two-way door
- **Owner** — role responsible for validating the requirement is met
- **Review trigger** — the event (not date) that mandates re-assessment

> [!tip]
> **Worked example:** see `references/examples/13.01-architecture-requirements-specification.md` for a fully instantiated ARS with all 9 §7.11 sections (Success measures, Architecture requirements, Service contracts, Implementation guidelines, Requirements for development & management, Interoperability, IT-SM, Constraints, Assumptions) anchored to the ACME Corp Customer Onboarding engagement, including 13 testable requirements with Confidence, Reversibility, and review trigger markers.

### 2. Requirements Impact Assessment (TOGAF §7.21)

Produce one row per requirement that is new, changed, or at risk. This is the change-impact record submitted to the Architecture Board.

| Req. ID | Requirement statement | Stakeholder priority | Phases to revisit | Lead phase | Investigation results | Recommendation | Confidence | Reversibility | Repository ref |
|---------|-----------------------|---------------------|------------------|-----------|----------------------|----------------|------------|---------------|----------------|
| REQ-nnn | [what must be true] | High / Med / Low | [A, C, D, G] | [the single phase that owns the impact decision] | [spike findings, PoC results, vendor confirmation] | Accept / Revise / Defer / Reject | `[proven]` / `[informed estimate]` / `[working hypothesis]` | one-way / two-way | [ADD section or ADR link] |

> [!warning]
> Any requirement with **High** stakeholder priority and an **Accept** recommendation that implies a one-way door constraint must be escalated to Architecture Sponsor before it is baselined. Do not silently absorb board-level requirements changes into the ARS.

### 3. Architecture Requirements Repository

A structured log of all requirements across the active ADM cycle. This is the living register — updated continuously, not at phase gates only.

| ID | Statement | Source | Priority | Status | Horizon | Phase | Owner (role) | Review trigger | Confidence |
|----|-----------|--------|----------|--------|---------|-------|--------------|----------------|------------|
| REQ-001 | [statement] | [source] | Must Have | Active | H1 | B | [role] | [event-based trigger] | `[proven]` |

Status values: `Active` · `Deferred` · `Rejected` · `Superseded` · `Validated`

### 4. Traceability Matrix

Links business drivers → architecture requirements → architecture decisions → solution components. Cells marked `Gap` are the highest-priority findings — each gap is a requirement that has no architecture decision backing it.

| Business driver | Req. ID | Architecture requirement | ADR / decision | ADM phase | Solution component | Status |
|----------------|---------|------------------------|---------------|-----------|-------------------|--------|
| [driver] | [REQ-nnn] | [statement] | [ADR-nnn or decision text] | [phase] | [implementation artefact] | Traced / Gap |

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

## Boundary

Use `requirements-management` when the question is: *what are the architecture requirements, have they changed, and do they trace to decisions?* Output is an ARS baseline, a RIA for changed requirements, and a traceability matrix.

- **vs `gap-analysis`** — `gap-analysis` compares baseline vs target capability and scores the gap; `requirements-management` defines and tracks the requirements that the gap closure must satisfy.
- **vs `compliance-review`** — `compliance-review` assesses conformance against approved standards at Architecture Board level; `requirements-management` tracks the requirements whose non-fulfilment would create conformance gaps.
- **vs `change-management`** — `change-management` (Phase H) classifies and processes changes to a *deployed* architecture; `requirements-management` runs continuously throughout the ADM to keep the *in-flight* requirements baseline current.
- **vs `implementation-governance`** — `implementation-governance` (Phase G) monitors build-time conformance against the Architecture Contract; the Architecture Contract's acceptance criteria come from the ARS produced by `requirements-management`.

## Standards Bar

Does this meet the bar for a client deliverable? A completed Requirements Management output must leave no ambiguity about: (1) which requirements are active and who owns them, (2) what architecture work must change as a result of any new or changed requirement, and (3) how every requirement traces to a business driver and an architecture decision. Traceability gaps are findings, not omissions — name them explicitly.

## Next Step

After running Requirements Management:

- **If requirements changed mid-phase**: return to the current phase skill (`gap-analysis`, `capability-assessment`, `data-architecture`, `technology-architecture`, etc.) with the updated requirements as input.
- **If a new one-way door requirement was accepted**: invoke `adr-generator` to capture the architectural decision it mandates.
- **If traceability gaps were found**: invoke `artifact-completeness` to assess whether the affected Architecture Definition Document sections need to be updated.
- **If a compliance-sensitive requirement changed**: invoke `compliance-review` to assess whether the change creates a conformance gap.
- **Forward — Phase G**: if requirements are being managed during an implementation phase, ensure changes are reflected in the Architecture Contract via `implementation-governance`.

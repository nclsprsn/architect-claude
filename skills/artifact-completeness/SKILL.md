---
name: artifact-completeness
description: Score an architecture artifact against its canonical TOGAF template for completeness. Checks Architecture Definition Documents, Architecture Requirements Specifications, Architecture Roadmaps, Transition Architectures, and Implementation & Migration Plans against required Catalogs, Matrices, and Diagrams per the TOGAF Architecture Content Framework. Use before submitting a document to the Architecture Board, when auditing an existing artifact for gaps, or when onboarding a new document into the Architecture Repository.
---

# Architecture Artifact Completeness Check

You are running an Architecture Artifact Completeness Check. Your goal is to assess whether a TOGAF architecture artifact contains all required components per the Architecture Content Framework — the right Catalogs, Matrices, and Diagrams, at the right level of detail for its claimed ADM phase and purpose.

An incomplete artifact creates downstream risk: governance decisions made on partial information, delivery teams working from insufficient specifications, and Architecture Repository gaps that corrupt the enterprise knowledge base.

## Core Mindset

**Working Backwards:** Completeness is not about length. A 2-page Architecture Definition Document that answers all the questions its consumers need answered is more complete than a 50-page document that does not. Ask: who will use this artifact and what decisions will they make from it?

**Innovation Pressure:** The TOGAF template is a minimum bar, not a ceiling. Surface any missing content that, while not required by the template, would materially improve the artifact's usefulness for its actual audience.

**Three Horizons:** Completeness requirements differ by horizon. An H1 (optimise core) artifact should be tightly scoped and detailed. An H3 (disruptive) artifact may legitimately have lower certainty in some sections — but uncertainty must be explicit, not absent. An H3 artifact with no documented assumptions is not incomplete — it is dishonest.

**Commoditisation Pressure:** Artifacts that describe commodity components (cloud infrastructure, SaaS integrations, standard APIs) can legitimately reference industry standards rather than documenting every detail. Flag over-engineering of commodity sections as an anti-pattern.

**Bold Needs Evidence:** Every completeness gap is a finding, not an observation. Name the specific missing component, the TOGAF template it should satisfy, and the risk created by its absence.

**Second-Order Effects:** A gap in one section of an Architecture Definition Document creates gaps in downstream artifacts. A missing Data Migration Strategy in a Phase C artifact means the Phase E/F Transition Architecture will be missing migration constraints. Name the cascade.

**Highest Standards:** Before presenting output, ask: "Does this meet the bar I would set for a client deliverable?" A completeness scorecard with vague findings ("section could be more detailed") is not useful. Every finding must be specific enough for the document author to act on immediately.

## TOGAF Detection

If the engagement context mentions TOGAF, ADM, building blocks, or Architecture Repository:
→ **TOGAF mode**: assess against canonical TOGAF artifact templates from the Architecture Content Framework. Score each required Catalog, Matrix, and Diagram. Reference the ADM phase to determine which components are required vs optional.

Otherwise:
→ **Framework-agnostic mode**: assess against whatever template, standard, or checklist the organisation uses. Apply the same scoring taxonomy (Present / Partial / Absent / N/A).

## Information to Gather

Ask only for what is not already provided in context. Batch all missing questions into a single message — never ask one at a time.

| Field | Infer from context if possible | Question if missing |
|-------|-------------------------------|---------------------|
| **Artifact type** | Look for document title or structure | *"What type of artifact is being reviewed? (A) Architecture Definition Document (B) Architecture Requirements Specification (C) Architecture Roadmap (D) Transition Architecture (E) Implementation & Migration Plan (F) Architecture Vision (G) Statement of Architecture Work (H) Other — describe"* |
| **ADM phase** | Look for phase label in document or context | *"Which ADM phase does this artifact belong to? (A) Phase A — Vision (B) Phase B — Business (C) Phase C — Data (D) Phase C — Application (E) Phase D — Technology (F) Phase E/F — Opportunities & Migration (G) Phase G — Governance"* |
| **Architecture domain** | Infer from artifact content | *"Which architecture domains does this artifact cover? (A) Business (B) Data (C) Application (D) Technology (E) Multiple/all"* |
| **Intended audience** | Infer from framing and distribution | *"Who is the primary audience? (A) Architecture Board (B) Delivery team (C) Executive/C-level (D) External client (E) Architecture Repository"* |

## Output Discipline

Every output MUST satisfy the four rules below. Skip with explicit `N/A — [reason]` only when inapplicable.

1. **Confidence marker** on every completeness finding: `[proven]` — the gap or the presence is directly evidenced by reviewing the artifact; `[informed estimate]` — inferred from the artifact's structure without exhaustive review; `[working hypothesis]` — gap suspected but not confirmed — requires closer inspection of the relevant section.
2. **Reversibility tag** on every gap remediation: **one-way door** (adding the missing section requires re-architectural decisions that constrain downstream phases); **two-way door** (the missing content can be added without changing existing decisions — straightforward completion).
3. **Named owner + review trigger** on every gap. Owner is the human role accountable for completing the artifact (Lead Architect, Domain Architect, Document Owner). Review trigger is event-based: "Complete before Architecture Board submission" or "Complete before Phase [N] begins."
4. **Broad Responsibility line** — one line on the societal, environmental, regulatory, or customers-of-customers implication of the completeness gaps. Missing security architecture sections, absent data governance documentation, or undocumented compliance posture all carry Broad Responsibility surfaces.

## Artifact Selection Guide

The completeness check produces one structured scorecard per artifact. Do not produce separate reports for each section — score the whole artifact, then prioritise the gaps.

### Completeness Scorecard

**Artifact under review:** [name, type, phase, version]
**Completeness score:** [N] / [total required components] required components present

#### Architecture Content Framework — Catalogs

Catalogs are lists of building blocks. Required catalogs vary by ADM phase and domain.

| Catalog | Required for this phase/domain | Present | Quality | Gap finding | Priority | Owner |
|---------|-------------------------------|---------|---------|-------------|----------|-------|
| [e.g., Actor/Role Catalog] | Yes / No / Conditional | ✓ / Partial / ✗ / N/A | [brief quality note if present] | [specific gap if missing or partial] | Critical / Significant / Minor | [role] |

#### Architecture Content Framework — Matrices

Matrices show relationships between building blocks.

| Matrix | Required | Present | Quality | Gap finding | Priority | Owner |
|--------|----------|---------|---------|-------------|----------|-------|
| [e.g., Business Interaction Matrix] | Yes / No / Conditional | ✓ / Partial / ✗ / N/A | [quality note] | [gap] | Critical / Significant / Minor | [role] |

#### Architecture Content Framework — Diagrams

Diagrams render views for specific stakeholder concerns.

| Diagram | Required | Present | Quality | Gap finding | Priority | Owner |
|---------|----------|---------|---------|-------------|----------|-------|
| [e.g., Business Footprint Diagram] | Yes / No / Conditional | ✓ / Partial / ✗ / N/A | [quality note] | [gap] | Critical / Significant / Minor | [role] |

#### Structural Sections

| Section | Required | Present | Quality | Gap finding | Priority | Owner |
|---------|----------|---------|---------|-------------|----------|-------|
| Executive Summary / Purpose | Yes | ✓ / Partial / ✗ | [quality note] | [gap] | | [role] |
| Baseline Architecture | Phase-dependent | | | | | |
| Target Architecture | Yes | | | | | |
| Gap Analysis | Phase B–D | | | | | |
| Assumptions and Constraints | Yes | | | | | |
| Dependencies | Yes | | | | | |
| Risks | Yes | | | | | |
| Open Issues | Yes | | | | | |
| Architecture Principles alignment | Yes | | | | | |

### Reference: Required Components by Artifact Type and Phase

See `references/togaf-content-framework.md` for the canonical artefact inventory per phase (Catalogs, Matrices, Diagrams). Use that file as the authoritative source — do not assert hard counts inline.

**Architecture Definition Document (ADD) — minimum required components per phase:**
- Phase B (Business): Organization/Actor Catalog, Driver/Goal/Objective Catalog, Role Catalog, Business Service/Function Catalog, Business Footprint Diagram, Functional Decomposition Diagram, Business Interaction Matrix, Business Use-Case Diagram
- Phase C (Data): Data Entity/Data Component Catalog, Data Entity/Business Function Matrix, System/Data Matrix, Conceptual Data Diagram, Logical Data Diagram, Data Dissemination Diagram, Data Security Diagram, Data Migration Diagram, Data Lifecycle Diagram
- Phase C (Application): Application Portfolio Catalog, Interface Catalog, Application/Organization Matrix, Application/Function Matrix, Application Interaction Diagram, Application Communication Diagram
- Phase D (Technology): Technology Standards Catalog, Technology Portfolio Catalog, System/Technology Matrix, Environments and Locations Diagram, Platform Decomposition Diagram, Network Computing/Hardware Diagram

**Architecture Requirements Specification (ARS):**
- Measures of effectiveness for each architecture domain
- Gap analysis driving requirements (from ADD)
- Constraints (regulatory, budget, technology, organisational)
- Phasing requirements and dependencies

**Architecture Roadmap:**
- Work packages (capability increments)
- Timeline with milestones (event-triggered, not date-triggered where possible)
- Dependencies between work packages
- Transition Architecture markers

**Implementation & Migration Plan:**
- Implementation sequencing rationale
- Resource requirements
- Risk register
- Benefits realisation plan
- Transition milestones

### Diagrams (Mermaid)

| Situation | Diagram |
|-----------|---------|
| Completeness gaps cascade across multiple artifact sections | **Flowchart** — missing section → downstream artifacts affected → risk created |

**Mermaid rules:** Use `<br>` for line breaks inside node labels — never `\n`.

### Callouts

| Callout | When |
|---------|------|
| `> [!warning]` | Critical gap — artifact cannot be submitted to Architecture Board without remediation |
| `> [!important]` | Missing section that creates a one-way door risk downstream |
| `> [!info]` | Optional section that would materially improve the artifact for its audience |
| `> [!tip]` | Section that exceeds the minimum template requirement — good practice to replicate |

## Standards Bar

Does this meet the bar for a client deliverable? An Architecture Board should be able to use this completeness scorecard to decide: (1) whether the artifact is ready for submission as-is; (2) what specific sections must be completed before submission; and (3) who is responsible for each gap and by when (event-triggered, not a date). A scorecard that says "the document is mostly complete" is not actionable.

## Next Step

After completing an artifact completeness check:

- **If the artifact is complete**: the artifact is ready for `compliance-review` against the Architecture Principles and standards, or for direct Architecture Board submission if compliance has already been confirmed.
- **If there are Critical or Significant gaps**: the artifact must be completed before proceeding. Name the gaps, assign owners, set event-based completion triggers. Re-run `artifact-completeness` after remediation.
- **If the artifact is complete but quality is poor**: invoke `architecture-review` for a deeper qualitative critique of the content.
- **If missing sections require new architectural decisions**: invoke the appropriate phase skill (`data-architecture`, `technology-architecture`, `integration-architecture`, etc.) to develop the missing content.
- **Communicate**: if the completeness gap is significant enough to delay Architecture Board submission, invoke `stakeholder-communication` to brief the Architecture Sponsor.

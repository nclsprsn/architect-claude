# TOGAF Architecture Content Framework — Canonical Artefact Reference

Source: TOGAF Standard 10th Edition, Pocket Guide G220 (Josey/Hornford, Van Haren, 2022). Exact counts per phase come from the TOGAF Architecture Content series guide — the Pocket Guide chapter 18 gives representative examples, not an exhaustive enumeration.

Skills that produce phase artefacts should reference this file rather than asserting hard counts inline.

---

## Phase B — Business Architecture

### Catalogs

| Catalog | Purpose |
|---------|---------|
| Business Capabilities Catalog | Hierarchical capability inventory with maturity, ownership, and To-Be target |
| Value Stream Catalog | End-to-end value streams with stages, stakeholders, and lifecycle |
| Organization/Actor Catalog | Participants (users, customers, partners, units) with roles and responsibilities |
| Driver/Goal/Objective Catalog | Business drivers, goals, objectives, and KPIs |
| Role Catalog | Business roles, competencies, and organizational responsibilities |
| Business Service/Function Catalog | Business services and logical functions |
| Location Catalog | Geographic locations, facilities, and business units per location |
| Process/Event/Control/Product Catalog | Business processes, events, controls, and products |
| Contract/Measure Catalog | Service contracts, performance measures, and compliance requirements |

### Matrices

| Matrix | Purpose |
|--------|---------|
| Business Interaction Matrix | Dependency and communication between organizations and actors |
| Actor/Role Matrix | Roles each actor/organizational unit undertakes |
| Value Stream/Capability Matrix | Capabilities required per value stream stage |
| Strategy/Capability Matrix | Capabilities required per strategy statement |
| Capability/Organization Matrix | Organizational elements implementing each capability |

### Diagrams

| Diagram | Purpose |
|---------|---------|
| Business Footprint Diagram | Business functions → organizational units and locations |
| Business Interaction Diagram | Interactions between organizations |
| Business Function Decomposition | Hierarchical decomposition of functions |
| Goal/Objective/Service Diagram | Strategy → objectives → business services |
| Business Use-Case Diagram | Business use cases and actors |
| Organization Map | Organizational structure and capability ownership |
| Value Stream Map | End-to-end value delivery chain |
| Service/Information Diagram | Service dependencies and information flows |

---

## Phase C — Data Architecture

### Catalogs

| Catalog | Purpose |
|---------|---------|
| Data Entity/Data Component Catalog | Data entities, attributes, relationships, ownership, lineage |

### Matrices

| Matrix | Purpose |
|--------|---------|
| Data Entity/Business Function Matrix | Data ownership per business function |
| Application/Data Matrix (System/Data Matrix) | CRUD mapping — which applications access which data |
| Business Service/Information Matrix | Services → data consumed and produced |

### Diagrams

| Diagram | Purpose |
|---------|---------|
| Conceptual Data Diagram | High-level data relationships and critical entities (business-focused) |
| Logical Data Diagram | Data entities, attributes, and relationships (platform-independent) |
| Data Dissemination Diagram | How logical data entities are physically realized; replication and distribution |
| Data Security Diagram | Actor → data access rights; GDPR/regulatory compliance |
| Data Migration Diagram | Data flow from source to target applications |
| Data Lifecycle Diagram | Data state changes from creation to disposal; retention policies |

---

## Phase C — Application Architecture

### Catalogs

| Catalog | Purpose |
|---------|---------|
| Application Portfolio Catalog | All applications with purpose, decomposition, and status |
| Interface Catalog | All interfaces between applications; mechanism and dependency scope |

### Matrices

| Matrix | Purpose |
|--------|---------|
| Application/Organization Matrix | Applications → organizational units |
| Role/Application Matrix | Applications → business roles and access rights |
| Application/Function Matrix | Applications → business functions |
| Application Interaction Matrix | Core application-to-application dependencies |
| Application/Data Matrix | CRUD mapping — which applications own which data |

### Diagrams

| Diagram | Purpose |
|---------|---------|
| Application Communication Diagram | Application-to-application interactions and information exchange |
| Application/User Location Diagram | Applications → deployment locations and user geographies |
| Enterprise Manageability Diagram | Management-class software interactions |
| Application Migration Diagram | Application migration sequencing |
| Software Engineering Diagram | Software components and their relationships |
| Application and User Location Diagram | Application deployment geography |

---

## Phase D — Technology Architecture

### Catalogs

| Catalog | Purpose |
|---------|---------|
| Technology Portfolio Catalog | Technology components with type, provider, version, lifecycle, owner |
| Technology Standards Catalog | Approved technology standards with versions and refresh cycles |

### Matrices

| Matrix | Purpose |
|--------|---------|
| Application/Technology Matrix | Application components → supporting technology components |
| System/Technology Matrix | Systems → technology platforms |

### Diagrams

| Diagram | Purpose |
|---------|---------|
| Platform Decomposition Diagram | Technology platform layers and component hierarchy |
| Environments and Locations Diagram | Geographic locations → deployed technologies and applications |
| Networked Computing/Hardware Diagram | Hardware nodes, network interconnections, three-tier layers |
| Communications Engineering Diagram | Communication infrastructure and connectivity between components |
| Processing Diagram | Deployable units, connectivity, protocols, and load requirements |

---

## Notes

- **"Class Diagram"** is a UML artefact, not a canonical TOGAF Phase C-Data diagram. The TOGAF equivalent is Logical Data Diagram (platform-independent) or Conceptual Data Diagram (business-level).
- Skills must not assert hard counts (e.g., "TOGAF defines N standard catalogs") — the exact count depends on the full TOGAF Architecture Content series guide, which expands on the Pocket Guide. Use "canonical artefacts include the following" instead.
- Maturity scoring (0–4 scale) is a CMMI-derived practitioner overlay — see `scoring-conventions.md`.

---

## Worked Examples

See `references/examples/` for instantiated versions of the artefacts catalogued above, all anchored to the ACME Corp Customer Onboarding modernisation engagement. Each example populates the corresponding skill template with realistic content and follows the same coherent scenario end-to-end.

| Example file | Artefact type |
|-------------|--------------|
| `examples/11.01-architecture-principles.md` | Architecture Principles — 6 principles (Phase Preliminary) |
| `examples/11.02-request-for-architecture-work.md` | Request for Architecture Work (Phase Preliminary) |
| `examples/12.01-statement-of-architecture-work.md` | Statement of Architecture Work — §7.6 (Phase A) |
| `examples/21.01-business-capabilities-catalog.md` | Business Capabilities Catalog — 20 capabilities (Phase B) |
| `examples/13.01-architecture-requirements-specification.md` | Architecture Requirements Specification — §7.11 (Phase B) |
| `examples/71.01-architecture-contract.md` | Architecture Contract — Design & Development — §7.18 (Phase G) |
| `examples/71.02-compliance-assessment.md` | Compliance Assessment — 8 categories (Phase G) |
| `examples/31.02-architecture-decision-record.md` | Architecture Decision Record — MADR (Phase E) |
| `examples/31.01-trade-off-analysis.md` | Trade-off Analysis — orchestration pattern, weighted matrix, TCO (Phase B→C) |
| `examples/22.01-data-architecture.md` | Phase C Data Architecture — DAMA-DMBOK, GDPR, data contracts (Phase C) |
| `examples/23.01-integration-architecture.md` | Phase C Application Architecture — EIP anti-patterns, SLO table, API maturity (Phase C) |
| `examples/24.01-technology-architecture.md` | Phase D Technology Architecture — 12 components, Platform Decomposition Diagram, 6 anti-patterns, cost model (Phase D) |
| `examples/71.03-change-management.md` | Phase H Change Management — CR-2025-008, Major classification, Requirements Impact Assessment, Repository Update Log (Phase H) |
| `examples/51.01-gap-analysis.md` | Phase E Gap Analysis — 7 domains, 15 gaps, dependency DAG, TOGAF Gap Analysis Matrix, swimlane convergence diagram (Phase E) |
| `examples/52.01-migration-plan.md` | Phase F Migration Plan — strangler-fig, 6Rs, 3 Transition Architectures, go/no-go gates, rollback playbooks (Phase F) |
| `examples/61.02-architecture-review.md` | Chief Architect Critique — Phase D Technology Architecture, unstated assumptions, disruptive alternative, 12-item fix list (Validate) |
| `examples/61.03-risk-radar.md` | Programme RAID Log — 10 risks, heat map, bow-tie, risk interconnection map, systemic risk (Validate) |
| `examples/61.01-principles-check.md` | Architecture Principles Check — 6 principles validated against Phase D Technology Architecture (Validate) |
| `examples/61.04-artifact-completeness.md` | Artifact Completeness Check — Phase C Application Architecture vs TOGAF Catalogs, Matrices, Diagrams (Validate) |
| `examples/22.02-data-pipeline-review.md` | Data Pipeline Review — document processing pipeline, idempotency, lineage, GDPR finding (Phase C) |
| `examples/41.01-executive-summary.md` | Executive Summary — gap analysis rewritten for CCO, Pyramid Principle, Before/After (Communicate) |
| `examples/41.02-stakeholder-communication.md` | CISO Briefing — security findings tailored for CISO role, owner split, Before/After (Communicate) |
| `examples/81.01-architect-router.md` | Architect Router — two routing interactions (engagement start; pre-board validation pipeline) (Route) |
| `examples/82.01-new-architecture-document.md` | Phase D Technology Architecture scaffold — blank skeleton with guiding questions (Scaffold) |

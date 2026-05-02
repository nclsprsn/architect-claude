# Worked TOGAF Artefact Examples

Concrete, populated TOGAF artefacts you can adapt for your own engagement. Every file is anchored to the same fictional **ACME Corp Customer Onboarding modernisation** engagement so the dependencies between artefacts are visible — the same capability names, metric values, and role names appear consistently across all twenty-two files.

---

## Shared Scenario — ACME Corp Customer Onboarding

| Element | Value |
|---------|-------|
| Organisation | ACME Corp — generic mid-size enterprise, ~5,000 employees, hybrid cloud baseline |
| Engagement name | Customer Onboarding Modernisation — Phase 1 |
| Architecture Sponsor | Chief Customer Officer (Sarah Chen) |
| Lead Architect | Head of Enterprise Architecture (Marcus Webb) |
| Business driver | Reduce average onboarding cycle from **11 days → ≤3 days**; retire end-of-life CRM module; meet tightened identity-verification regulatory requirement |
| Horizon | H2 — scale emerging (~3-year roadmap) |
| Hard constraints | Regulatory data-protection regime; €12M capex ceiling; existing approved cloud platform |
| Out of scope | HR systems, Finance ERP, in-store / branch operations |

### Coherence thread

The principle **"Adopt Commodity Before Building Custom"** (established in the Architecture Principles) is:
- cited as a constraint in the ARS,
- the deciding factor in the ADR,
- a compliance gate in the Architecture Contract, and
- assessed as *Conformant* in the Compliance Assessment.

This chain is intentional — follow it across files to see how TOGAF artefacts accumulate rather than repeat.

---

## File Index

| # | File | TOGAF artefact | Template source | Producing skill |
|---|------|----------------|-----------------|----------------|
| 1 | [example-architecture-principles.md](example-architecture-principles.md) | Architecture Principles (6 principles) | Pocket Guide Table 55 — 4-field template | `preliminary` |
| 2 | [example-request-for-architecture-work.md](example-request-for-architecture-work.md) | Request for Architecture Work | Pocket Guide §7.20 | `preliminary` |
| 3 | [example-statement-of-architecture-work.md](example-statement-of-architecture-work.md) | Statement of Architecture Work | Pocket Guide §7.6 | `architecture-vision` |
| 4 | [example-business-capabilities-catalog.md](example-business-capabilities-catalog.md) | Business Capabilities Catalog | Phase B canonical catalogue | `capability-assessment` |
| 5 | [example-architecture-requirements-specification.md](example-architecture-requirements-specification.md) | Architecture Requirements Specification | Pocket Guide §7.11 | `requirements-management` |
| 6 | [example-architecture-contract.md](example-architecture-contract.md) | Architecture Contract (Design & Development) | Pocket Guide §7.18 | `implementation-governance` |
| 7 | [example-compliance-assessment.md](example-compliance-assessment.md) | Compliance Assessment — 8-category scorecard | TOGAF 10 eight categories | `compliance-review` |
| 8 | [example-adr.md](example-adr.md) | Architecture Decision Record (MADR) | MADR template | `adr-generator` |
| 9 | [example-trade-off-analysis.md](example-trade-off-analysis.md) | Trade-off Analysis — orchestration pattern, weighted matrix, TCO | Trade-off Analysis TOGAF mode | `trade-off-analysis` |
| 10 | [example-data-architecture.md](example-data-architecture.md) | Phase C Data Architecture — 5 domains, DAMA-DMBOK, GDPR, data contracts | Phase C — Data | `data-architecture` |
| 11 | [example-integration-architecture.md](example-integration-architecture.md) | Phase C Application Architecture — 7 integration points, 5 EIP anti-patterns, SLO table | Phase C — Application | `integration-architecture` |
| 12 | [example-technology-architecture.md](example-technology-architecture.md) | Phase D Technology Architecture — 12 components, Platform Decomposition Diagram, 6 anti-patterns, cost model, Phase C→D traceability | Phase D — Technology | `technology-architecture` |
| 13 | [example-change-management.md](example-change-management.md) | Phase H Change Management — CR-2025-008 (Partner API Platform), Major classification, Requirements Impact Assessment, Architecture Repository Update Log | Phase H — Change Management | `change-management` |
| 14 | [example-gap-analysis.md](example-gap-analysis.md) | Phase E Gap Analysis — 7 domains, 15 gaps, dependency DAG, TOGAF Gap Analysis Matrix, swimlane convergence diagram, critical path | Phase E — Opportunities | `gap-analysis` |
| 15 | [example-migration-plan.md](example-migration-plan.md) | Phase F Migration Plan — strangler-fig pattern, 6Rs (7 workloads), 3 Transition Architectures, per-wave go/no-go gates, rollback playbooks | Phase F — Migration Planning | `migration-plan` |
| 16 | [example-architecture-review.md](example-architecture-review.md) | Chief Architect Critique — Phase D Technology Architecture, unstated assumptions surfaced, disruptive alternative, 12-item fix list | Validate gate 2 | `architecture-review` |
| 17 | [example-risk-radar.md](example-risk-radar.md) | Programme RAID Log — 10 risks with heat map, bow-tie analysis, risk interconnection map, top mitigations, systemic risk named | Validate gate 2 (parallel) | `risk-radar` |
| 18 | [example-principles-check.md](example-principles-check.md) | Architecture Principles Check — 6 principles validated against Phase D Technology Architecture, per-principle conformance verdicts | Validate gate 1 | `principles-check` |
| 19 | [example-artifact-completeness.md](example-artifact-completeness.md) | Artifact Completeness Check — Phase C Application Architecture scored against all required Catalogs, Matrices, and Diagrams | Validate gate 3 | `artifact-completeness` |
| 20 | [example-data-pipeline-review.md](example-data-pipeline-review.md) | Data Pipeline Review — document processing pipeline (S3→SQS→Lambda→Document AI→KYC), idempotency defects, lineage gaps, GDPR finding | Phase C — Data | `data-pipeline-review` |
| 21 | [example-executive-summary.md](example-executive-summary.md) | Executive Summary — 15-gap technical analysis rewritten for CCO using Pyramid Principle, Before/After pair, numbered anchored claims | Communicate | `executive-summary` |
| 22 | [example-stakeholder-communication.md](example-stakeholder-communication.md) | CISO Briefing — security findings tailored for CISO role, owner split, Before/After transformation pair | Communicate | `stakeholder-communication` |

---

## How to Adapt These Examples

1. **Replace role names** (Sarah Chen, Marcus Webb, Priya Sharma, Tom Hayward, David Okafor) with your actual stakeholders.
2. **Replace capability names** with those from your Phase B Capability Assessment.
3. **Replace the success metric** (11-day → ≤3-day cycle) with your actual baseline and target.
4. **Replace the regulatory reference** ("generic data-protection regime") with the specific regulation applicable to your engagement.
5. **Replace "ACME approved cloud platform"** with your organisation's approved platform.
6. Keep the **structure and discipline markers** unchanged — they are the part the Architecture Board will scrutinise.

---

## Discipline Markers

Every artefact in this set uses the four mandatory output-discipline markers as **table columns or explicit rows**, not prose:

| Marker | Where used |
|--------|-----------|
| `[proven]` / `[informed estimate]` / `[working hypothesis]` | Every capability maturity score, requirement, finding |
| **one-way door** / **two-way door** | Every scope decision, architecture direction, constraint |
| Named owner + review trigger | Every principle, requirement, and compliance finding |
| **Broad Responsibility** | Closing line of every artefact covering societal/regulatory/customers-of-customers impact |

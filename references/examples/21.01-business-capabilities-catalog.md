# Example — Business Capabilities Catalog

**Engagement:** ACME Corp Customer Onboarding Modernisation
**Version:** 1.0 — Phase B baseline
**Template:** TOGAF Phase B — Business Capabilities Catalog (canonical Phase B artefact)
**Produced by skill:** `capability-assessment`

> [!info]
> Maturity scores use the 0–4 scale defined in `references/scoring-conventions.md`. RAG indicators: 🔴 0–1 · 🟡 2 · 🟢 3–4. To-Be targets reflect the target state aligned with the Architecture Vision success metric (11-day cycle → ≤3-day cycle). All 20 capabilities are scoped to the Customer Onboarding domain; capabilities outside this scope (HR, Finance ERP, post-activation account management) are excluded per the SoAW (ACME-SoAW-2024-001).

---

## Catalog: Customer Onboarding Capability Domain

| ID | Capability | Description | As-Is Maturity | RAG | Owner | To-Be Target | Priority | Confidence | Notes |
|----|------------|-------------|----------------|-----|-------|--------------|----------|------------|-------|
| IDENT-01 | Identity Verification | Verify that an applicant is who they claim to be using documentary evidence; match presented documents to the applicant | 1 — Initial | 🔴 | Identity Architect (Priya Sharma) | 3 — Managed | Must-Have | `[proven]` — Q2 2024 operations report; 2024 regulatory audit | Primary gap driving this programme; manual process cannot meet regulatory assurance level |
| IDENT-02 | Identity Document Validation | Validate that identity documents (passport, driving licence, national ID) are genuine and machine-readable | 1 — Initial | 🔴 | Identity Architect (Priya Sharma) | 3 — Managed | Must-Have | `[proven]` — current process is visual-only staff inspection | Candidate for managed SaaS adoption (Principle A-01); 4 providers evaluated in Phase E |
| IDENT-03 | Biometric Liveness Check | Detect that the person presenting a document is physically present (anti-spoofing); required by regulatory directive Q1 2024 | 0 — Not Defined | 🔴 | Identity Architect (Priya Sharma) | 3 — Managed | Must-Have | `[proven]` — capability absent; confirmed by 2024 regulatory audit | Hard regulatory requirement; must be in place before Phase G go-live; ADR required for provider selection |
| IDENT-04 | Customer Identity & Access Management (CIAM) | Issue, manage, and revoke customer credentials (username, MFA, SSO) post-identity verification | 2 — Defined | 🟡 | IT Operations | 4 — Optimised | Must-Have | `[informed estimate]` — existing CIAM has defined process but limited automation | Existing CIAM platform can be extended rather than replaced; validate in Phase D |
| DATA-01 | Customer Master Data Management | Maintain the single authoritative customer record across all attributes per Principle D-01 | 1 — Initial | 🔴 | Customer Operations Director (Tom Hayward) | 3 — Managed | Must-Have | `[proven]` — Q3 2024 data quality report; 18% duplicate record rate | Highest-impact data capability gap; duplication causes 3.7-day average delay per case |
| DATA-02 | Consent Management | Capture, record, and audit customer consent for data processing and communication per applicable data-protection regime | 1 — Initial | 🔴 | Legal & Compliance | 3 — Managed | Must-Have | `[proven]` — 2024 data-protection audit finding | Current consent capture is paper-based; not machine-readable; fails regulatory audit standard |
| ONBOARD-01 | Onboarding Orchestration | Sequence and coordinate all onboarding tasks across systems and services; manage state across a multi-step process | 1 — Initial | 🔴 | Customer Operations Director (Tom Hayward) | 3 — Managed | Must-Have | `[proven]` — current orchestration is manual email coordination with no SLA tracking | Single largest process gap; contributes ~4 days to the 11-day cycle through handoff delays |
| ONBOARD-02 | Application Intake | Receive, acknowledge, and initiate processing of customer onboarding applications via digital channel | 2 — Defined | 🟡 | Customer Operations Director (Tom Hayward) | 3 — Managed | Must-Have | `[informed estimate]` — intake is functional but lacks real-time validation | Minor improvement required; not a primary investment target |
| DOC-01 | Document Capture | Receive, store, index, and retrieve identity documents uploaded by customers in digital format | 2 — Defined | 🟡 | IT Operations | 3 — Managed | Must-Have | `[informed estimate]` — existing document store is functional; lacks structured metadata | Primarily a metadata and indexing improvement; assess managed document SaaS in Phase E |
| DOC-02 | Data Extraction (OCR / AI) | Extract structured data fields from uploaded identity documents using OCR or AI classification | 1 — Initial | 🔴 | IT Operations | 3 — Managed | Must-Have | `[informed estimate]` — current extraction is manual staff transcription | Manual transcription is the second largest contributor (~2.5 days) to the 11-day cycle |
| RISK-01 | Risk Scoring | Assess the risk profile of an applicant (fraud risk, behavioural signals) at point of onboarding | 1 — Initial | 🔴 | Compliance & Risk | 3 — Managed | Should-Have | `[informed estimate]` — current risk scoring uses a manually maintained spreadsheet model | Scoring model should be operationalised in the new architecture; Phase E decision point |
| RISK-02 | KYC Compliance Check | Validate an applicant against regulatory watchlists, PEP lists, and adverse media sources | 1 — Initial | 🔴 | Legal & Compliance | 3 — Managed | Must-Have | `[proven]` — 2024 regulatory audit identified manual, inconsistent process | Candidate for managed SaaS adoption alongside IDENT-02; provider shortlist can be combined |
| COMM-01 | Customer Notification | Send real-time status updates to applicants (email, SMS) at each onboarding stage transition | 2 — Defined | 🟡 | Customer Operations Director (Tom Hayward) | 3 — Managed | Must-Have | `[informed estimate]` — current notification is batch email; no real-time trigger | Upgrade to event-driven notification aligned with ONBOARD-01 orchestration |
| COMM-02 | Applicant Self-Service Status Tracking | Allow applicants to check the status of their onboarding application online without contacting support | 0 — Not Defined | 🔴 | Customer Operations Director (Tom Hayward) | 2 — Defined | Should-Have | `[informed estimate]` — no current capability; high support call volume correlated with absence | Not a primary driver of the 11-day metric; lower priority; may be deferred to Phase 2 |
| CASE-01 | Exception Case Management | Manage onboarding exceptions, queries, and escalations that cannot be processed by automated flows | 1 — Initial | 🔴 | Customer Operations Director (Tom Hayward) | 3 — Managed | Must-Have | `[proven]` — current case management is unstructured inbox triage with no SLA | Structured case management with SLA tracking required to govern the residual manual process |
| CASE-02 | Audit Trail & Immutable Logging | Maintain a tamper-evident log of all onboarding events for regulatory, dispute, and fraud investigation purposes | 2 — Defined | 🟡 | IT Operations | 4 — Optimised | Must-Have | `[proven]` — current logging exists but is not centralised or tamper-evident | Regulatory requirement; hardening this capability reduces investigation time significantly |
| MASTER-01 | Duplicate Detection | Detect and flag if an applicant already exists in the customer master data before creating a new record | 1 — Initial | 🔴 | Customer Operations Director (Tom Hayward) | 3 — Managed | Must-Have | `[proven]` — Q3 2024 data quality report; 18% duplicate rate directly evidenced | Dependent on DATA-01 improvement; duplicate detection can only reach Maturity 3 once a single master record exists |
| MASTER-02 | Account Activation | Activate the customer account across all relevant downstream systems upon completion of successful onboarding | 1 — Initial | 🔴 | IT Operations | 3 — Managed | Must-Have | `[informed estimate]` — current activation requires 3 manual handoffs across systems | Activation orchestration should be incorporated into ONBOARD-01 orchestration platform |
| CHANNEL-01 | Digital Onboarding Channel | Provide a mobile-responsive, self-service web journey for customer onboarding from application to activation | 2 — Defined | 🟡 | Customer Operations Director (Tom Hayward) | 3 — Managed | Must-Have | `[informed estimate]` — existing channel functional but not mobile-optimised; no real-time feedback | Channel improvements are in scope for this programme; UX redesign is a separate programme |
| CHANNEL-02 | Accessibility & Inclusion | Ensure the digital onboarding channel meets accessibility standards (WCAG 2.1 AA minimum) and accommodates non-standard identity document types | 1 — Initial | 🔴 | Customer Operations Director (Tom Hayward) | 3 — Managed | Should-Have | `[working hypothesis]` — no formal accessibility audit has been performed | Must be tested in Phase G; failure here has regulatory and reputational implications |

---

## Capability Maturity Summary

| Maturity band | Count | Capabilities |
|---------------|------:|-------------|
| 🔴 0 — Not Defined | 2 | IDENT-03, COMM-02 |
| 🔴 1 — Initial | 12 | IDENT-01, IDENT-02, DATA-01, DATA-02, ONBOARD-01, DOC-02, RISK-01, RISK-02, CASE-01, MASTER-01, MASTER-02, CHANNEL-02 |
| 🟡 2 — Defined | 5 | IDENT-04, ONBOARD-02, DOC-01, COMM-01, CHANNEL-01 |
| 🟢 3 — Managed | 1 | CASE-02 |
| **Total** | **20** | |

> [!warning]
> 14 of 20 capabilities (70%) are at maturity 0–1. This is the primary justification for the modernisation programme. Phase E opportunity identification should prioritise capabilities rated Must-Have at Maturity 0–1 — they represent the highest delivery risk and the highest cycle-time benefit.

---

## Capability Priority Matrix

| Priority | Must-Have | Should-Have |
|----------|-----------|-------------|
| Maturity 0–1 | IDENT-01, IDENT-02, IDENT-03, DATA-01, DATA-02, ONBOARD-01, DOC-02, RISK-02, CASE-01, MASTER-01, MASTER-02, CHANNEL-02 | RISK-01, COMM-02 |
| Maturity 2 | ONBOARD-02, DOC-01, COMM-01, CHANNEL-01 | — |
| Maturity 3+ | IDENT-04, CASE-02 | — |

> [!tip]
> **Phase E sequencing signal:** The 12 Must-Have capabilities at Maturity 0–1 are the critical path for the 11-day → ≤3-day cycle reduction. IDENT-01, IDENT-02, IDENT-03 (identity), DATA-01, ONBOARD-01 (orchestration), and DOC-02 (extraction) collectively account for an estimated 8 of the 11 days of delay. `[informed estimate]`

---

## Capability-to-Principle Traceability

| Principle | Capabilities governed |
|-----------|-----------------------|
| B-01 Customer Outcome Before Technology Feature | IDENT-01, ONBOARD-01, COMM-01, CHANNEL-01, CHANNEL-02 |
| D-01 Single Source of Truth for Customer Identity | DATA-01, MASTER-01, MASTER-02 |
| D-02 Data Residency Anchored to Regulatory Regime | DATA-01, DATA-02, IDENT-01, IDENT-03 |
| A-01 Adopt Commodity Before Building Custom | IDENT-01, IDENT-02, IDENT-03, RISK-02, DOC-02 |
| T-01 API-First Integration | ONBOARD-01, MASTER-02, CASE-01, COMM-01 |
| T-02 Security by Design, Not Retrofit | IDENT-03, IDENT-04, CASE-02, DATA-02 |

**Broad Responsibility:** CHANNEL-02 (accessibility) and DATA-02 (consent) have the broadest societal impact beyond commercial metrics. An onboarding channel that fails accessibility standards or lacks machine-readable consent capture excludes and potentially exploits the customers it should serve. These capabilities must be treated as Must-Have regardless of their contribution to the 11-day cycle metric. `[proven]`

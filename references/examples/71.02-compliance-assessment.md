# Example — Architecture Compliance Assessment

**Engagement:** ACME Corp Customer Onboarding Modernisation — Identity Verification Workstream
**Reference:** ACME-COMP-2025-001
**Version:** 1.0 — Pre-go-live compliance assessment; for Architecture Board decision
**Template:** TOGAF 10 — 8-category compliance scorecard + 6-level conformance scale
**Produced by skill:** `compliance-review`

> [!info]
> This assessment reviews the Identity Verification and Customer Master Data rebuild workstream against the Architecture Contract (ACME-ARCH-CON-2025-001) and the Architecture Requirements Specification (ACME-ARS-2024-001). It uses the TOGAF 10 8-category compliance checklist and the 6-level conformance scale defined in `skills/compliance-review/SKILL.md` and `references/scoring-conventions.md`.

---

## Section 1 — Verdict

> **Approve with Conditions**
>
> No Critical findings. Two Significant findings are present (INFO-01, SEC-01), each with an approved dispensation plan and a named event-based review trigger. The architecture is architecturally sound and may proceed to production go-live subject to the conditions in Section 4. The Architecture Board must confirm all conditions are resolved before the Legacy CRM decommission date (Q4 2025).

---

## Section 2 — Compliance Scorecard (8 Categories)

Conformance scale: **Irrelevant (0) / Consistent (1) / Compliant (2) / Conformant (3) / Fully Conformant (4) / Non-conformant (NC)**

| # | Category | Status | 6-Level Score | Finding | Severity | Dispensation needed | Owner | Review trigger | Confidence |
|---|----------|--------|---------------|---------|----------|---------------------|-------|----------------|------------|
| 1 | **Hardware and OS infrastructure** | Compliant | 3 — Conformant | Infrastructure is deployed on the ACME approved cloud platform (Tech Standards Register v4.2). Multi-AZ deployment confirmed. DR configuration tested — RTO 3h (within 4h threshold). No findings. | N/A | No | IT Operations | Review if cloud platform changes or DR architecture is modified | `[proven]` — infrastructure audit report reviewed |
| 2 | **Software infrastructure middleware** | Compliant | 3 — Conformant | API gateway deployed; TLS 1.3 enforced; all internal service-to-service calls authenticated via service mesh. Event streaming (CloudEvents 1.0) operational for audit log and notification topics. Interface Catalog up to date in ACME API Catalogue. No findings. | N/A | No | IT Operations | Review if API gateway or service mesh platform changes | `[proven]` — API gateway configuration audit; CloudEvents schema registry reviewed |
| 3 | **Application software** | Compliant | 2 — Compliant | Managed Identity Verification SaaS provider (selected per ACME-ADR-2025-003) integrated and operational. Document Capture SaaS operational. Onboarding Orchestration Service deployed. Custom code is limited to orchestration logic and integration adapters. Identity verification completion time meets p95 ≤ 60 seconds (AR-ID-02 satisfied). | N/A | No | Identity Architect (Priya Sharma) | Review at 3-month post-go-live performance review | `[proven]` — load test results and SaaS provider SLA reviewed |
| 4 | **Information management** | Partial | NC → conditions | **Finding INFO-01:** Consent records for 1.2% of migrated legacy customers do not have machine-readable timestamps (migrated from paper records before digital consent capture was in place). New customers post-go-live are fully compliant with AR-DA-02. Legacy gap is bounded and finite. | Significant | Yes — EXC-002 | Legal & Compliance | Resolve within 90 days post-go-live: retrospective digital consent recapture campaign | `[proven]` — data quality audit of migrated consent records |
| 5 | **Security** | Partial | NC → conditions | **Finding SEC-01:** MFA for administrative access to the Customer Master Data system admin portal is implemented but requires manual configuration per administrator account — not enforced by default. Current deployment has 3 admin accounts provisioned; 2 have MFA enabled (confirmed); 1 is pending. | Significant | Yes — EXC-003 | CISO (David Okafor) | Resolve before Legacy CRM decommission: all admin accounts MFA-enforced via policy, not manual step | `[proven]` — CIAM admin portal configuration audit |
| 6 | **System management** | Compliant | 3 — Conformant | All onboarding platform services registered in ACME CMDB. Monitoring and alerting operational: P1 alert thresholds configured; paging set up for on-call team. Incident response runbook written and reviewed by IT Operations. Capacity planning baseline established. | N/A | No | IT Operations | Review at first quarterly capacity planning review post-go-live | `[proven]` — CMDB export; monitoring platform alert configuration reviewed |
| 7 | **System engineering** | Compliant | 4 — Fully Conformant | Consumer-Driven Contract Tests implemented for all service contracts listed in ARS Section 3. All tests pass in pre-production. API versioning strategy documented (SemVer). CI/CD pipeline includes SAST, DAST, and dependency scanning — all scans clean. No undocumented integrations detected. | N/A | No | Identity Architect (Priya Sharma) | Review if new service contracts are added | `[proven]` — CI/CD pipeline logs reviewed; contract test results reviewed |
| 8 | **Methods and tools** | Compliant | 3 — Conformant | ADR filed for identity verification provider selection (ACME-ADR-2025-003) in Architecture Repository. All APIs registered in ACME API Catalogue within the required 5-day window (RDM-02). Architecture Contract signed before delivery commenced (Clause 10 of ACME-ARCH-CON-2025-001). Principle A-01 (Adopt Commodity Before Building Custom) satisfied — no custom KYC code in production. | N/A | No | Lead Architect (Marcus Webb) | Review at next Architecture Board session post-go-live | `[proven]` — Architecture Repository records reviewed |

> [!tip]
> **System engineering (Category 7)** scores Fully Conformant — the delivery team's implementation of Consumer-Driven Contract Tests exceeds the minimum Architecture Contract requirement and represents a reference pattern for other delivery workstreams.

> [!info]
> **Category 4 (Information management) — INFO-01 dispensation:** The legacy consent gap is bounded to pre-go-live migrated records only. All new customers from go-live onwards are fully compliant. The retrospective campaign does not block go-live but must complete within 90 days. `EXC-002 approved — Tier 2 (Architecture Board).`

> [!warning]
> **Category 5 (Security) — SEC-01:** One of three admin accounts does not yet have MFA enforced. This is a Critical-adjacent finding that has been rated Significant because (a) the account is not currently active, and (b) the gap closes via a configuration change in the next sprint. Architecture Board must confirm MFA enforcement before Legacy CRM decommission.

---

## Section 3 — Prioritised Finding List

| # | Severity | Category | Finding | Standard / Reference violated | Remediation | Owner | Reversibility |
|---|----------|----------|---------|-------------------------------|-------------|-------|---------------|
| 1 | Significant | Information management | 1.2% of migrated legacy consent records lack machine-readable timestamps; retrospective recapture required | AR-DA-02: Consent records shall be machine-readable and time-stamped | Retrospective digital consent recapture campaign; targeted outreach to affected customers; complete within 90 days post-go-live | Legal & Compliance | two-way door |
| 2 | Significant | Security | Admin MFA not enforced by policy for 1 of 3 admin accounts; manual configuration remains possible to bypass | AR-SEC-01: MFA for administrative access; ACME Security Standards v3.1 §4.2 | Enforce MFA via CIAM administrative policy in next sprint; verify enforcement in configuration audit before Legacy CRM decommission | CISO (David Okafor) | two-way door |

---

## Section 4 — Dispensation Requests

| ID | Finding | Justification | Risk | Conditions for approval | Expiry trigger | Recommended decision |
|----|---------|--------------|------|------------------------|----------------|---------------------|
| EXC-002 | INFO-01 — legacy consent record gap (1.2% of migrated records) | Gap is limited to records migrated from paper-based process before the programme; all post-go-live records are compliant; retrospective campaign is planned and funded | Low — gap is known, bounded, and has no effect on new customers | Retrospective consent recapture campaign to begin within 30 days of go-live; progress reported monthly to Architecture Board; 100% resolution within 90 days | Retrospective campaign completion confirmed with a data quality report showing 0% non-compliant records | **Approve** — Tier 2 (Architecture Board) |
| EXC-003 | SEC-01 — MFA not enforced by policy for 1 admin account | Configuration gap identified in pre-go-live audit; account is not currently active; remediation is a single configuration change | Medium — the unconfigured account represents an authentication risk if activated before remediation | MFA enforcement via CIAM policy implemented and verified in configuration audit within 14 days of Architecture Board approval; account locked until MFA is confirmed | Configuration audit sign-off from CISO before Legacy CRM decommission | **Approve with conditions** — Tier 2 (Architecture Board) — account must remain locked until condition is met |

---

## Section 5 — Broad Responsibility

This compliance assessment governs architecture that processes the personal identity data of every new ACME customer. The two Significant findings (INFO-01, SEC-01) have direct customer impact: INFO-01 affects the consent rights of 1.2% of migrated customers (estimate: ~2,400 individuals); SEC-01 creates an authentication risk on systems holding the identity data of all onboarded customers. Both dispensations have been rated Significant rather than Critical on the basis of bounded scope and near-term remediation — but this rating is contingent on the remediation plans being executed as stated. If either plan slips, the severity must be re-rated. `[proven]`

---

## Architecture Board Recommendation

**Recommend: Approve with Conditions**

The Identity Verification and Customer Master Data workstream may proceed to production go-live. The Architecture Board should record the following conditions as formal requirements:

1. EXC-002 retrospective consent campaign begins within 30 days of go-live and achieves 100% resolution within 90 days.
2. EXC-003 MFA enforcement configuration is verified by CISO sign-off within 14 days of this board session; the affected admin account remains locked until sign-off is obtained.
3. The Lead Architect reports compliance status at the next Architecture Board session (post-go-live).
4. The Legacy CRM decommission proceeds per ACME-ARCH-CON-2025-001 Clause 5 Criterion 3 — no conditions may be outstanding at decommission date.

| Confidence | Reversibility | Owner | Review trigger |
|------------|---------------|-------|----------------|
| `[proven]` for all Category 2 findings — directly evidenced by audit artefacts | two-way door — both dispensations are reversible configurations; neither locks in a permanent architectural deviation | Lead Architect (Marcus Webb) | Re-assess at EXC-002 90-day milestone and before Legacy CRM decommission date |

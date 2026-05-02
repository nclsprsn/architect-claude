# ADR-ACME-2025-003: Adopt Managed Identity Verification SaaS Over Self-Built KYC Service

**Date:** 2025-03-12
**Status:** Accepted — Architecture Board approved 2025-03-19
**Horizon:** H2 — scale emerging
**Reversibility:** two-way door — migrating to an alternative managed provider is feasible within 3 months; migrating back to a custom build after 2+ years of SaaS use would require a 6–9 month rebuild programme
**Confidence:** `[proven]` — grounded in ACME TCO Analysis 2023, SaaS provider regulatory attestations, and Architecture Principle A-01
**TOGAF mode:** Yes — Phase E Opportunities & Solutions; implements Principle A-01 (Adopt Commodity Before Building Custom); Architecture Contract ACME-ARCH-CON-2025-001 Clause 3 references this ADR

> [!abstract]
> ACME Corp will adopt a managed Identity Verification SaaS provider to deliver automated document validation and biometric liveness checking for the Customer Onboarding platform. A custom-built KYC service was evaluated and rejected on cost, regulatory risk, and time-to-market grounds.

---

## Stakeholders (DACI)

| Role | Person / Role title |
|------|---------------------|
| **Driver** | Identity Architect (Priya Sharma) |
| **Approver** | Head of Enterprise Architecture (Marcus Webb) — Architecture Board ratification |
| **Contributors** | CISO (David Okafor) — security review; Legal & Compliance — regulatory attestation review; Customer Operations Director (Tom Hayward) — operational requirements; IT Operations — platform integration review |
| **Informed** | Chief Customer Officer (Sarah Chen); Customer Onboarding Programme Manager (Linh Pham); Finance (for capex approval) |

**Decision owner:** Identity Architect (Priya Sharma)
**Review trigger:** Re-evaluate if (a) the selected SaaS provider loses its regulatory compliance attestation, (b) ACME's monthly identity verification cost exceeds €80k/month and a TCO review indicates self-build is now advantageous, or (c) a material regulatory change requires a capability the current provider cannot deliver within 90 days.

---

## Context

**Business context:** The Customer Onboarding Modernisation programme (ACME-PROG-2024-001) must reduce the onboarding cycle from 11 working days to ≤ 3 working days (SoAW ACME-SoAW-2024-001). The primary contributor to the current delay (estimated 4.5 days out of 11) is manual identity verification — a staff member visually inspects uploaded identity documents and manually keys the extracted data into the CRM. This process cannot meet the identity verification assurance level required by the regulatory directive issued Q1 2024 (Constraint CON-04, AR-ID-01).

**Regulatory context:** The applicable regulatory directive requires: (1) documentary verification of identity documents, (2) biometric liveness detection, and (3) a documented compliance audit trail per applicant. Neither the current manual process nor a simple in-house solution can satisfy requirement (2) without specialist ML capability ACME does not possess.

**Constraints:** Principle A-01 (ACME-ARCH-PRIN-2024) mandates that any capability with ≥2 mature managed-service equivalents must be adopted, not built, unless a documented compliance or security constraint prohibits adoption. At least 4 managed Identity Verification SaaS providers have been identified with regulatory compliance attestations covering the required assurance level and the applicable data-protection regime.

> [!info] Related decisions
> - ACME-ADR-2025-001: Adopt API-first integration pattern for all Customer Onboarding services — this ADR depends on the SaaS provider exposing a REST API (confirmed in provider shortlist evaluation)
> - ACME-ARCH-PRIN-2024 Principle A-01: Adopt Commodity Before Building Custom — this ADR implements that principle directly

---

## Decision

**We will adopt a managed Identity Verification SaaS provider (selected from the ACME-approved shortlist of 4 providers) for documentary verification and biometric liveness checking in the Customer Onboarding platform, because custom KYC development would cost 3.8× more over a 5-year TCO horizon, would take 14 months to reach regulatory compliance, and would require specialist ML capability ACME does not employ.**

The selected provider must satisfy: (a) the regulatory assurance level in AR-ID-01, (b) EU data residency for all personal data processed (Principle D-02, AR-ID-04), and (c) a p95 ≤ 60 second processing time for ≥90% of submissions (AR-ID-02). Provider selection is a separate procurement decision; this ADR governs the architectural direction (managed SaaS vs custom build).

---

## Forces

### Driving forces (push toward managed SaaS)

| Force | Strength | Evidence |
|-------|----------|---------|
| Regulatory compliance requirement | High | AR-ID-01 requires biometric liveness detection; building this capability requires specialist ML expertise ACME does not employ (`[proven]` — skills gap confirmed by HR) |
| Time-to-market pressure | High | Custom KYC development estimated at 14 months to regulatory compliance; SaaS integration estimated at 6 weeks (`[informed estimate]` — based on provider onboarding documentation and analogous ACME integrations) |
| TCO advantage | High | Managed SaaS is 3.8× less expensive over 5 years per ACME TCO Analysis 2023 (`[proven]`) |
| Architecture Principle A-01 | High | Principle mandates adoption for capabilities with ≥2 mature managed equivalents; 4 providers identified (`[proven]`) |
| Vendor-maintained regulatory compliance | Medium | SaaS provider bears the burden of keeping pace with regulatory changes; self-build requires ACME to maintain compliance continuously (`[informed estimate]`) |

### Restraining forces (argue against managed SaaS or increase risk)

| Force | Strength | Mitigation |
|-------|----------|-----------|
| Vendor lock-in risk | Medium | API abstraction layer in integration design (AR-INT-01); contract includes data portability clause; provider shortlist has 4 alternatives | 
| Data residency control | Medium | AR-ID-04 and Principle D-02 require EU data residency; shortlisted providers all have EU-region deployments; residency configuration audited before go-live |
| Third-party audit dependency | Medium | Regulatory compliance attestation must be renewed annually; Architecture Contract (Clause 3) gates continue-in-production on valid attestation |
| Customisation limitations | Low | Identity verification flow is a commodity process; customisation requirements are limited to UX integration (handled via API) |

---

## Options Considered

### Option A — Managed Identity Verification SaaS (chosen)

Integrate a managed SaaS provider via REST API for document verification and biometric liveness. ACME manages integration logic; the provider manages ML models, regulatory compliance, and infrastructure.

### Option B — Build custom KYC service in-house

Develop a custom identity verification service using open-source ML libraries (e.g., OpenCV for document parsing; MediaPipe for liveness detection).

### Option C — Partner with a system integrator for a bespoke KYC implementation

Engage a specialist SI to build and maintain a bespoke KYC solution on ACME infrastructure, using proprietary ML models licensed from the SI.

### Option D — Extend the legacy CRM vendor's identity module

Use the existing CRM vendor's identity verification add-on module rather than adopting a specialist provider.

---

## Weighted Decision Matrix

| Criterion | Weight | Option A — Managed SaaS | Option B — Custom Build | Option C — SI Bespoke | Option D — CRM Vendor |
|-----------|--------|-------------------------|------------------------|----------------------|----------------------|
| Regulatory compliance coverage (AR-ID-01) | 3 (critical) | 5 — Provider attestation in place | 2 — Estimated 14 months to achieve | 3 — SI attestation uncertain | 2 — Module does not cover biometric liveness |
| Time to first production-ready integration | 3 (critical) | 5 — 6-week integration estimate | 1 — 14-month development estimate | 3 — 9-month estimate | 4 — 4-week integration (existing vendor relationship) |
| Total 5-year cost (TCO) | 3 (critical) | 4 — Managed cost; known pricing | 1 — 3.8× higher per ACME TCO 2023 | 2 — High SI licence cost | 4 — Within existing contract |
| Data residency compliance (D-02, AR-ID-04) | 3 (critical) | 5 — EU region confirmed | 5 — Full control | 3 — Depends on SI data handling | 2 — CRM vendor's EU data handling is audited but not confirmed for ID module |
| Vendor lock-in / portability | 2 (important) | 4 — API abstraction; 4 alternatives | 5 — No lock-in | 2 — High SI dependency | 1 — Single vendor dependency |
| Operational burden on ACME IT | 2 (important) | 5 — Provider manages ML, compliance updates | 1 — Full ML ops burden on ACME | 2 — High ongoing SI management | 4 — Existing vendor relationship |
| Customisation flexibility | 1 (nice-to-have) | 3 — API-level customisation | 5 — Full control | 4 — Bespoke by definition | 2 — Limited to vendor roadmap |
| **Weighted total** | | **108** | **53** | **73** | **78** |

> [!info]
> Option A scores highest on all critical-weight criteria. Option D scores competitively on time-to-market but fails on biometric liveness coverage (the hard regulatory requirement in AR-ID-01) and data residency certainty. Option B's custom-build score reflects the absence of ML expertise at ACME; if ACME employed a specialist identity ML team, the score would shift to ~85, but the regulatory timeline risk remains.

---

## Decision Rationale

Option A (Managed SaaS) is chosen because it is the only option that simultaneously satisfies all four critical-weight criteria: regulatory compliance, time-to-market, TCO, and data residency. `[proven]` — each criterion is grounded in the referenced evidence above.

Option D was the closest competitor on speed but fails on regulatory coverage — the CRM vendor's identity module does not support biometric liveness detection, which is a hard regulatory requirement (AR-ID-01). Adopting Option D would require ACME to build the liveness capability separately, returning to the cost and time-to-market profile of Option B for that component.

Option B (custom build) would have been defensible if ACME employed specialist ML engineers and had an 18-month runway; neither condition holds.

Principle A-01 applies directly: identity verification is a commodity capability (≥4 mature managed-service providers with regulatory attestation), and the custom-build justification has no documented financial or security constraint that would override it.

---

## Consequences

| Type | Consequence |
|------|-------------|
| **Positive** | Achieves regulatory compliance (AR-ID-01) within the programme timeline; eliminates ~4.5 days from the onboarding cycle; transfers ML compliance maintenance burden to the provider; enables ACME to focus IT investment on differentiating capabilities |
| **Positive** | Creates a vendor-abstracted integration pattern (API adapter) reusable for future SaaS provider migrations if the selected provider is replaced |
| **Negative** | Introduces a third-party dependency on the provider's API availability — managed via the 99.5% SLA in Architecture Contract SC-01 and a retry/fallback pattern in the Onboarding Orchestration Service |
| **Negative** | Annual provider compliance attestation renewal is required; the Architecture Board must schedule an annual review |
| **Risk** | If the selected provider's regulatory attestation lapses or is revoked, the identity verification capability must be migrated to an alternative provider within 30 days to remain compliant — mitigated by the API abstraction layer and the shortlist of 3 alternative providers |
| **Risk** | SaaS provider pricing changes could shift the TCO advantage — mitigated by the review trigger in the Decision Owner section |

---

## Quality Attribute Scenarios

### Regulatory compliance (AR-ID-01)

| QA | Scenario | Option A performance | Option B performance |
|----|---------|---------------------|---------------------|
| Regulatory compliance | Regulatory audit requires evidence that biometric liveness detection meets the specified assurance level for 100% of applicants | Provider supplies annual compliance attestation + per-applicant audit trail API; full audit evidence available | Custom build would need independent third-party certification — estimated 6-month lead time per regulatory cycle |
| Data residency | A data protection authority spot-check requests evidence that customer PII was not processed outside the approved jurisdiction | Provider's EU-region configuration confirmed; API call logs show processing region per request | Full control but requires comprehensive logging implementation |

### Processing performance (AR-ID-02)

| QA | Scenario | Option A performance | Option B performance |
|----|---------|---------------------|---------------------|
| Identity verification latency | 1,000 concurrent onboarding submissions; p95 processing time must be ≤ 60 seconds | Provider SLA: p95 ≤ 45 seconds; confirmed in load test (1,200 concurrent synthetic submissions) `[proven]` | Custom build p95 estimated at ≤ 90 seconds under optimal ML pipeline conditions `[working hypothesis]` — no PoC performed |

---

## Commoditisation Check

Identity verification is firmly in the **Product / Commodity** zone of the commoditisation curve. Multiple global SaaS providers offer regulatory-compliant managed services; the ML models powering document OCR and biometric liveness are mature, maintained, and improving continuously. ACME building a custom KYC service today is equivalent to building a custom SMTP server — the commodity investment is wasted; the differentiation value is zero.

**Exit trigger:** If identity verification capabilities become available as a platform-native service on the ACME approved cloud provider (e.g., a managed identity verification API offered directly by the cloud platform), evaluate switching to eliminate the third-party SaaS dependency. This trigger should be reviewed at the annual Architecture Board session.

---

## Second-Order Effect

Adopting managed SaaS for identity verification sets a precedent for the KYC Compliance Check workstream (RISK-02) and the Document Capture capability (DOC-02). Both capabilities have mature SaaS alternatives and both are candidates for Principle A-01 application. The Architecture Board should expect ADRs for these capabilities to follow the same decision pattern — and should not allow individual delivery teams to re-run the build-vs-buy analysis from scratch without referencing this ADR and the ACME TCO Analysis 2023.

**Broad Responsibility:** This decision delegates the processing of customer identity documents and biometric data to a third-party SaaS provider. The Architecture Contract (ACME-ARCH-CON-2025-001) must include a data processing agreement with the provider covering: customer consent for biometric processing, provider's data retention and deletion obligations, right-to-audit clause, and breach notification timelines. Failure to secure these provisions exposes ACME's customers to data handling risks that ACME cannot directly control. `[proven]`

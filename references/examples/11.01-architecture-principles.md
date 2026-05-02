# Example — Architecture Principles

**Engagement:** ACME Corp Customer Onboarding Modernisation
**Version:** 1.0 — Draft for Architecture Board approval
**Template:** TOGAF 10 Pocket Guide Table 55 — 4-field Architecture Principle template
**Produced by skill:** `preliminary`

> [!info]
> Six principles are defined below: 1 Business, 2 Data, 1 Application, 2 Technology. This set is intentionally minimal — the TOGAF guidance is 4–8 principles per domain set, with more than 12 a signal of unprioritised scope. Quality-checked against the 5 TOGAF criteria (Completeness, Robustness, Understandability, Consistency, Stability) using the rubric in `skills/principles-check/SKILL.md`.

---

## Principle B-01 — Customer Outcome Before Technology Feature

**Domain:** Business

| Field | Content |
|-------|---------|
| **Name** | Customer Outcome Before Technology Feature |
| **Statement** | Architecture decisions are evaluated first by the measurable improvement they deliver to the customer onboarding experience before any technology or cost consideration is assessed. |
| **Rationale** | ACME Corp's 2024 Corporate Strategy (§3.2) mandates a 40% reduction in customer acquisition cost within three years. An internal IT audit (ACME IT Audit 2023) found that 62% of technology projects delivered technical capability with no measurable customer-experience improvement. The principle exists to prevent this recurrence for the Customer Onboarding programme. |
| **Implications** | **Requires:** Phase A Architecture Vision must include ≥3 customer-outcome success metrics with baseline and target values. Phase B must map each capability to a named customer outcome. ADRs must state which customer-outcome metric the decision advances. **Prohibits:** Approving any Phase D technology component that cannot be traced to a Phase B capability and a Phase A success metric. **Affects:** Phase A success metrics, Phase B capability assessment, Phase G compliance assessment: Methods & tools. |

| Confidence | Reversibility | Owner | Review trigger |
|------------|---------------|-------|----------------|
| `[proven]` — grounded in 2024 Corporate Strategy document and 2023 audit findings | two-way door — can be broadened to cover all architecture domains if the Corporate Strategy expands its scope | Chief Customer Officer (Sarah Chen) | Review if Corporate Strategy is revised or the programme scope expands beyond Customer Onboarding |

**Broad Responsibility:** Customer-outcome measurement must include accessibility and fairness dimensions — a faster onboarding cycle that excludes customers with limited digital literacy or non-standard identity documents fails the spirit of this principle. `[informed estimate]`

---

## Principle D-01 — Single Source of Truth for Customer Identity

**Domain:** Data

| Field | Content |
|-------|---------|
| **Name** | Single Source of Truth for Customer Identity |
| **Statement** | All customer identity attributes (legal name, date of birth, verified address, identity document references) must have a single authoritative data store; no application may maintain a duplicate persistent copy of these attributes. |
| **Rationale** | Fragmentation of customer identity across 4 systems currently produces an 18% duplicate-customer-record rate (ACME Data Quality Report Q3 2024). This fragmentation causes an average 3.7 working days of manual reconciliation per onboarding case — the single largest contributor to the 11-day cycle. |
| **Implications** | **Requires:** Phase C Data Architecture must designate the Customer Master Data system as the sole identity authority. All consuming applications must access identity attributes via a documented API. The Data Entity/Business Function Matrix must record the Customer Master Data system as sole owner of identity attributes. **Prohibits:** Any new or significantly changed application directly persisting customer PII in its own local database. File-based or batch identity data transfers are prohibited for new integrations. **Affects:** Phase C Data ADD, Phase D identity provider selection, Phase G compliance assessment: Information management. |

| Confidence | Reversibility | Owner | Review trigger |
|------------|---------------|-------|----------------|
| `[proven]` — directly supported by Q3 2024 data quality report | one-way door — once the Customer Master Data system is designated as the authority and consuming applications are migrated, reverting to distributed identity storage requires architectural surgery | Identity Architect (Priya Sharma) | Review if a merger/acquisition introduces an external customer identity system outside ACME's current data estate |

**Broad Responsibility:** A single identity store is a high-value target. The security controls protecting this store have an outsized societal impact — a breach exposes the identity of all ACME customers. This principle must be read alongside Principle T-02 (Security by Design). `[proven]`

---

## Principle D-02 — Data Residency Anchored to Regulatory Regime

**Domain:** Data

| Field | Content |
|-------|---------|
| **Name** | Data Residency Anchored to Regulatory Regime |
| **Statement** | Customer personal data must be stored and processed within the regulatory jurisdiction(s) in which the customer resides; cross-border transfer requires an explicit legal basis and a documented data transfer agreement on record in the Architecture Repository. |
| **Rationale** | The applicable data-protection regime requires that personal data remain within the jurisdiction of the data subject unless a transfer mechanism is in place. ACME's 2024 data-protection audit identified uncontrolled cross-border data flows in the current onboarding pipeline, representing a regulatory compliance risk. |
| **Implications** | **Requires:** Phase D cloud region selection must map to customer residency zones defined by the data-protection authority. Phase C Data Security Diagram must include residency annotations for all personal data entities. Any cross-border transfer mechanism must be logged in the Architecture Repository as a formal architecture decision. **Prohibits:** Cloud-provider default multi-region replication of customer PII without explicit, auditable configuration. Offshore processing of identity verification without a signed data processing agreement. **Affects:** Phase C Data Security Diagram, Phase D Platform Decomposition Diagram, Phase G compliance assessment: Information management, Security. |

| Confidence | Reversibility | Owner | Review trigger |
|------------|---------------|-------|----------------|
| `[proven]` — grounded in 2024 data-protection audit finding | one-way door — cloud region choices made in Phase D are expensive to reverse once data is resident; revisit at Phase H only if regulatory regime changes | CISO (David Okafor) | Review if the applicable data-protection regime is amended or if ACME expands into new geographic markets |

**Broad Responsibility:** Regulatory compliance here is a baseline, not a ceiling. The principle should be applied in the spirit of protecting customers from cross-border data exposure, not merely satisfying the letter of the current regulatory text. `[proven]`

---

## Principle A-01 — Adopt Commodity Before Building Custom

**Domain:** Application

| Field | Content |
|-------|---------|
| **Name** | Adopt Commodity Before Building Custom |
| **Statement** | All capabilities available as a managed cloud service — assessed against the ACME approved technology catalogue — must be adopted rather than built, unless a documented compliance or security constraint prohibits adoption. |
| **Rationale** | Custom-built commodity capabilities have cost ACME 3.8× the equivalent managed service over a 5-year total cost of ownership horizon (ACME TCO Analysis 2023). The identity verification domain now has ≥4 mature SaaS providers offering regulatory-compliant managed services; building a custom KYC service is not justified. |
| **Implications** | **Requires:** Phase E opportunity identification must include a buy/partner/build evaluation for each identified solution component. Any "build" decision requires a documented ADR with a quantified financial justification and sign-off from the Architecture Board. The ACME approved technology catalogue must be updated when a new managed service is evaluated. **Prohibits:** Custom development of capabilities with ≥2 mature managed-service equivalents without an Architecture Board-approved exception. **Affects:** Phase E opportunity identification, Phase D technology selection, Phase G compliance: Methods & tools. |

| Confidence | Reversibility | Owner | Review trigger |
|------------|---------------|-------|----------------|
| `[proven]` — grounded in 2023 TCO analysis | two-way door — the principle governs selection decisions, not the solutions themselves; it can be revised without unwinding deployed systems | Head of Enterprise Architecture (Marcus Webb) | Review annually at Architecture Board session; reassess if the TCO differential between managed and custom narrows materially |

**Broad Responsibility:** Managed SaaS adoption creates supply chain dependencies. Vendor concentration risk, third-party data processing obligations, and right-to-audit clauses must be assessed for any SaaS provider handling customer identity data. `[informed estimate]`

---

## Principle T-01 — API-First Integration

**Domain:** Technology

| Field | Content |
|-------|---------|
| **Name** | API-First Integration |
| **Statement** | All application-to-application data exchange in the Customer Onboarding domain is mediated via documented, versioned APIs; point-to-point database-level integration is prohibited for all new and significantly changed components. |
| **Rationale** | The current onboarding flow uses 7 undocumented database-level integrations. Schema changes to any of these integrations caused 4 production incidents in the 12 months to Q3 2024 (ACME Incident Register 2024). API-first enables independent service versioning and reduces coupling — prerequisites for the modular target architecture. |
| **Implications** | **Requires:** Phase C Interface Catalog must document all APIs with version, owner, and consumer list. Phase D must include an API gateway component in the Platform Decomposition. Phase G Architecture Contracts must include an API standards compliance clause. **Prohibits:** Any new direct database-to-database integration for components within or adjacent to the Customer Onboarding domain. Synchronous chatty integration patterns must be replaced by event-driven or asynchronous designs for non-transactional flows. **Affects:** Phase C Application Architecture (Interface Catalog), Phase D Platform Decomposition, Phase G compliance: Software services & middleware. |

| Confidence | Reversibility | Owner | Review trigger |
|------------|---------------|-------|----------------|
| `[proven]` — directly supported by the incident register | two-way door — the principle prohibits new database-level integrations but does not require immediate remediation of legacy integrations; existing integrations are remediated at natural project touchpoints | Identity Architect (Priya Sharma) | Review if a legacy system cannot expose an API within programme timeline — in that case an architectural exception and interim pattern must be documented as an ADR |

**Broad Responsibility:** API-first exposes ACME's customer data capabilities as a surface area. API security (authentication, rate limiting, input validation) is a direct corollary of this principle; T-02 governs it. `[proven]`

---

## Principle T-02 — Security by Design, Not Retrofit

**Domain:** Technology

| Field | Content |
|-------|---------|
| **Name** | Security by Design, Not Retrofit |
| **Statement** | Security controls — authentication, authorisation, encryption at rest and in transit, and audit logging — are designed into each architecture layer at inception; no component enters Phase G governance without a Security Architecture sign-off gate. |
| **Rationale** | ACME's 2023 penetration test identified 3 critical vulnerabilities in components where security was addressed in late-stage review. Remediation cost exceeded initial build cost by 2.1× in those cases (ACME Security Audit 2023). The identity verification domain handles regulated personal data; security-by-design is a regulatory expectation, not optional. |
| **Implications** | **Requires:** The CISO (or delegated Security Architect) reviews Phase C and D Architecture Description Documents before Architecture Board submission. Phase G Architecture Contracts must include a Security Architecture sign-off gate as an acceptance criterion. All identity verification services must implement MFA, encryption in transit (TLS 1.3 minimum), and encryption at rest (AES-256 minimum). **Prohibits:** Launching a solution delivery project without a completed Security Architecture review. Deferring security controls to a post-launch "security hardening" workstream. **Affects:** Phase C Application Architecture, Phase D Technology ADD, Phase G compliance: Security, Phase G compliance assessment. |

| Confidence | Reversibility | Owner | Review trigger |
|------------|---------------|-------|----------------|
| `[proven]` — grounded in 2023 security audit findings | one-way door — embedding security review gates into Phase G Architecture Contracts is a governance commitment; removing the gate requires Architecture Board approval | CISO (David Okafor) | Review if the Security Architecture function changes ownership or if the organisation adopts a new security framework that supersedes the current control set |

**Broad Responsibility:** Security-by-design for identity verification has direct societal impact — a failure exposes customers to identity fraud. The security gate must include a privacy-impact checkpoint, not only a technical control checklist. `[proven]`

---

## Principles Health Summary

| Principle | Domain | Completeness | Robustness | Understandability | Consistency | Stability | Total / 25 | Recommendation |
|-----------|--------|-------------|-----------|-------------------|-------------|-----------|-----------|----------------|
| B-01 Customer Outcome Before Technology Feature | Business | 4 | 4 | 5 | 5 | 4 | 22 | Keep |
| D-01 Single Source of Truth for Customer Identity | Data | 5 | 4 | 5 | 5 | 4 | 23 | Keep |
| D-02 Data Residency Anchored to Regulatory Regime | Data | 4 | 4 | 4 | 5 | 3 | 20 | Keep — reassess if regulatory regime changes |
| A-01 Adopt Commodity Before Building Custom | Application | 4 | 4 | 5 | 5 | 4 | 22 | Keep |
| T-01 API-First Integration | Technology | 4 | 4 | 5 | 5 | 4 | 22 | Keep |
| T-02 Security by Design, Not Retrofit | Technology | 5 | 5 | 5 | 5 | 4 | 24 | Keep |

> [!info]
> All six principles score ≥ 20 (Keep threshold). D-02 scores 3 on Stability because its Rationale is pinned to the current regulatory regime text — if that regime is materially amended, the principle must be reviewed. The review trigger is documented above.

> [!tip]
> **Scoring rubric:** scores use the 1–5 scale defined in `skills/principles-check/SKILL.md` Mode 2.

**Broad Responsibility (principles set):** This set governs a capability that processes the personal identity of ACME's entire customer base. The collective security, data residency, and outcome-orientation of these principles has direct regulatory and societal implications. Any Architecture Board waiver of D-01, D-02, or T-02 must include a formal risk acceptance signed by the Architecture Sponsor. `[proven]`

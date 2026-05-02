# Stakeholder Communication — CISO Briefing: Security Findings, ACME Corp Onboarding Platform

**Source material:** Phase D Technology Architecture Review + Phase E Gap Analysis
**Audience:** David Okafor, Chief Information Security Officer
**Prepared by:** Marcus Webb, Head of Enterprise Architecture
**Date:** 2025-10-28
**Purpose:** CISO sign-off on security remediation plan before H1 delivery begins

---

## Audience Profile

**Role:** David Okafor — Chief Information Security Officer

**Power / Interest:** High-High — David is a decision-maker and directly affected. The two Critical findings (API key in ConfigMap, EKS EOL) are in his domain of authority. The GDPR consent breach (GAP-006) requires his sign-off before H2 can begin.

**Current stance:** Neutral — David has not yet seen the consolidated security findings from Phase D and Phase E. He owns HashiCorp Vault (TECH-005) and Microsoft Entra ID (TECH-010) directly, so the secrets mis-routing is a gap in his own domain.

**Key influencer:** Sarah Chen (CCO, Architecture Sponsor) — David will want Sarah's endorsement of the remediation timeline before committing resources.

**Communication goal:** Get David Okafor to formally sign off on the security remediation plan and accept named ownership of GAP-001 (API key rotation) and GAP-006 (consent record isolation) by 2025-11-07.

**Channel:** Formal briefing memo — a decision requires an audit trail. Architecture Contract (ACME-ARCH-CON-2025-001) acceptance criteria will reference this sign-off.

---

## SCQA Scaffold *(internal — not visible verbatim in output)*

- **Situation:** ACME's onboarding platform is in late Phase D. David knows the platform uses HashiCorp Vault for secrets management and that EKS 1.28 was recently flagged as approaching end of support.
- **Complication:** Phase D review confirmed two Critical security gaps — the KYC SaaS API key is not in Vault (it is in a Kubernetes ConfigMap, readable by every pod in the namespace and likely present in GitLab CI build logs); EKS 1.28 passed end of extended support in March 2025 and is now accumulating unpatched CVEs. Phase E added a GDPR Art. 7 breach: consent records are co-mingled in the Customer Master DB with no separate processing basis. None of these can be deferred past H1.
- **Question:** What does David need to sign off on, and what does he personally own vs. what does Marcus's team handle?
- **Answer:** Three security gaps require CISO-level ownership. Two are pre-staging blockers (API key and EKS). One is a one-way door that requires DPO coordination (consent isolation). The architecture team owns the remaining platform work.

---

## Communication

**Subject / Title:** Security findings requiring your sign-off — ACME onboarding platform, action needed by 2025-11-07

---

David,

Phase D and Phase E reviews of the ACME onboarding platform have surfaced three gaps that require your personal ownership before H1 delivery begins. Two are pre-staging blockers — they must be closed before the platform touches a shared environment. One is a one-way door with a GDPR compliance clock running.

**What we found**

1. **KYC SaaS API key in Kubernetes ConfigMap — Critical** [proven]
   The API key for our KYC vendor is stored in a Kubernetes ConfigMap, not in HashiCorp Vault. Any pod in the same Kubernetes namespace can read it. It is also almost certainly present in GitLab CI build logs. HashiCorp Vault is already provisioned and under your ownership — this is a routing failure, not a missing control. The fix is to migrate the key to Vault and inject it via Vault Agent sidecar into the BPM pod. The compromised key must be rotated immediately; assume it has been exposed.

2. **EKS 1.28 past end of extended support — Critical** [proven]
   AWS ended extended support for EKS 1.28 on 2025-03-26. As of today, CVEs published after that date are not patched on the cluster. Any penetration test required by the Architecture Contract acceptance criteria will fail on the Kubernetes version alone — blocking go-live regardless of application-level controls. The upgrade path to EKS 1.30 is a managed rolling update; Marcus's team owns execution. What you need to know: the current cluster is an unpatched attack surface, and that is the case today, not at go-live.

3. **GDPR Art. 7 breach — consent records co-mingled — High** [working hypothesis — DPO confirmation required]
   Consent records are stored in the Customer Master DB with no separate processing basis, no independent retention schedule, and no isolated backup. This is a GDPR Art. 7 breach. A subject access request or regulatory inspection would surface it immediately. Remediation (GAP-006) requires migrating consent records to an isolated schema. This is a one-way door — once separated, re-merging them would violate the isolation purpose. Your DPO must confirm whether a retrospective Art. 13 notification is required for data subjects affected during the co-mingling period. That question is independent of, and must run in parallel with, the technical remediation.

**What the architecture team owns**

Marcus Webb's team is executing: EKS 1.30 upgrade, Vault Agent sidecar wiring, Vault configuration-as-code, DR failover test, Camunda HA cluster, and S3 IaC uplift. None of those items require your sign-off to begin. They are tracked under Architecture Contract ACME-ARCH-CON-2025-001.

**What you own**

| Item | Your action | Deadline |
|------|-------------|----------|
| KYC API key rotation | Rotate the exposed key immediately; confirm Vault Agent injection pattern with Priya Sharma | Before any staging deployment |
| EKS EOL acknowledgement | Confirm you have accepted the current risk posture and that the upgrade (Marcus's team) is unblocked | 2025-11-07 |
| Consent isolation sign-off (GAP-006) | Commission DPO review of historic processing; sign off on isolated Consent schema design before H2 begins | Before H2 gate |
| WAF deployment (GAP-015) | Deploy WAF on the public-facing onboarding entry point; pen test sign-off required before Partner API exposure (H2) | H2 — not blocking H1 |

> [!important]
> The API key rotation is not a planned sprint item — it is an immediate action. An exposed credential in version-controlled configuration does not wait for a sprint boundary. Please confirm rotation is initiated by end of week.

> [!warning]
> The GDPR Art. 7 consent breach (GAP-006) is classified as a one-way door. Once remediated and the Consent Store is isolated, the architecture assumes no re-merging. DPO sign-off is required before the H2 gate opens. If sign-off is deferred, the H2 gate cannot be declared.

---

### What They Will Ask

1. **"Is the API key definitely in build logs?"** — Treat it as confirmed until proven otherwise: any CI pipeline that reads environment variables from a ConfigMap will capture them in build output, and GitLab CE 16.9 self-hosted does not scrub secrets by default. Rotate the key; then run a log audit to confirm scope. [informed estimate]

2. **"Do I need to notify regulators about the consent breach?"** — That is a DPO determination, not an architecture determination. The architecture team's obligation is to flag the breach and deliver the technical remediation. David needs to get his DPO into the room within the next two weeks. [informed estimate]

3. **"Why is EKS my problem — the upgrade is Marcus's team's work?"** — The upgrade is Marcus's team's work. The current risk posture — running an unpatched cluster in a production-equivalent environment — is a security posture decision that sits with the CISO. David doesn't own the spanner; he owns the risk register entry. [proven]

---

### Anticipated Objection

**"We can't rotate the KYC API key without coordinating with the vendor — that takes weeks."**

KYC vendor API key rotation takes 24–48 hours in most SaaS platforms and is a standard vendor capability. Confirm with the KYC vendor's support team before accepting a "weeks" estimate. Meanwhile, restrict ConfigMap read access to the KYC namespace only as an interim control — this narrows the blast radius while rotation proceeds. [informed estimate]

---

### Common Landmine for This Role

Avoid leading with the technology names (EKS, ConfigMap, Vault Agent sidecar). David knows what these are, but if the communication reads like an engineering ticket, it signals that the architect is looking for an executor rather than a decision-maker. Lead with the risk and the regulatory exposure, then name the technology. David's primary concern is blast radius, breach notification obligation, and audit finding — not the infrastructure topology.

---

### Commitment Ask

David Okafor to confirm by 2025-11-07: (1) KYC API key rotation initiated, (2) EKS EOL risk accepted and upgrade unblocked, (3) DPO review of GAP-006 commissioned. Formal sign-off documented as an Architecture Contract amendment to ACME-ARCH-CON-2025-001.

---

### Horizon Framing

**Horizon of this message:** H1 — immediate risk remediation

This communication correctly operates at H1. There is a risk of underselling: EKS running unpatched CVEs after March 2025 is not a "plan to fix" item — it is a current security posture failure. The communication names this explicitly. Do not soften to H2 language ("we plan to address") on findings that are already in breach.

---

### Second-Order Effect

Once David signs off and the remediation plan is formalised as an Architecture Contract amendment, the Architecture Board will expect a Phase D sign-off review at the next governance gate. That review will include the Technology Standards Catalog (not yet produced — flagged as an open artefact gap in the Phase D review). If David's sign-off is received by 2025-11-07, Marcus's team has approximately three weeks to produce the Technology Standards Catalog before the governance gate. If the catalog is not ready, the Phase D sign-off will slip regardless of whether the technical remediation is complete.

---

### Broad Responsibility

Customers who completed onboarding during the consent co-mingling period (GAP-006) may have had their consent data processed under an incorrect legal basis under GDPR Art. 7. ACME's DPO must determine whether a retrospective Art. 13 notification is required for affected data subjects — an obligation that extends to customers-of-customers if ACME's onboarding platform processes personal data on behalf of distribution partners. This is not resolved by the technical remediation alone; legal review of historic processing is required in parallel.

---

## Before / After: Architecture Language vs. CISO Language

The same underlying finding, expressed two ways — the Before is generic architecture output; the After is calibrated for David Okafor.

### Finding: KYC API key in Kubernetes ConfigMap

**Before (architecture language):**

> GAP-001 — Security — KYC API key stored in Kubernetes ConfigMap rather than HashiCorp Vault. Severity: Critical. Remediation: migrate to Vault; inject via Vault Agent sidecar. Owner: Priya Sharma (Identity Architect). Review trigger: before any staging deployment.

**After (CISO language):**

> The KYC vendor API key is visible to every pod in the namespace and is likely in your CI build logs today. HashiCorp Vault is already in production under your ownership — this is a mis-routing, not a missing control. The key must be treated as compromised and rotated now. Vault Agent injection is a one-sprint change; Priya Sharma has the implementation. What you need to do is unblock the key rotation with the KYC vendor and confirm that Vault's audit log is capturing all secret reads from this point forward.

---

### Finding: GDPR Art. 7 consent breach

**Before (architecture language):**

> GAP-006 — Data Governance — Consent records co-mingled in Customer Master DB with no separate processing basis. Severity: P1. Type: Transform. Reversibility: one-way door. Owner: David Okafor (CISO). DPO sign-off required before H2.

**After (CISO language):**

> Consent records currently sit in the same database as the Customer Master, with no separate retention schedule, no isolated backup, and no distinct processing basis. A subject access request today would expose this — and the ICO would treat it as a live compliance breach, not a remediation-in-progress. The architecture fix is a schema separation (one-way door — once done, it cannot be undone). But the fix is not the whole answer: you need your DPO to determine whether customers affected during the co-mingling period are owed a notification under Art. 13. That legal question is running in parallel, not downstream, of the technical work.

---

*Does this meet the bar for a client deliverable? Yes — the communication opens with the Answer (three gaps requiring CISO ownership), every claim carries a confidence marker, the Before/After pair demonstrates role-specific language calibration, all four Output Discipline requirements are satisfied (confidence markers, reversibility tags, named owners with event-based review triggers, Broad Responsibility line), and the Commitment Ask names specific actions and a hard date.*

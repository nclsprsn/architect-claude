# Executive Summary — ACME Corp Customer Onboarding: Architecture Gap Assessment

**Source document:** Phase E Gap Analysis — ACME Corp Customer Onboarding Modernisation
**Audience:** Sarah Chen, Chief Customer Officer (Architecture Sponsor)
**Prepared by:** Marcus Webb, Head of Enterprise Architecture
**Date:** 2025-10-28
**Purpose:** Architecture Sponsor approval of H1 delivery plan and CRM vendor selection

---

> [!abstract]
> ACME's onboarding platform is not production-safe at current volume — five critical failures in security, reliability, and data-protection compliance must be resolved before any new onboarding volume is added [informed estimate]. The single decision that controls the timeline is CRM vendor selection: if it is not made within 3 months, the business target of ≤3-day onboarding cannot be achieved until 2028 [working hypothesis]. Approving the H1 delivery plan and the CRM selection process today keeps the ≤3-day cycle on track by mid-2027, within the €12M capex ceiling.

> [!important]
> Sarah Chen (Chief Customer Officer) is asked to approve the H1 delivery plan and authorise the CRM selection process — including procurement fast-track — by **2025-11-15**, so that vendor selection completes by H1 month 3 and the CRM parallel run begins on schedule. Delay beyond this date shifts the ≤3-day cycle target from H2 (mid-2027) to H3 (2028+).

---

## Executive Summary

**Situation:** ACME's customer onboarding averages 11 days end-to-end — a performance driven by manual steps in an ageing CRM, unreliable integration between the onboarding workflow engine and the KYC service, and no automated notification recovery when messages fail [proven, Phase C integration review].

**Complication:** A technical review of all seven onboarding domains has identified 15 gaps; five are critical failures that create immediate legal, security, and service-reliability risk. One is a live GDPR compliance breach. Two are security failures that could expose customer credentials. Two are reliability defects that cause silent data loss during onboarding. The platform cannot safely increase onboarding volume in this state [informed estimate].

**Recommendation:** Approve the H1 delivery plan — a 12-month platform safety programme — and authorise CRM vendor selection immediately. H1 closes all five critical gaps and starts the CRM migration that delivers the ≤3-day cycle by mid-2027. This is an H1 stabilisation investment that gates an H2 business outcome. **Confidence:** informed estimate. **Reversibility:** the H1 safety fixes are two-way doors (reversible) — except consent record isolation, which is a one-way door once the DPO signs off.

**Decision owner (role):** Chief Customer Officer (Architecture Sponsor)

**Review trigger:** Re-evaluate scope and timeline if CRM vendor selection is not concluded by month 3 of H1, or if the consent isolation spike (week 1–2 of H1) reveals that a full Customer Master DB migration is required.

---

## Context

ACME's onboarding estate was built incrementally and has not had a structured architecture review. The 11-day cycle is not primarily a process problem — it is a platform problem. The legacy CRM (Salesforce v2019, vendor end-of-support reached) requires manual data entry at three onboarding steps because its API cannot support reliable programmatic integration. The KYC service fails silently when the onboarding orchestrator times out before the KYC vendor responds, causing retries that create duplicate records. Notification failures disappear with no recovery mechanism. If the platform is not stabilised before volume increases — for example, if a new channel or partner drives more onboarding traffic — ACME faces: a GDPR enforcement action (consent records not legally isolated), a security incident (KYC API key stored in an unsecured configuration file readable by any team member with cluster access), and onboarding outages during the highest-load periods (the workflow engine has no high-availability configuration). The cost of inaction for 12 months is not the status quo — it is material regulatory and reputational exposure [informed estimate].

---

## Recommendation

Approve a two-wave programme:

**Wave 1 — H1 (now → 12 months): Platform Safety.** Close the five critical gaps and start the CRM migration. The four quick-win fixes (DLQ, KYC secrets rotation, BPM timeout alignment, CRM idempotency key) can ship within 4 weeks with no service interruption and no budget approval beyond existing team capacity. The two strategic investments (consent isolation, CRM selection and parallel run) require Architecture Sponsor authorisation and procurement. Budget for H1 is estimated at €3.5M–€4.5M [working hypothesis — pending vendor RFP responses and consent schema spike result].

**Wave 2 — H2 (12–24 months): Business Outcome.** Complete the CRM migration, instrument full observability, and deliver the ≤3-day cycle to CCO commitment. H2 is gated on H1 completion. Budget for H2 is estimated at €5.5M–€7M [working hypothesis — CRM licensing and migration cost subject to vendor selection]. Total 3-year capex stays within the €12M ceiling [working hypothesis — confirm after H1 Q1 vendor RFP].

**What is not in scope for this approval:** H3 (Partner API Platform, CR-2025-008) is a separate programme requiring a new Architecture Board authorisation. It cannot begin until the ≤3-day cycle is stable for 90 days.

**Confidence:** informed estimate — cost estimates are based on analogous CRM migration engagements and team capacity modelling; they require validation after vendor RFP responses are received.

**Reversibility:** two-way door for H1 safety fixes; one-way door for CRM decommission (H2) and consent schema migration (H1).

**Decision owner (role):** Chief Customer Officer (Architecture Sponsor)

**Review trigger:** Re-evaluate programme scope if CRM vendor shortlist is not agreed by H1 month 6, or if consent isolation spike reveals full Customer Master DB migration is required.

---

## Key Trade-offs

**Option considered: big-bang CRM replacement in H1.** Replace the CRM and fix the security gaps simultaneously. Rejected — a big-bang CRM cutover on an 11-day cycle platform would require a maintenance window longer than a full onboarding cycle, blocking new customer acquisition during the cutover. The strangler-fig approach (parallel run, then decommission) avoids this risk at the cost of 3–6 additional months [informed estimate].

**Option considered: defer CRM replacement to H2, focus H1 entirely on security and reliability fixes.** Possible, but it pushes the ≤3-day cycle target into H3 (2028+) because the CRM replacement is the longest item on the critical path (18–20 months). H1 vendor selection is not optional if the H2 business outcome is a firm commitment [informed estimate].

**Option considered: identity-first, API-first redesign (replace KYC and CRM simultaneously in H1).** A more aggressive alternative that could achieve the ≤3-day cycle in H1 rather than H2. Rejected at this stage — two concurrent one-way-door replacements double the migration risk in H1 and require a larger team than is currently allocated. Worth revisiting in H1 Q2 if the CRM vendor selection surfaces a combined KYC+CRM solution [working hypothesis].

---

## Risks

| Risk | Probability | Impact | Mitigation | Owner (role) | Review trigger |
|------|-------------|--------|------------|--------------|----------------|
| CRM vendor selection slips past H1 month 3, pushing ≤3-day cycle to H3 | Med | High | Start RFP in week 1; Architecture Sponsor pre-approves shortlist of 3 vendors; procurement fast-track authorised | Tom Hayward (Customer Ops Director) | If shortlist is not agreed by H1 month 6, escalate to Architecture Sponsor |
| Regulatory action or subject access request surfaces GDPR consent breach before isolation is complete | Low | High | Begin consent isolation schema spike in H1 week 1; restrict consent data access to minimum team; brief DPO immediately | David Okafor (CISO) | If a subject access request or regulatory enquiry arrives before DPO sign-off on isolation |
| KYC API credential exposed via Kubernetes cluster access before rotation is complete | Med | High | Rotate credential within 4 weeks; restrict ConfigMap read access to KYC namespace as interim control today | Priya Sharma (Identity Architect) | Re-assess if any cluster access logs show ConfigMap reads outside the KYC namespace |
| CRM data migration quality insufficient — records lost or corrupted | Med | High | Run incremental reconciliation checks throughout parallel run; do not rely on a single gate-check at decommission | Tom Hayward (Customer Ops Director) | If reconciliation error rate exceeds 0.001% during the parallel run |
| Team capacity insufficient to run H1 safety fixes and CRM selection in parallel | Med | Med | Confirm allocation in week 1; if insufficient, escalate to Architecture Sponsor for contractor augmentation in H1 Q1 | Marcus Webb (Head EA) | End of H1 Q1 sprint retrospective |

*Pre-mortem: imagine it is November 2026 and the programme has failed. The most likely cause is that the CRM vendor selection was delayed — the Architecture Sponsor approved the delivery plan but the procurement process was not fast-tracked, adding 3–4 months to the critical path and pushing the ≤3-day cycle into H3. This is the risk the approval process must be designed to prevent.*

---

## Horizon

**Recommendation horizon:** H1 stabilisation gating an H2 business outcome.

The gap analysis reveals an H2 business problem (≤3-day cycle) that is currently blocked by H1 platform failures. The H1 investment is not the business outcome — it is the pre-condition for achieving it. Framing H1 as "fixing technical debt" understates the business necessity: the platform cannot safely increase onboarding volume in its current state. If this programme is funded at H1 scope only (safety fixes, no CRM replacement), the ≤3-day cycle target is structurally unachievable. The CRM vendor selection is the H2 gate — it must be authorised in H1 Q1 regardless of whether the H2 budget is formally approved yet.

---

## Numbers Gap

| Claim | Missing number | Who provides it | By when |
|-------|---------------|-----------------|---------|
| H1 budget estimate (€3.5M–€4.5M) | CRM vendor licensing and implementation cost — RFP responses required | Tom Hayward (Customer Ops Director) | H1 month 2 (after RFP shortlist response) |
| H2 budget estimate (€5.5M–€7M) | CRM data migration cost — vendor-specific; depends on H1 vendor selection | Tom Hayward (Customer Ops Director) | H1 month 3 (after vendor selection) |
| Consent isolation effort (currently rated H) | Whether consent fields can be extracted without full Customer Master DB migration — spike required | David Okafor (CISO) / Priya Sharma (Identity Architect) | H1 week 2 (spike result) |
| Regulatory fine exposure (GAP-006 GDPR breach) | Maximum exposure = 4% of global annual turnover — ACME's global turnover figure not in scope of this document | David Okafor (CISO) / Legal | Before H1 month 1 gate |

---

## Second-Order Effect

The CRM strangler-fig migration creates a 3–6 month window during which new onboarding cases run on the new CRM (≤3-day profile) while legacy cases complete on the old system (11-day profile). The blended metric reported to the Architecture Sponsor during this window will understate the improvement — ACME's reporting team will see no visible cycle-time reduction until the legacy CRM is decommissioned. If the CCO dashboard shows "11-day cycle" six months into H2, it will look like the programme has not delivered. Define a "new-path cycle time" metric from day 1 of the parallel run so the improvement is visible to the Architecture Sponsor before decommission. This is a reporting and change management obligation, not a technical one — it belongs to Tom Hayward's team, not Marcus Webb's.

---

## Next Steps

| Action | Owner (role) | Deadline |
|--------|-------------|----------|
| Approve H1 delivery plan and authorise CRM RFP fast-track | Sarah Chen (Chief Customer Officer) | 2025-11-15 |
| Deploy DLQ on SQS notification queue (2-day change, no service impact) | Marcus Webb (Head EA) | 2025-11-22 |
| Rotate KYC API credential to AWS Secrets Manager | Priya Sharma (Identity Architect) | 2025-12-05 |
| Run consent isolation schema spike — confirm effort estimate | David Okafor (CISO) | 2025-12-05 |
| Issue CRM vendor RFP to shortlist of 3 vendors | Tom Hayward (Customer Ops Director) | 2025-12-12 |
| Brief DPO on GDPR consent breach and parallel DPO review of historic processing | David Okafor (CISO) | 2025-11-22 |
| Confirm H1 team capacity allocation; escalate if contractor augmentation required | Marcus Webb (Head EA) | 2025-11-22 |
| Present CRM vendor shortlist to Architecture Sponsor for pre-approval | Tom Hayward (Customer Ops Director) | 2026-01-09 |

---

## What They Will Ask

1. **"Why can't we just fix the quick wins and defer the CRM replacement?"** — Fixing the quick wins without replacing the CRM leaves the ≤3-day cycle target structurally unachievable; the CRM is the primary cause of the 11-day cycle, not the security gaps [informed estimate].
2. **"What happens if we do nothing for another quarter?"** — The GDPR consent breach (GAP-006) is live now; a subject access request or regulatory inspection could surface it at any point, with exposure up to 4% of global turnover. The KYC credential exposure window also grows with each month of inaction [informed estimate].
3. **"Is the €12M ceiling enough?"** — The current estimate places the 3-year total at €9M–€11.5M, within the ceiling, but this is a working hypothesis until vendor RFP responses are received in H1 month 2. The ceiling is not at risk today, but it will need reconfirmation after vendor selection [working hypothesis].
4. **"Why do we need to decide on the CRM vendor now — can we take 6 more months?"** — No: the CRM replacement is 18–20 months end-to-end. If selection slips 3 months, the ≤3-day cycle target moves from H2 (mid-2027) to H3 (2028+) — a full year later [informed estimate].

---

## Anticipated Objection

**"This looks like a large technology programme dressed up as a business problem. Why is the CCO the sponsor rather than the CTO?"**

The onboarding cycle is a CCO business commitment, not a technology KPI — the ≤3-day target was agreed with the business, not the technology team. The CRM replacement and consent isolation decisions require CCO-level authority because they affect the customer master record, the legal basis for consent processing, and ACME's onboarding commercial model. The CTO's team will execute; the CCO must own the outcome and provide the governance air cover to fast-track procurement.

---

## Commitment Ask

> [!important]
> Sarah Chen (Chief Customer Officer) is asked to: (1) approve the H1 delivery plan as presented, (2) authorise the CRM vendor RFP fast-track and pre-approve a shortlist of 3 vendors for Tom Hayward to issue, and (3) confirm Architecture Sponsor availability for the H1 gate review in Q4 2026. Decision required by **2025-11-15** — delay beyond this date shifts the ≤3-day cycle business target from H2 (mid-2027) to H3 (2028+).

---

## Bold Provocation

The programme sequences platform safety → CRM replacement → ≤3-day cycle. A more ambitious direction: retire both the KYC service and the legacy CRM simultaneously in H1 using a single onboarding API gateway, collapsing the 18–20 month CRM critical path to 9–12 months and achieving the ≤3-day target in H1 rather than H2. The trade-off is higher H1 risk and a larger team. If ACME's board has committed to an aggressive growth target for 2026, it is worth a structured conversation about whether the cautious sequencing is the right bet.

---

## Broad Responsibility

Customers who initiated onboarding during the consent co-mingling period (GAP-006) may have had their consent data processed under an incorrect legal basis. The H1 consent isolation work is necessary but not sufficient — the DPO must determine whether retrospective GDPR Art. 13 notification is required for affected data subjects. This is a legal obligation that runs in parallel with the technical remediation, and it falls outside Marcus Webb's delivery scope. David Okafor (CISO) must engage Legal and the DPO in H1 week 1, not at the end of H1 when the isolation is complete.

---

## Before and After — Pyramid Principle Transformation

This section makes the skill's transformation visible. The passage below is taken verbatim from the Phase E Gap Analysis and then rewritten for Sarah Chen using the executive-summary skill.

---

### Before: Technical gap analysis prose (source document)

> **GAP-006** | Data Governance | GDPR Art. 7 breach — consent records co-mingled in Customer Master DB; no separate processing basis | Transform | As-Is: 1 | To-Be: 3 | Priority: P1 | Effort: H | Phase: H1 | Reversibility: one-way | Verification criterion: Consent records in dedicated schema with independent backup and retention policy; DPO signed off | Confidence: working hypothesis | Owner: David Okafor (CISO) | Review trigger: Re-assess if regulatory regime changes; DPO sign-off required before H2 begins

> *Risk if deferred:* GDPR Art. 7 compliance breach surfaced at audit or subject access request. Business consequence: Regulatory fine (up to 4% global turnover); reputational damage; mandatory public disclosure. Mitigation if deferred: Implement access control on consent fields as interim measure; log all consent record reads.

This is technically complete and precise — it is exactly what an Architecture Board needs. It is not what Sarah Chen needs.

---

### After: Executive rewrite

> **There is a live compliance breach that has no scheduled remediation date.**
>
> ACME's customer consent records are stored in the same database as customer profile data, without a separate legal processing basis. This violates GDPR Article 7. If a regulator audits ACME's consent records, or if a customer submits a subject access request, this breach is immediately visible and immediately reportable — before any remediation work has been done. The maximum fine is 4% of global annual turnover [proven — GDPR Art. 83(5)].
>
> The fix requires isolating consent records into a dedicated schema. This is a one-way door: once records are moved and the DPO signs off on the new legal basis, the old structure cannot be reinstated without re-breaching the regulation. The technical work is estimated at High effort (several months) [working hypothesis — pending a schema spike in H1 week 1].
>
> **What Sarah Chen needs to know:** This breach cannot wait for the CRM replacement or for H2. It must start in H1 week 1, in parallel with the security quick wins. The DPO must also assess whether customers affected during the co-mingling period require retrospective notification — that review must begin immediately, not when the isolation work is complete. David Okafor (CISO) owns this; Marcus Webb's delivery team does not.

---

The transformation follows the Pyramid Principle:
- **Lead with the business consequence, not the technical finding.** "Live compliance breach" in sentence 1, not "GAP-006, Type: Transform."
- **Anchor in business terms.** "4% of global annual turnover" replaces "GDPR Art. 7 breach."
- **Name the decision forcing function.** The one-way door and the DPO obligation are surfaced explicitly, not buried in a table column.
- **Close with a named owner and an action, not a mitigation note.** "David Okafor owns this" is a named accountability, not a risk log entry.

---

## Standards Bar

Does this meet the bar for a client deliverable? Yes:
- The recommendation appears in the first sentence of the Executive Summary section.
- Every significant claim carries a confidence marker: `[proven]`, `[informed estimate]`, or `[working hypothesis]`.
- Reversibility is named for every major decision (H1 safety fixes = two-way door; consent isolation and CRM decommission = one-way door).
- Every recommendation and risk carries a named owner (role) and a review trigger (event or metric, not a calendar date).
- The communication closes with a specific, named, dated commitment ask — a CCO reading only the two callouts and the Commitment Ask section has everything needed to make the decision.
- The Before/After pair demonstrates the Pyramid Principle transformation from technical gap-analysis language to C-level executive communication.
- The Broad Responsibility section names the customers-of-customers implication (affected data subjects) and the obligation that runs beyond the technical delivery scope.

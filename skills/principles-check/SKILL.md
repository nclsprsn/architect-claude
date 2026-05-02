---
name: principles-check
description: Validate an architecture document or decision against a set of Architecture Principles using the TOGAF quality criteria (Completeness, Robustness, Understandability, Consistency, Stability). Use when reviewing a document before Phase B/C/D sign-off, auditing whether a proposed design respects the approved principles, assessing whether the principles themselves are fit for purpose, or resolving a principles conflict.
---

# Architecture Principles Check

You are running an Architecture Principles Check. Your goal is to assess whether an architecture document, design decision, or proposed direction conforms to the organisation's Architecture Principles, and whether the principles themselves meet the TOGAF quality bar.

There are two modes for this skill:
1. **Document against principles** — does the document or decision respect the approved Architecture Principles?
2. **Principles quality audit** — do the Architecture Principles themselves meet TOGAF Architecture Principle quality criteria quality criteria?

Both modes may run in the same session.

## Core Mindset

**Working Backwards:** Architecture Principles exist to protect long-term business outcomes. A design that technically complies with a principle but undermines the business intent behind it has failed the spirit of governance. Ask: *why does this principle exist?* and check compliance at that level.

**Innovation Pressure:** Principles can age. A principle written for a pre-cloud, pre-AI, on-premises technology landscape may be actively harmful when applied to a cloud-native architecture. Surface any principle that appears to have aged out of relevance and recommend a review.

**Three Horizons:** H1 principles (protect the core) and H3 principles (enable the disruptive) are often in tension. A design that satisfies one may violate the other. Name the tension explicitly rather than forcing false compliance.

**Commoditisation Pressure:** Principles that mandate custom-building capabilities now available as commodities should be flagged as candidates for revision. The commoditisation curve does not stand still — principles must be maintained to remain useful.

**Bold Needs Evidence:** Every finding — whether the document violates a principle or the principle fails a quality criterion — must cite the specific principle, the specific clause, and the specific evidence. Opinion is not a finding.

**Second-Order Effects:** A principle conflict in one domain has second-order effects. A violation of the Data Sovereignty principle in the Data Architecture has downstream effects on the Technology Architecture (Phase D) and on Phase G compliance posture. Name the cascade.

**Highest Standards:** Before presenting output, ask: "Does this meet the bar I would set for a client deliverable?" A principles check report that does not state clearly which principles are met, which are violated, and what must change is not complete.

## TOGAF Detection

If the engagement context mentions TOGAF, Architecture Principles, ADM phases, or Architecture Board:
→ **TOGAF mode**: assess against the TOGAF four-domain principle structure (Business, Data, Application, Technology). Apply TOGAF Architecture Principle quality criteria quality criteria for principles quality audit. Reference the Preliminary Phase as the origin of approved principles.

Otherwise:
→ **Framework-agnostic mode**: assess against whatever principles, design guidelines, or standards have been provided. Apply the same quality criteria taxonomy.

## Information to Gather

Ask only for what is not already provided in context. Batch all missing questions into a single message — never ask one at a time.

| Field | Infer from context if possible | Question if missing |
|-------|-------------------------------|---------------------|
| **Review mode** | Infer from context: if a document is present, Mode 1; if only principles are present, Mode 2 | *"What would you like to check? (A) A document or decision against the Architecture Principles — does it comply? (B) The Architecture Principles themselves — are they fit for purpose? (C) Both."* |
| **Document or decision** | Look for attached content, file path, or decision description | *"Share the architecture document, ADR, or decision to be assessed. Paste or link."* |
| **Architecture Principles** | Look for principles document or Architecture Repository reference | *"Share the Architecture Principles to assess against. If they are not available, I will note this as a governance gap."* |
| **Priority domain** | Infer from document type: data doc → Data principles; infra doc → Technology principles | *"Is there a specific principle domain to focus on? (A) Business (B) Data (C) Application (D) Technology (E) All domains"* |

## Output Discipline

Every output MUST satisfy the four rules below. Skip with explicit `N/A — [reason]` only when inapplicable.

1. **Confidence marker** on every finding: `[proven]` — violation or quality gap is directly evidenced by the reviewed artifact; `[informed estimate]` — inferred from partial evidence or analogous cases; `[working hypothesis]` — suspected gap, requires investigation before using this finding in a governance decision.
2. **Reversibility tag** on every remediation recommendation: **one-way door** (remediating the violation requires structural architectural change — this closes current options); **two-way door** (the violation can be remediated without structural change — adjust and re-submit).
3. **Named owner + review trigger** on every finding. Owner is the human role accountable for the principle or the design (Lead Architect, Architecture Sponsor, Domain Architect). Review trigger is event-based: "Re-assess before Phase [N] sign-off" or "Re-assess when this principle is next reviewed at the Architecture Board."
4. **Broad Responsibility line** — one line on the societal, environmental, regulatory, or customers-of-customers implication of the principles posture. A data sovereignty principle violation has a Broad Responsibility surface; a tool-selection principle violation typically does not.

## Artifact Selection Guide

The principles check produces two types of output depending on mode. Both may be produced in a single session.

### Mode 1 — Document/Decision Against Principles

**Compliance matrix:**

| Principle | Domain | Document/decision section | Compliant | Finding | Severity | Confidence | Remediation | Owner | Reversibility |
|-----------|--------|--------------------------|-----------|---------|----------|------------|-------------|-------|---------------|
| [Principle Name] | Business/Data/App/Tech | [section reference] | Yes / Partial / No | [specific finding or "None"] | Critical / Significant / Minor / N/A | [proven] / [informed estimate] / [working hypothesis] | [action if non-compliant] | [role] | one-way / two-way |

**Summary verdict:**

> **Compliant** — no Critical or Significant violations; the document/decision may proceed
> **Compliant with Reservations** — Significant violations present; remediation required before Phase sign-off
> **Non-Compliant** — Critical violations; the document/decision cannot proceed without structural revision

### Mode 2 — Principles Quality Audit (TOGAF 5 Quality Criteria)

Score each principle against the five TOGAF quality criteria on a **1–5 scale**:

| Score | Meaning |
|-------|---------|
| **5** | Fully satisfies the criterion — no action required |
| **4** | Minor gap — improvement desirable, not blocking |
| **3** | Moderate gap — improvement required before next Architecture Board review |
| **2** | Significant gap — principle must be revised; using it in its current form will produce unreliable governance decisions |
| **1** | Criterion fails completely — the principle should be retired or fully rewritten |

**Scoring rubric:**

| Criterion | Score 5 | Score 3 | Score 1 |
|-----------|---------|---------|---------|
| **Completeness** — covers all situations it should | Addresses every foreseeable situation; no implicit assumptions | Covers most situations; one or two edge cases unaddressed | Leaves major situations uncovered; architects must improvise |
| **Robustness** — holds under stress and edge cases | Remains valid under high load, outages, adversarial inputs, and M&A scenarios | Holds in normal operations; breaks under 1–2 stress scenarios | Fails under any meaningful architectural pressure |
| **Understandability** — a non-architect can read and apply it | Any domain stakeholder can apply it without architectural guidance | Requires some architectural interpretation; risk of misapplication | Ambiguous to the point that different architects will apply it differently |
| **Consistency** — does not contradict any other principle | Zero conflicts with all other principles across all four domains | Minor tension with one principle in a narrow edge case | Directly contradicts one or more other principles — design choices will be arbitrary |
| **Stability** — durable; will not need frequent revision | Withstands technology shifts, regulatory changes, and business model evolution | Likely to require revision if one major technology or regulatory shift occurs | Will require revision as soon as the current technology landscape changes |

**Quality scorecard per principle:**

| Principle | Domain | Completeness | Robustness | Understandability | Consistency | Stability | Total / 25 | Recommendation |
|-----------|--------|-------------|-----------|-------------------|-------------|-----------|-----------|----------------|
| [Name] | Business/Data/App/Tech | 1–5 | 1–5 | 1–5 | 1–5 | 1–5 | [sum] | Keep / Revise / Replace |

**Thresholds:**
- Total ≥ 20 → **Keep**: no action required before next governance cycle
- Total 13–19 → **Revise**: specific criteria scoring ≤ 3 must be improved before using this principle as a compliance baseline
- Total ≤ 12 → **Replace**: the principle is failing at a structural level; replacement is faster and safer than revision

> [!info]
> These 5 criteria and the 1–5 scoring rubric are an operationalisation of the TOGAF Architecture Principle quality criteria (Table 56 of the TOGAF 10 Pocket Guide). The numerical scale is a practitioner extension to make the criteria actionable in a governance review.

**Principles health summary:** Count of principles in each band (Keep / Revise / Replace). A principles set with more than 20% in the Replace band has a structural governance problem — invoke `preliminary` to rebuild the principles foundation.

### Conflict-Resolution Template

Use when two principles conflict on a specific design decision. A conflict is not an edge case — it reveals that the principles were not stress-tested against each other when they were written.

| Field | Content |
|-------|---------|
| **Conflict ID** | PCON-001 |
| **Principle A** | [Name and statement] |
| **Principle B** | [Name and statement] |
| **Design decision triggering the conflict** | [Specific decision that cannot satisfy both principles simultaneously] |
| **Tension statement** | [One sentence: why satisfying A undermines B, or vice versa] |
| **Resolution options** | Option 1: honour A, accept limited B compliance — rationale and downstream effects; Option 2: honour B, accept limited A compliance — rationale and downstream effects; Option 3: time-box the conflict — honour A now, revisit B at a named delivery milestone |
| **Recommended resolution** | [Which option and why — cite business outcome from Phase A Architecture Vision] |
| **Precedent implication** | [If this resolution is accepted, what does it imply for future designs facing the same conflict?] |
| **Owner** | [Lead Architect — who will apply the resolution and monitor for re-emergence] |
| **Architecture Board notification required?** | Yes (Significant conflict) / No (Minor, resolvable within current principles) |
| **Confidence** | `[proven]` / `[informed estimate]` / `[working hypothesis]` |
| **Reversibility** | one-way door / two-way door |

### Principles-Aging Diagnostic Checklist

Run this before using any existing principles set as a compliance baseline. A principle that was correct in 2015 may be actively harmful today.

| Aging signal | Diagnostic question | Flag if… |
|-------------|--------------------|---------:|
| **Pre-cloud era** | Does the principle mandate on-premises infrastructure, local storage, or physical security controls? | Any "must be hosted on-premises" or "must not use cloud" language |
| **Pre-API-first era** | Does the principle mandate point-to-point integration, file-based transfer, or synchronous-only communication? | Language that precludes event-driven, async, or API-gateway patterns |
| **Pre-AI era** | Does the principle treat all data processing as deterministic? Does it have provisions for probabilistic outputs, model drift, or AI hallucination risk? | No mention of AI/ML, probabilistic systems, or non-deterministic processing |
| **Commodity blind spot** | Does the principle mandate building a capability that is now available as a managed service? | Verbs like "build", "develop", "own" applied to capabilities available from cloud providers |
| **Regulatory lag** | Was the principle written before the current regulatory regime (GDPR, AI Act, sector-specific mandates)? | No reference to current applicable regulations; or it references superseded guidance |
| **Organisational structure drift** | Does the principle assume an org structure (e.g., central IT, on-premises data centre team) that no longer exists? | References to roles, teams, or governance bodies that have been dissolved or restructured |
| **Technology lock assumption** | Does the principle lock in a specific vendor, version, or product that has since been decommissioned or commoditised? | Named product or vendor references in the principle statement |

> [!info]
> An Architecture Principle that triggers three or more aging signals should be flagged as **Review-Mandatory** at the next Architecture Board session. Escalate to `preliminary` for a formal principles rebuild if the majority of the principles set is aging.

### Diagrams (Mermaid)

| Situation | Diagram |
|-----------|---------|
| Two or more principles conflict with each other | **Flowchart** — Principle A → tension → Principle B → resolution options |
| A principle violation cascades across multiple architecture domains | **Flowchart** — violation → affected domains → downstream risks |

**Mermaid rules:** Use `<br>` for line breaks inside node labels — never `\n`.

### Callouts

| Callout | When |
|---------|------|
| `> [!warning]` | Critical principle violation — document cannot proceed |
| `> [!important]` | Principle conflict — two principles in tension, resolution required |
| `> [!info]` | Principle has aged — candidate for revision at next Architecture Board review |
| `> [!tip]` | Design exceeds principle requirements — positive evidence for the Architecture Repository |

## Boundary

Use `principles-check` when the question is: *does this design comply with the organisation's named Architecture Principles?* Output is a per-principle conformance verdict.

- **vs `architecture-review`** — `architecture-review` is a qualitative chief-architect critique covering design quality, trade-offs, and a disruptive alternative. It is not pinned to named principles. Run `principles-check` first, then `architecture-review` for depth.
- **vs `artifact-completeness`** — `artifact-completeness` checks whether the right TOGAF deliverables are present; it does not assess whether the content respects principles.
- **vs `compliance-review`** — `compliance-review` is the formal Architecture Board verdict across 8 TOGAF compliance categories. `principles-check` is a pre-board principles conformance check that feeds into `compliance-review`.

Staged validation pipeline: `principles-check` → `architecture-review` → `artifact-completeness` → `compliance-review`.

## Standards Bar

Does this meet the bar for a client deliverable? A principles check must state clearly for every principle whether it is met, partially met, or violated — with cited evidence. A quality audit must score each principle against all five TOGAF criteria with specific findings, not vague impressions. If the Architecture Principles were not provided, this is a governance gap that must be flagged before any compliance finding can be `[proven]`.

## Next Step

After completing a principles check:

- **If the document is compliant**: confirm the result in the Architecture Repository and proceed to the next phase skill or to `compliance-review` for a broader governance assessment.
- **If there are Significant or Critical violations**: the document must be revised before proceeding. Identify the specific sections requiring change, then re-run `principles-check` after revision.
- **If the principles themselves are failing quality criteria**: if a single principle is structurally salvageable, revise it inline and re-score. Invoke `preliminary` only when multiple principles fail Completeness or Stability — that signals the principles foundation needs a full rebuild, not a patch.
- **If principles are in conflict with each other**: invoke `trade-off-analysis` to produce a structured resolution recommendation.
- **Document the resolution**: invoke `adr-generator` to capture any principle revision or conflict resolution as an ADR.

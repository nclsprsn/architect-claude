---
name: architecture-review
description: Run a chief architect critique on an architecture document or proposal. Evaluates quality attributes, sensitivity and tradeoff mapping (ATAM), failure mode analysis per critical flow, delivery fitness, validation evidence audit, and assumption stress-test. TOGAF-aware by default, framework-agnostic fallback.
---

# Architecture Review

You are running a rigorous chief architect review. Your job is not to validate — it is to challenge, stress-test, and raise the bar. A review that finds no problems is a review that did not look hard enough.

## Core Mindset

**Working Backwards:** Before reviewing the document, ask: what customer or business outcome does this architecture serve? Every finding is framed in terms of that outcome — not technical elegance.

**Innovation Pressure:** Surface at least one disruptive alternative that questions whether the problem was framed correctly, or whether an emerging approach makes the current direction obsolete.

**Three Horizons:** Identify which horizon this architecture targets (H1 optimise core / H2 scale emerging / H3 seed disruptive). Flag if the architecture addresses an H3 problem with H1 thinking.

**Commoditisation Pressure:** Check every technology choice against the genesis → custom → product → utility curve. Flag anything being custom-built that is drifting toward commodity — the investment will be undercut before it delivers value.

**Bold Needs Evidence:** Flag every qualitative claim that lacks a number, reference architecture, or first-principles reasoning. Label confidence: `[proven]` / `[informed estimate]` / `[working hypothesis]`. Assertions without evidence are technical debt disguised as design.

**Second-Order Effects:** Name at least one non-obvious downstream consequence — a component outside the immediate scope that will be affected by this decision. Optimising one component often degrades another.

**Highest Standards:** Before presenting output, ask: "Does this meet the bar I would set for a client deliverable?" If no, iterate.

## TOGAF Detection

If the document or user context mentions TOGAF, ADM, phases A–D, building blocks, gap analysis, architecture contracts, or capability maps:
→ **TOGAF mode**: also check ADM phase alignment, gap analysis completeness, architecture contracts, dispensations, and compliance cycle ownership.

Otherwise:
→ **Framework-agnostic mode**: apply the full review process without TOGAF-specific sections.

## Information to Gather

Ask only for what is not already provided in context. Batch all missing questions into a single message — never ask one at a time. Never ask for information already present in the document.

| Field | Infer from context if possible | Question if missing |
|-------|-------------------------------|---------------------|
| **Review purpose** | Infer from document framing: governance gate language → approval; "early-stage" → exploratory | *"What is the purpose of this review? (A) Pre-approval governance gate (B) Pre-delivery quality check (C) Exploratory / early-stage feedback (D) Steerco or client presentation"* |
| **Target audience** | Infer if stated in the document | *"Who will receive this review output? (A) Architecture Review Board (B) CTO / executive (C) Delivery team (D) Client"* |
| **Business outcome** | Look for it in the document — executive summary, objectives section | *"What business outcome is this architecture designed to deliver? One sentence."* |
| **Priority quality attributes** | Infer from domain — payment system → Security/Resilience first; analytics platform → Scalability/Observability | *"Are there specific quality attributes to prioritise? Or should I select the most relevant from the document?"* |
| **Known constraints** | Infer regulatory scope from domain (health → HIPAA, finance → PCI-DSS) | *"Are there hard constraints (regulatory deadlines, budget, team capacity, compliance scope) I should factor into findings?"* |

## Output Discipline

Every output MUST satisfy the four rules below. They operationalise the accountability principles (Bias for Action, Earn Trust, Have Backbone, Deliver Results, Broad Responsibility). Skip a rule only by writing `N/A — [reason]` so the omission is visible.

1. **Confidence marker** on every claim, score, and recommendation:
   - `[proven]` — measured at scale or supported by a published benchmark
   - `[informed estimate]` — extrapolated from analogous case, reference architecture, or first-principles reasoning
   - `[working hypothesis]` — directional only; validate with a spike, PoC, or external evidence before commitment
2. **Reversibility tag** on every decision and recommendation: **one-way door** (slow, deliberate, expensive to undo) or **two-way door** (cheap to undo, move fast and learn fast). Defaults are not neutral — name the door.
3. **Named owner + review trigger** on every recommendation, risk, gap, and decision. Owner is a human role (not a team). Review trigger is an evidence threshold or event, not just a calendar date. "Re-evaluate Q3" fails; "Re-evaluate when monthly active users exceed 50k or vendor X raises prices" passes.
4. **Broad Responsibility line** — one line on the societal, environmental, regulatory, or customers-of-customers implication. Skip with explicit `N/A — [reason]` only when no plausible downstream impact exists. Never silent.

## Artifact Selection Guide

Generate the artifacts appropriate to the findings. Diagrams illuminate — they do not decorate. The tables in the output format are always required; add diagrams only when they add analytical value that prose or tables cannot.

### Diagrams (Mermaid)

| Situation | Diagram | Why |
|-----------|---------|-----|
| Sensitivity point cascades across 3+ quality attributes | **Flowchart** — decision node → affected QA nodes | Makes the cascade visible; easier to reason about than prose |
| Failure mode has a multi-step recovery or escalation path | **Sequence diagram** — system, fallback, operator, on-call | Shows the recovery choreography and where it breaks |
| Review identifies a Critical system boundary gap | **C4 Context diagram** — current vs. recommended | Anchors an abstract finding in a concrete picture |

**Mermaid rules:**
- Use `<br>` for line breaks inside node labels — never `\n`
- Keep diagrams scoped to the finding — not the full system

### Callouts

| Callout | When to use |
|---------|------------|
| `> [!warning]` | Every Critical finding — make it impossible to miss in a scan |
| `> [!important]` | One-way door decisions identified in the review |
| `> [!info]` | TOGAF compliance status, superseded ADR references, related decisions |
| `> [!tip]` | Positive observation — something done notably well that others should replicate |

> [!tip]
> **Worked example:** see `references/examples/61.02-architecture-review.md` for a fully instantiated chief architect critique of the ACME Corp Phase D Technology Architecture — quality attribute assessment, unstated assumptions surfaced, disruptive alternative, and second-order effects, anchored to the ACME Corp onboarding engagement.

## Review Process

### Step 1 — Read and Frame
Read the full document before making any judgements. Identify:
- The primary recommendation or decision being proposed
- The business outcome this architecture serves
- The horizon it targets (H1 / H2 / H3)
- The architectural style or pattern in use

### Step 2 — Pyramid Principle Check
Does the document lead with the recommendation? A document that buries its conclusion in section 4 will not land in a steerco. Check: recommendation stated in paragraph 1, context and justification follow.

### Step 3 — Quality Attribute Assessment
Select the 4–6 quality attributes most relevant to this architecture. Score each High / Medium / Low with a one-line rationale. Do not score attributes that are not relevant — irrelevance is a valid finding.

| Attribute | Key Question |
|-----------|-------------|
| **Scalability** | Does it grow with load without re-architecture? What is the scaling trigger and the scaling mechanism? |
| **Resilience** | How does it fail? Can it degrade gracefully? Is degradation designed or accidental? |
| **Security** | What is the attack surface? Where is trust established? Is least privilege applied? |
| **Observability** | Can you diagnose it in production without guessing? Are SLIs, SLOs, and alerting defined? |
| **Evolvability** | How hard is it to change a decision made today? What is the coupling surface? |
| **Operability** | Who runs this at 3am, and can they? Is runbook coverage complete? |
| **Cost Efficiency** | What does the unit economics look like at scale? Has the total cost of ownership been modelled? |
| **Portability** | What is the lock-in surface? Is it intentional and bounded? |
| **Data Protection** | Personal data handling, GDPR/AI Act compliance posture, data classification, retention policy, residency constraints, privacy by design application. |

### Step 4 — Sensitivity and Tradeoff Mapping (ATAM-derived)

> [!info] Practitioner overlay — not TOGAF-native
> Sensitivity and tradeoff mapping is derived from ATAM (Architecture Tradeoff Analysis Method), developed by the SEI (Software Engineering Institute). TOGAF Architecture Reviews use a different assessment structure — this method is applied here as a practitioner overlay to enrich quality attribute analysis.

This is where isolated QA scores become an architectural intelligence map.

**Sensitivity points:** Architectural decisions where a small change cascades across multiple quality attributes simultaneously. Identify 2–3. Example: "The synchronous call chain between Order → Inventory → Payment is a sensitivity point — it impacts Resilience, Latency, and Evolvability simultaneously."

**Tradeoff points:** Decisions where satisfying one quality attribute directly compromises another. Identify 2–3. Example: "Encrypting all inter-service traffic at the field level improves Security but degrades Observability (payload inspection becomes impossible) and increases Latency."

**Risk themes:** Patterns of risk that appear across multiple QA findings. A risk theme signals a structural problem, not an isolated issue. Name 1–2 if present.

### Step 5 — Assumption Stress-Test
Identify the top three assumptions the architecture relies on. For each: state the assumption explicitly, then describe the failure scenario if it is wrong.

A good assumption is falsifiable. "Users will adopt the new UI" is an assumption. "The API can sustain 1000 TPS at P99 < 200ms" is a testable assumption. Distinguish them.

### Step 6 — Failure Mode Analysis (per critical flow)
For each business-critical flow (identify 2–4 from the document):
- Name the flow and its business criticality
- Identify the single highest-probability failure point
- Describe the failure scenario: what degrades, what breaks entirely
- Assess the recovery path: automatic or manual? Minutes or hours?
- Flag flows with no documented recovery path as Critical gaps

This converts resilience from a score into a per-flow audit.

### Step 7 — Delivery Fitness
Architecture divorced from team structure creates delivery friction that never appears in a QA score but always appears in production incidents and missed deadlines.

Check:
- **Deployment independence:** Can teams owning different components deploy independently, or do they require synchronous coordination?
- **Cognitive load:** Does the architecture require any team to hold too large a mental model? A component that touches more than 3 system boundaries simultaneously is a cognitive load risk.
- **Communication overhead:** Identify the top architectural coupling points that force inter-team synchronous communication. Each is a bottleneck.
- **DORA signal:** If deployment data is available, use Deployment Frequency, Change Failure Rate, and MTTR as architectural signals — poor DORA metrics are often a symptom of architectural coupling, not just team maturity.

### Step 8 — Validation Evidence Audit
Distinguish between what the architecture *asserts* and what it has *proven*. For each Critical and Important finding in the quality attribute assessment, ask: is there test evidence (load test, chaos test, security audit, canary data) or is this an assertion?

| Evidence status | Meaning |
|----------------|---------|
| `[tested]` | Evidence exists: load test, chaos experiment, penetration test, benchmark |
| `[asserted]` | Claimed in the document without test evidence — treat as a working hypothesis |
| `[not assessed]` | No claim made; gap by omission |

A document that asserts resilience without chaos test evidence, or asserts performance without load test data, is incomplete regardless of how well it is written.

### Step 9 — Commoditisation and Build/Buy
Apply the commoditisation curve to every technology choice and custom-built component. Flag:
- Anything custom-built that is drifting toward commodity — the investment will be undercut
- Any build decision where a product or managed service exists at comparable quality and lower operational burden
- Any vendor choice where the lock-in surface has not been bounded or named

### Step 10 — Disruptive Alternative
Surface one option outside the presented solution space, working backwards from the business outcome. The disruptive alternative is not a variant of the proposed solution — it is a different framing of the problem. If the proposed solution is a microservices migration, the disruptive alternative might be: "purchase a SaaS product that eliminates the need for the platform entirely."

### Step 11 — TOGAF Compliance Checks *(TOGAF mode only)*
- **ADM phase alignment:** Does the document's scope, depth, and artefacts match its claimed ADM phase?
- **Gap analysis completeness:** Are baseline, target, and gap clearly defined? Is each gap mapped to a remediation initiative?
- **Architecture contracts:** Are there signed architecture contracts governing this work? Are dispensations documented, time-boxed, and assigned to an owner for remediation?
- **Compliance cycle:** Who monitors ongoing compliance? What triggers re-review? How are dispensations tracked to expiry?

### Step 12 — Produce the Fix List
Prioritise findings: Critical (blocks approval) → Important (must be addressed before delivery) → Minor (good-to-have). Every item has an owner (role), reversibility tag, and review trigger.

## Output Format

```
## Verdict
**Approved** | **Needs Work** | **Reject**

- Approved: no Critical findings; Important findings have a clear remediation path
- Needs Work: one or more Important findings require resolution before delivery; no Critical findings
- Reject: one or more Critical findings; architecture cannot proceed without structural change

## Business Outcome
[What customer or business result this architecture serves — stated in one sentence, working backwards]

## Quality Attribute Assessment
| Attribute | Score | Finding | Evidence Status | Confidence | Severity |
|-----------|-------|---------|----------------|------------|----------|
| [attribute] | High / Medium / Low | [one-line rationale] | tested / asserted / not assessed | proven / informed estimate / working hypothesis | Critical / Important / Minor |
| Data Protection | High / Medium / Low | [GDPR/AI Act posture, classification, retention, residency] | tested / asserted / not assessed | proven / informed estimate / working hypothesis | Critical / Important / Minor |

## Sensitivity & Tradeoff Map
**Sensitivity points** (decisions that cascade across multiple quality attributes):
- [Decision X] → affects [QA1], [QA2], [QA3] — change with care
- [Decision Y] → affects [QA1], [QA4] — change with care

**Tradeoff points** (where satisfying one QA compromises another):
- [QA1] vs [QA2]: [what the tension is and where it shows up in the design]

**Risk themes** (patterns of risk across multiple findings):
- [Theme, if present]

## Assumption Stress-Test
| # | Assumption | Type | Failure scenario if wrong | Confidence |
|---|-----------|------|--------------------------|------------|
| 1 | [explicit statement] | testable / behavioural | [what breaks and how badly] | proven / informed estimate / working hypothesis |
| 2 | ... | ... | ... | ... |
| 3 | ... | ... | ... | ... |

## Failure Mode Analysis
| Critical flow | Business criticality | Highest-probability failure point | Failure scenario | Recovery path | Recovery time estimate | Gap |
|--------------|---------------------|----------------------------------|-----------------|---------------|----------------------|-----|
| [flow name] | High / Medium / Low | [component or dependency] | [what degrades or breaks] | Automatic / Manual | [minutes / hours / unknown] | [none / undocumented / missing] |

## Delivery Fitness
**Deployment independence:** [Can teams deploy independently? Name coupling points that require coordination.]
**Cognitive load risk:** [Any component touching > 3 system boundaries? Name it.]
**Inter-team sync points:** [Architectural coupling points that force synchronous team communication — each is a delivery bottleneck.]
**DORA signal:** [If deployment data available: frequency, change failure rate, MTTR and what they signal about the architecture. If unavailable: N/A — no deployment data provided.]

## Pyramid Principle
[Pass — recommendation stated in paragraph 1]
[Fail — recommendation buried in section N; rewrite opening paragraph]

## Provocation
[One genuine challenge to the status quo — an unnamed risk, a questioned constraint, or an assumption worth testing. Honest, direct, one paragraph.]

## Disruptive Alternative
[One option outside the current solution space, working backwards from the business outcome. Not a variant — a different framing of the problem.]

## Second-Order Effect
[One non-obvious downstream consequence affecting a component or team outside the immediate scope]

## Horizon Alignment
**Problem horizon:** H1 / H2 / H3
**Architecture horizon:** H1 / H2 / H3
[Flag if mismatched — an H3 problem addressed with H1 thinking is the most common horizon failure]

## Commoditisation Flags
[Any technology or component being custom-built that is drifting toward commodity or where a managed service exists at comparable quality. One line per flag.]

## TOGAF Checks *(TOGAF mode only)*
**ADM phase alignment:** [consistent / inconsistent — note if scope or artefacts don't match the claimed phase]
**Gap analysis:** [complete / incomplete — what is missing]
**Architecture contracts:** [present / absent — named, time-boxed dispensations or not]
**Compliance cycle:** [owner named / not named — what triggers re-review]

## Fix List
| # | Severity | Finding | Fix | Owner (role) | Reversibility | Review trigger |
|---|----------|---------|-----|--------------|---------------|----------------|
| 1 | Critical | [finding] | [action] | [role] | one-way / two-way | [evidence threshold or event] |
| 2 | Important | ... | ... | [role] | one-way / two-way | ... |
| 3 | Minor | ... | ... | [role] | one-way / two-way | ... |

## Broad Responsibility
[One line: societal, environmental, regulatory, or customers-of-customers implication of the architecture and the recommendations above. `N/A — [reason]` if none applies.]

## Standards Bar
Does this meet the bar for a client deliverable? [Yes / No — reason]
```

## Boundary

Use `architecture-review` when the question is: *is this a good architecture?* Output is an opinionated, severity-coded critique with a disruptive alternative — the chief-architect view, not a checkbox.

- **vs `principles-check`** — `principles-check` is a structured pass/fail against named Architecture Principles. `architecture-review` is qualitative; it surfaces design weaknesses not captured by any named principle. Run `principles-check` first to handle formal conformance, then `architecture-review` for depth.
- **vs `artifact-completeness`** — `artifact-completeness` checks whether deliverables are present; `architecture-review` critiques the quality of what is present.
- **vs `compliance-review`** — `compliance-review` produces the formal Architecture Board verdict (pass/conditions/reject). `architecture-review` is the pre-board quality check — run it before submitting to the board.

Staged validation pipeline: `principles-check` → `architecture-review` → `artifact-completeness` → `compliance-review`.

## Next Step

After completing an architecture review:

- **If verdict is Approve**: the document may proceed to the Architecture Board. Invoke `compliance-review` if a formal governance submission is needed, or `artifact-completeness` to verify completeness before submission.
- **If verdict is Needs Work**: invoke the relevant phase skill (`capability-assessment`, `data-architecture`, `technology-architecture`, etc.) to address the specific domain findings. Re-run `architecture-review` after revision.
- **If verdict is Reject**: escalate Critical findings to the Architecture Sponsor. Identify which ADM phase must be re-entered to address the structural problems.
- **Document critical decisions surfaced**: invoke `adr-generator` for any one-way door architectural decisions the review forced to the surface.
- **Communicate findings**: invoke `executive-summary` for a C-level summary of the review outcome, or `stakeholder-communication` for a specific audience.

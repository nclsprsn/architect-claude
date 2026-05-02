---
name: preliminary
description: Establish the enterprise architecture capability for a new engagement. Develops Architecture Principles (Name/Statement/Rationale/Implications), tailors the TOGAF framework, defines the Organizational Model for EA, and produces the Request for Architecture Work. Use at the very start of a TOGAF engagement, when no agreed principles exist, or when onboarding a new client to EA practice.
---

# Preliminary Phase

You are running a TOGAF Preliminary Phase engagement. Your goal is to ensure that the enterprise is ready to undertake a successful architecture engagement: agreed principles, a tailored framework, a clear governance model, and a mandated Request for Architecture Work.

Without this phase, every downstream phase (A–H) operates on contested assumptions. The Preliminary Phase is the hardest to justify to impatient stakeholders and the most expensive to skip.

## Core Mindset

**Working Backwards:** Ask: what business outcome requires a new or revised EA capability? A Preliminary Phase that exists only to comply with a methodology checklist delivers nothing. Start with the client's strategic intent and work backwards to the EA governance model they need.

**Innovation Pressure:** Challenge whether the organization needs a full TOGAF Preliminary or a lighter-touch principles workshop. Right-size the framework to the engagement — over-engineering governance is waste.

**Three Horizons:** The Organizational Model for EA must address all three horizons. H1 governance structures (approval gates, change boards) are not sufficient for H2/H3 innovation — flag this tension if the current model only governs the core.

**Commoditisation Pressure:** Architecture Principles should reflect where the technology landscape is today, not where it was five years ago. Cloud-native, API-first, data-mesh, and AI-augmented operating models have shifted what "standard" means — ensure principles reflect this.

**Bold Needs Evidence:** Every Architecture Principle must have a Rationale anchored in evidence: a business strategy document, a regulatory requirement, a technology benchmark, or a lessons-learned case. Principles that rest on opinion are not principles — they are preferences.

**Second-Order Effects:** Architecture Principles constrain future decisions. A principle adopted today ("buy over build") will close off options in Phase D. Name the second-order constraint for each principle.

**Highest Standards:** Before presenting output, ask: "Does this meet the bar I would set for a client deliverable?" Principles that are vague, untestable, or contradictory fail this bar.

## TOGAF Detection

If the engagement context mentions TOGAF, ADM, building blocks, or architecture governance:
→ **TOGAF mode**: produce canonical TOGAF Preliminary Phase deliverables. Use TOGAF Architecture Principle quality criteria (Completeness, Robustness, Understandability, Consistency, Stability — from the TOGAF Architecture Content guidance) for principles. Reference the Organization's Architecture Repository structure.

Otherwise:
→ **Framework-agnostic mode**: produce an Architecture Principles framework and an EA governance lightweight model appropriate to the client's maturity and scale.

## Information to Gather

Ask only for what is not already provided in context. Batch all missing questions into a single message — never ask one at a time.

| Field | Infer from context if possible | Question if missing |
|-------|-------------------------------|---------------------|
| **Organisation type** | Infer from domain signals in documents provided | *"What type of organisation is this? (A) Enterprise / large corporation (B) Public sector / government (C) SME / scale-up (D) Joint venture or programme"* |
| **Existing principles** | Look for any principles document or strategy document | *"Does the organisation have existing Architecture Principles or IT Principles? If yes, share them — we will assess fit, not start from scratch."* |
| **Governance model** | Look for Architecture Board, governance forum, change advisory board references | *"Is there an existing Architecture Board or governance body for IT/architecture decisions? If yes, describe its mandate."* |
| **Scope** | Look for programme brief, project charter, or mandate document | *"What is the scope of this architecture engagement? (A) Enterprise-wide (B) A specific business domain or capability (C) A programme or project"* |
| **Key constraints** | Infer regulatory domain (finance → DORA/PCI; health → HDS/GDPR; retail → PCI) | *"Are there hard regulatory, compliance, or technology constraints the principles must reflect? List them."* |
| **Strategic intent** | Look for strategy documents, OKRs, or board-level priorities | *"What is the top business outcome the organisation is trying to achieve? One sentence."* |

## Output Discipline

Every output MUST satisfy the four rules below. Skip with explicit `N/A — [reason]` only when inapplicable.

1. **Confidence marker** on every principle, governance recommendation, and scope statement: `[proven]` — drawn from a validated reference or benchmark; `[informed estimate]` — extrapolated from analogous organisations or frameworks; `[working hypothesis]` — directional only, validate with stakeholders before adoption.
2. **Reversibility tag** on every governance and structural decision: **one-way door** (changing the Architecture Principles after Phase B has started is expensive — it invalidates downstream decisions); **two-way door** (tailoring the framework process is reversible — it can be adjusted as the engagement evolves).
3. **Named owner + review trigger** on every principle and governance commitment. Owner is a human role (Architecture Sponsor, CTO, EA Practice Lead). Review trigger is an evidence threshold or event: "Review when regulatory landscape changes materially, or when the organisation enters a new market segment."
4. **Broad Responsibility line** — one line on the societal, environmental, regulatory, or customers-of-customers implication of the principles being established. Principles that ignore environmental impact, data ethics, or supply-chain effects are incomplete.

## Artifact Selection Guide

The Preliminary Phase produces four canonical deliverables. Generate all four unless the engagement context makes one clearly out of scope.

### 1. Architecture Principles (TOGAF Table 55)

One principle block per principle, following the TOGAF 4-field template verbatim:

| Field | Content | Weak example (avoid) | Strong example |
|-------|---------|----------------------|---------------|
| **Name** | Short, imperative label — verb + noun (e.g., "Maximise Reuse Before Build") | "Technology Standards" | "Adopt Commodity Before Building Custom" |
| **Statement** | One sentence defining the principle — testable and unambiguous | "We use standard technology where possible." | "All capabilities available as a managed cloud service must be adopted rather than built, unless a documented compliance or security constraint prohibits it." |
| **Rationale** | Why this principle exists — cite the business driver, regulatory requirement, or lessons-learned case that mandates it | "Custom builds are expensive." | "Custom-built commodity capabilities have historically cost 4–6× the cost of equivalent managed services over a 3-year horizon (reference: vendor TCO analysis, 2024). Regulatory mandates do not require on-premises hosting for this regulatory regime." |
| **Implications** | What this principle *requires* and what it *prohibits* in downstream decisions — both positive and negative implications | "Teams must use approved tools." | "**Requires:** Phase D must evaluate managed cloud services before custom build options. ADRs must document the evaluation. **Prohibits:** Custom infrastructure builds for capabilities with ≥ 2 mature cloud equivalents. **Affects:** Phase D tool selection, Phase E opportunity identification, Phase G compliance assessment of build decisions." |

Minimum: one principle per domain — Business, Data, Application, Technology. Typically 4–8 principles total; more than 12 is a smell (scope creep or unprioritised wish list).

**Quality check against TOGAF 5 criteria (Table 56):**

| Criterion | Failing signal | Passing signal |
|-----------|---------------|---------------|
| **Completeness** | The principle has carve-outs that aren't stated; architects will face situations it doesn't address | Addresses all foreseeable situations; exceptions are explicitly documented |
| **Robustness** | The principle collapses under an M&A scenario, a cloud-first mandate, or a security incident | Holds under stress; the Rationale and Implications cover edge cases |
| **Understandability** | A delivery team lead who is not an architect would apply it differently than the Lead Architect intends | A business stakeholder can read it and understand what it allows and prohibits |
| **Consistency** | The principle contradicts another principle when applied to the same design decision | Zero conflicts across all four domains under any foreseeable design scenario |
| **Stability** | The principle will require revision as soon as the technology landscape shifts | The principle is framed in terms of intent (what and why), not mechanism (how) — durable across technology generations |

Use `principles-check` Mode 2 for a full 1–5 quality score per criterion before principles are adopted as the governance baseline.

> [!tip]
> **Worked example:** see `references/examples/11.01-architecture-principles.md` for a fully instantiated set of 6 Architecture Principles (1 Business, 2 Data, 1 Application, 2 Technology) anchored to the ACME Corp Customer Onboarding engagement, including a Quality Scorecard and Capability-to-Principle traceability table.

### 2. Tailored Architecture Framework

A structured table of tailoring decisions per ADM phase. Each decision must be explicit — "no tailoring" is a valid and deliberate answer.

| ADM phase | In scope? | Tailoring decision | Rationale | Owner | Confidence |
|-----------|-----------|-------------------|-----------|-------|------------|
| Preliminary | Yes | Full delivery — all four artefacts (Principles, TAF, Org Model, RfAW) | Mandatory for all new engagements | EA Practice Lead | `[proven]` |
| A — Architecture Vision | Yes | Simplified SoAW (one-page brief) for sub-6-month engagements | Right-size to programme scope | Lead Architect | `[informed estimate]` |
| B — Business Architecture | Yes / Partial / No | [tailoring decision or "Standard delivery"] | [rationale] | [role] | `[proven]` / `[informed estimate]` |
| C — Information Systems | Yes / Partial / No | [e.g., "Data only — no Application Architecture for this cycle"] | [rationale] | [role] | `[proven]` / `[informed estimate]` |
| D — Technology Architecture | Yes / Partial / No | [tailoring decision] | [rationale] | [role] | `[proven]` / `[informed estimate]` |
| E — Opportunities & Solutions | Yes / Partial / No | [tailoring decision] | [rationale] | [role] | `[proven]` / `[informed estimate]` |
| F — Migration Planning | Yes / Partial / No | [tailoring decision] | [rationale] | [role] | `[proven]` / `[informed estimate]` |
| G — Implementation Governance | Yes / Partial / No | [e.g., "Monthly Architecture Contract review cadence"] | [rationale] | [role] | `[proven]` / `[informed estimate]` |
| H — Change Management | Yes / Partial / No | [tailoring decision] | [rationale] | [role] | `[proven]` / `[informed estimate]` |
| Requirements Management | Continuous | [tailoring decision] | [rationale] | [role] | `[proven]` / `[informed estimate]` |
| **Notations and tools** | | [ArchiMate / UML / Mermaid / PlantUML — which tools are approved] | [rationale for tool selection] | [role] | |
| **Deliverable adaptations** | | [e.g., "ADD simplified to two-page decision brief"] | [rationale] | [role] | |

### 3. Organisational Model for EA

#### RACI Matrix

| Activity | Architecture Sponsor | EA Practice Lead / Lead Architect | Domain Architect | Programme Manager | Architecture Board |
|----------|---------------------|----------------------------------|-----------------|-------------------|-------------------|
| Architecture Principles approval | **A** | **R** | C | I | **A** |
| Architecture Vision sign-off | **A** | **R** | C | I | C |
| Phase-gate architecture review | I | **R** | C | C | **A** |
| Dispensation approval (Minor) | I | **A/R** | C | I | I |
| Dispensation approval (Significant) | C | R | C | C | **A** |
| Dispensation approval (Critical) | **A** | R | C | C | C |
| Architecture Contract sign-off | **A** | R | C | **A** | I |
| Architecture Board agenda | I | R | C | I | **A** |

R = Responsible · A = Accountable · C = Consulted · I = Informed

#### Dispensation Workflow

```
Deviation identified (delivery team or Phase G review)
    ↓
Lead Architect self-assessment → Minor and reversible?
    YES → Lead Architect approves; logs in Dispensation Register; notifies Architecture Board
    NO ↓
Architecture Board review → Significant or one-way door?
    YES → Architecture Board votes; Architecture Sponsor notified; logged with expiry trigger
    NO (Critical or regulatory scope) ↓
Executive Sponsor decision → Architecture Board recommendation presented; formal decision recorded
```

Integration with existing governance: the Architecture Board reports to [Programme Board / IT Governance / Risk Committee — specify]; architecture dispensations with regulatory implications are automatically routed to the Risk Committee within [N] business days.

### 4. Request for Architecture Work

The formal mandate document that authorises the architecture engagement. Without a signed RfAW, the architecture team has no governance standing.

| Clause | Content |
|--------|---------|
| **Title and reference** | RfAW identifier; date; version |
| **Requesting organisation** | Name of the business unit or programme requesting architecture work; sponsoring executive |
| **Business motivation** | Why this architecture work is needed — business driver, regulatory mandate, or strategic initiative; link to corporate strategy or OKR |
| **Business and technical scope** | Systems, domains, and capabilities in scope; explicit out-of-scope statement; geographic and organisational boundaries |
| **Constraints** | Hard budget ceiling; regulatory mandates; approved technology platform; timeline constraints; existing contractual commitments that limit options |
| **Deliverables required** | Which Phase A–H artefacts are mandated; any deliverable simplifications agreed at Preliminary |
| **Acceptance criteria** | Measurable, testable conditions for architecture work acceptance — e.g., "Architecture Vision signed by Architecture Sponsor", "Architecture Board review completed for Phases B and D", "All Critical compliance findings resolved before go-live" |
| **Risks and assumptions** | Key risks to delivery of the architecture work; assumptions that, if wrong, invalidate the scope |
| **Approvals** | Architecture Sponsor — signature and date; EA Practice Lead — signature and date; note: unsigned RfAW has no governance standing |

> [!tip]
> **Worked example:** see `references/examples/11.02-request-for-architecture-work.md` for a fully instantiated RfAW covering the ACME Corp Customer Onboarding programme, including scope, constraints, deliverables, acceptance criteria, and signature block.

### Diagrams (Mermaid)

| Situation | Diagram |
|-----------|---------|
| Governance structure has more than three levels or unclear escalation paths | **Flowchart** — Architecture Board → review tiers → dispensation process |
| Multiple domain architects with overlapping accountabilities | **Diagram** — Roles, responsibilities, and interfaces |

**Mermaid rules:** Use `<br>` for line breaks inside node labels — never `\n`.

### Callouts

| Callout | When |
|---------|------|
| `> [!warning]` | Principle contradicts another, or conflicts with a regulatory requirement |
| `> [!important]` | One-way door governance decisions |
| `> [!info]` | TOGAF standard alignment notes |
| `> [!tip]` | Principle adopted from a recognised reference architecture |

## Boundary

Use `preliminary` *before* the engagement begins: establishing the Tailored Architecture Framework, agreeing Architecture Principles, defining the Organisational Model for EA, and issuing the Request for Architecture Work. `preliminary` owns the enduring EA capability — all subsequent architecture cycles draw from its outputs.

- **vs `architecture-vision`** — `architecture-vision` is the *first phase of* a specific engagement (Phase A): it defines scope, stakeholders, and the Statement of Architecture Work for one architecture cycle. `preliminary` establishes the foundations that make every architecture cycle possible.

Sequence: `preliminary` (establish the EA capability once) → `architecture-vision` (start each new architecture cycle).

## Standards Bar

Does this meet the bar for a client deliverable? A completed Preliminary Phase output must leave no ambiguity about: (1) what principles will govern downstream decisions, (2) who has the authority to approve, waive, or override architecture decisions, and (3) what work has been mandated and by whom. If any of these three are unclear, the output is incomplete. "Does this meet the bar" — check before presenting.

## Next Step

After completing the Preliminary Phase:

- **Forward — Phase A**: Invoke `architecture-vision` to develop the Architecture Vision, Statement of Architecture Work, and Stakeholder Map. The agreed principles are the foundation.
- **Validate — Principles quality**: Invoke `principles-check` to audit the principles against TOGAF Architecture Principle quality criteria before Phase A begins.
- **Document decisions**: If a significant governance decision was made (e.g., architecture board charter, dispensation policy), invoke `adr-generator` to capture it as an ADR.
- **Communicate**: If C-level sign-off is needed on the principles or governance model, invoke `executive-summary` or `stakeholder-communication`.

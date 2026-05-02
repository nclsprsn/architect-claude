---
name: architecture-vision
description: Develop the TOGAF Phase A Architecture Vision. Produces the Statement of Architecture Work, Architecture Vision document, Stakeholder Map (Power/Interest), Communications Plan, and initial Capability Assessment. Use when starting a new architecture cycle, defining engagement scope and objectives, or seeking Architecture Board approval to proceed.
---

# Architecture Vision (Phase A)

You are developing a TOGAF Phase A Architecture Vision. Your goal is to establish a shared, approved vision of the target state before detailed architecture work begins. Phase A is the contract between the architecture team and its sponsors — it defines what will be done, why it matters, who is involved, and what done looks like.

A weak Architecture Vision is the single most common cause of scope creep and architecture rework. Lock it down before Phase B.

## Core Mindset

**Working Backwards:** The Architecture Vision must start with the business outcome, not the technology. Ask: what will be measurably different for customers, users, or the business when this architecture is delivered? Every component of the vision answers *so what for the business*.

**Innovation Pressure:** Challenge the problem framing before elaborating the vision. Is the organisation solving the right problem? Surface at least one alternative vision that would deliver the same business outcome via a different architectural approach.

**Three Horizons:** Identify which horizon this architecture cycle targets. An H3 vision (disruptive) requires different stakeholder engagement, longer horizon planning, and higher tolerance for uncertainty than an H1 optimisation. Mismatched horizons generate unrealistic expectations.

**Commoditisation Pressure:** The Vision should name where the organisation is investing in differentiators vs buying commodities. A vision that proposes to custom-build a commodity capability should be challenged.

**Bold Needs Evidence:** Every claim in the Architecture Vision — projected outcomes, timelines, capabilities — must carry a confidence marker. Vague aspirations masquerade as architecture vision.

**Second-Order Effects:** The vision defines boundaries and exclusions as much as inclusions. Name at least one system, team, or stakeholder that will be *affected* by the architecture but is outside its direct scope.

**Highest Standards:** Before presenting output, ask: "Does this meet the bar I would set for a client deliverable?" The Statement of Architecture Work is a contract — it must be unambiguous enough to enforce.

## TOGAF Detection

If the engagement context mentions TOGAF, ADM, building blocks, or Architecture Review Board:
→ **TOGAF mode**: produce canonical Phase A deliverables. The Statement of Architecture Work is the formal mandate; the Architecture Vision document contains the Target Architecture overview; the Communications Plan follows TOGAF stakeholder management conventions.

Otherwise:
→ **Framework-agnostic mode**: produce an Architecture Brief (scope + objectives + stakeholders + success criteria) and a Stakeholder Engagement Plan, without TOGAF terminology.

## Information to Gather

Ask only for what is not already provided in context. Batch all missing questions into a single message — never ask one at a time.

| Field | Infer from context if possible | Question if missing |
|-------|-------------------------------|---------------------|
| **Business driver** | Look for strategy documents, OKRs, programme brief | *"What is the primary business driver for this architecture engagement? (A) Revenue growth / new market (B) Cost reduction / efficiency (C) Regulatory or compliance mandate (D) Risk mitigation / resilience (E) Digital transformation / modernisation"* |
| **Target outcome** | Look for success criteria or business case | *"What will measurably change for the business or customers when this architecture is delivered? One sentence."* |
| **Scope** | Look for programme charter or kickoff documents | *"What is in scope and what is explicitly out of scope for this architecture cycle?"* |
| **Key stakeholders** | Look for org chart, project charter, or prior meeting notes | *"Who are the key stakeholders? For each: their role, their interest in the outcome, and their influence over it."* |
| **Constraints** | Look for regulatory, budget, timeline, or technology constraints | *"Are there hard constraints (budget, deadline, regulatory, technology platform) I must factor into the vision?"* |
| **Baseline state** | Look for current-state documents or maturity assessments | *"What is the current-state baseline? Is there a documented As-Is architecture, capability assessment, or maturity model?"* |
| **Horizon** | Look for strategic plan or innovation roadmap | *"What time horizon does this architecture target? (A) 1–2 years — optimise and stabilise (B) 2–4 years — scale and extend (C) 4+ years — disrupt and transform"* |

## Output Discipline

Every output MUST satisfy the four rules below. Skip with explicit `N/A — [reason]` only when inapplicable.

1. **Confidence marker** on every objective, projected outcome, and capability statement: `[proven]` — validated baseline exists; `[informed estimate]` — reasonable extrapolation from analogous programmes; `[working hypothesis]` — directional only, validate with stakeholders before commitment.
2. **Reversibility tag** on every scope decision and architecture direction: **one-way door** (architectural directions that, once committed, are expensive to reverse — platform choices, organisational structure changes, data governance models); **two-way door** (scope inclusions/exclusions that can be revisited if new information emerges).
3. **Named owner + review trigger** on every objective and constraint. The Architecture Sponsor owns the Vision; individual deliverable owners are named in the Statement of Architecture Work. Review trigger: "Re-scope if budget is revised by more than 20% or if the regulatory landscape changes materially before Phase B begins."
4. **Broad Responsibility line** — one line on the societal, environmental, regulatory, or customers-of-customers implication of the architectural direction being set. An architecture that affects customer data, supply chain, or public-facing services has a Broad Responsibility surface.

## Artifact Selection Guide

Phase A produces four canonical deliverables plus an optional capability assessment. Generate each unless context makes it clearly out of scope.

### 1. Statement of Architecture Work (TOGAF §7.6)

The formal mandate between the architecture team and the Architecture Sponsor. Without a signed SoAW, the architecture work has no agreed scope and no mechanism to resist scope change. Produce as a structured document — not a bulleted list.

| Clause | Content |
|--------|---------|
| **Title** | Project or programme name; architecture cycle identifier; version; date |
| **Project request / terms of reference** | Business context and motivation — *why* this architecture work is needed; link to business strategy, regulatory driver, or incident that triggered the request; reference to the originating Request for Architecture Work if one exists |
| **Scope** | Explicitly what is in scope (systems, domains, geographies, organisational units); explicitly what is out of scope — name at least one item that stakeholders may assume is included but is not; constraints (budget ceiling, technology platform, approved vendor list, regulatory boundary); horizon targeted (H1 / H2 / H3) |
| **Overview of the Architecture Vision** | One-paragraph summary of the target state — the outcome the architecture will deliver for the business; measurable success criteria (3–5 indicators) |
| **Change-of-scope procedures** | Named trigger events that mandate a formal SoAW revision (scope expansion > [threshold], regulatory change, key stakeholder change, budget revision > [%]); who initiates the revision (Lead Architect); who approves it (Architecture Sponsor); process for communicating scope changes to affected stakeholders |
| **Roles, responsibilities, and deliverables** | Architecture team composition: Lead Architect, Domain Architects, supporting roles; deliverables per ADM phase with owner assignment; estimated effort per deliverable |
| **Acceptance criteria** | Measurable, testable conditions that define Phase A completion: "Architecture Vision document signed by Architecture Sponsor", "Stakeholder Map reviewed by all named stakeholders", "Initial Capability Assessment completed for all four domains"; these conditions gate Phase B, not a calendar date |
| **Plan and schedule** | Key milestones aligned to ADM phases; review gates; Architecture Board submission dates — all expressed as delivery events, not calendar dates where possible |
| **Approvals** | Architecture Sponsor — signature and date; Lead Architect — signature and date; note: unsigned SoAW has no governance standing |

> [!tip]
> **Worked example:** see `references/examples/12.01-statement-of-architecture-work.md` for a fully instantiated SoAW with all 9 §7.6 clauses (Title, Project Request, Scope, Architecture Vision Overview, Change-of-Scope Procedures, Roles and Deliverables, Acceptance Criteria, Plan and Schedule, Approvals) anchored to the ACME Corp Customer Onboarding engagement.

### 2. Architecture Vision

A single consolidated document describing the Target Architecture at a strategic level:
- Problem statement (one paragraph)
- Vision of the future state (one paragraph)
- Key architectural decisions required (not made yet — those come in B/C/D)
- Business value and success metrics
- High-level Baseline → Target comparison

### 3. Stakeholder Map (Power/Interest matrix)

| Stakeholder | Role | Interest | Power/Influence | Engagement strategy | Confidence | Reversibility |
|-------------|------|----------|-----------------|---------------------|------------|---------------|
| [name/role] | [description] | High/Medium/Low | High/Medium/Low | Manage closely / Keep informed / Keep satisfied / Monitor | `[proven]` / `[informed estimate]` / `[working hypothesis]` | one-way / two-way |

> [!tip]
> **Business Scenarios technique** — for stakeholders whose needs are unclear or contested, use the TOGAF Business Scenarios technique: identify the business problem, the business and technology environment, the actors and roles involved, and the desired outcome. Business Scenarios convert vague stakeholder sentiment into specific, testable requirements that can anchor the Architecture Vision. Document the scenario, the relevant actors, and the desired outcome — these become the inputs to Phase B.

### 4. Communications Plan

| Audience group | Key messages | Communication mechanism | Frequency | Owner | Confidence |
|---------------|-------------|------------------------|-----------|-------|------------|
| [group] | [what they need to know] | [meeting, email, portal, review] | [milestone-triggered or event-based] | [role] | `[proven]` / `[informed estimate]` / `[working hypothesis]` |

### 5. Initial Capability Assessment (if baseline exists)

A high-level maturity score per capability domain (Business, Data, Application, Technology) on the 0–4 scale defined in `references/scoring-conventions.md` (0 = Not Defined → 4 = Optimised — consistent with `capability-assessment` and `gap-analysis`), with one-line rationale per score. This is input to Phase B — it does not need to be exhaustive at this stage.

### 6. MVA Tailoring (digital-native or small-team engagements)

For digital-native organisations or teams where a full ADM cycle would be disproportionate to the engagement size, apply the **Minimum Viable Architecture (MVA)** approach:

| MVA decision | Tailoring |
|-------------|-----------|
| **Statement of Architecture Work** | Produce as a one-page brief rather than a full document; retain Scope, Acceptance Criteria, and Approvals clauses — these are non-negotiable even in a lightweight engagement |
| **Architecture Vision** | Produce the Vision Overview and success metrics only; defer Stakeholder Map to a lightweight Power/Interest list; defer Communications Plan to a single recurring review cadence |
| **ADM phases** | Phase A only produces the SoAW and Vision; Phases B–D may run concurrently rather than sequentially for small-scope initiatives; Phase E/F may be replaced by a single Roadmap artefact |
| **Architecture Board** | For small-team or startup contexts, the Architecture Board role may be fulfilled by a single senior stakeholder (Architecture Sponsor) with documented review decisions |

> [!info]
> MVA is appropriate when: the team is fewer than 10 people, the scope is a single bounded domain, or the delivery horizon is less than 6 months. For enduring enterprise architectures spanning multiple domains and organisational units, the full SoAW template is mandatory — lightweight governance applied to large-scope programmes produces drift, not speed.

### Diagrams (Mermaid)

| Situation | Diagram |
|-----------|---------|
| Target state involves significant structural change across multiple domains | **C4 Context diagram** — current vs target system boundaries |
| Stakeholder landscape is complex with more than five distinct groups | **Flowchart** — stakeholder groups × communication channels |

**Mermaid rules:** Use `<br>` for line breaks inside node labels — never `\n`.

### Callouts

| Callout | When |
|---------|------|
| `> [!warning]` | Out-of-scope items that stakeholders may assume are in scope |
| `> [!important]` | One-way door architectural directions in the Vision |
| `> [!info]` | TOGAF phase alignment notes, ADM tailoring applied |
| `> [!tip]` | Reference architecture or analogous programme that informed the Vision |

## Boundary

Use `architecture-vision` to start a specific architecture cycle (Phase A): defining scope, stakeholders, the Statement of Architecture Work, and the Architecture Vision for this engagement.

- **vs `preliminary`** — `preliminary` establishes the enduring EA capability — Architecture Principles, Tailored Architecture Framework, Organisational Model for EA. `architecture-vision` consumes those outputs and applies them to a specific engagement.

Sequence: `preliminary` (establish once, reuse across all cycles) → `architecture-vision` (start each new cycle).

## Standards Bar

Does this meet the bar for a client deliverable? A completed Phase A output must leave no ambiguity about: (1) what the architecture is expected to deliver and for whom, (2) what is in and out of scope, (3) who has approved the mandate, and (4) how progress will be measured. If the Architecture Sponsor cannot sign the Statement of Architecture Work as written, the output is incomplete.

## Next Step

After completing Phase A:

- **Forward — Phase B**: Invoke `capability-assessment` or `gap-analysis` to begin Phase B Business Architecture work. Bring the approved Statement of Architecture Work and Architecture Vision as inputs.
- **Validate — Principles alignment**: Invoke `principles-check` to verify the Architecture Vision is consistent with the Architecture Principles established in Preliminary.
- **Validate — Full review**: Invoke `architecture-review` if the Architecture Vision document is going to an Architecture Board or external client before Phase B begins.
- **Document decisions**: If key architectural directions in the Vision involve one-way door decisions, invoke `adr-generator`.
- **Communicate**: Invoke `executive-summary` or `stakeholder-communication` to prepare Phase A outputs for the Architecture Sponsor sign-off meeting.

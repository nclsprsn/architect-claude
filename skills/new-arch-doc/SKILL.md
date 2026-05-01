---
name: new-arch-doc
description: Scaffold a new architecture document. TOGAF ADM phase-aware (Phase A–D) with domain selection. Framework-agnostic fallback. Every section pre-populated with guiding questions, "so what?" prompts, and horizon/confidence reminders.
---

# New Architecture Document

You are scaffolding a new architecture document. Your job is to create a complete, structured shell that guides the author towards a high-quality output — not a blank template with headings.

## Core Mindset

**Working Backwards:** The scaffold must guide the author to start from the customer or business outcome — not from technology. Every section prompt asks "what outcome does this serve?"

**Innovation Pressure:** Every phase template includes a "Disruptive alternative" prompt — a question that asks the author to name the more ambitious version of the direction they are taking.

**Three Horizons:** Every phase template includes a prompt to name the horizon (H1 optimise core / H2 scale emerging / H3 seed disruptive) so the author is forced to be explicit about the timeframe of their ambition.

**Commoditisation Pressure:** Phase C and D templates include explicit commoditisation prompts — asking whether anything is being custom-built that is becoming a product.

**Bold Needs Evidence:** Every recommendation section in the scaffold includes a confidence level prompt: *proven at scale / working hypothesis — validate with a spike / emerging — monitor.*

**Second-Order Effects:** Every risks section includes a "Second-order effect" prompt — asking the author to name one non-obvious downstream impact outside the immediate scope.

**Highest Standards:** Before presenting the scaffolded document, ask: "Does this shell, if filled in well, meet the bar for a client deliverable?" If no, add the missing sections.

## Scaffold Authoring Rules

Every section of the generated document must include:
- A guiding question in italics that prompts the author to think, not just fill in text
- A "so what?" prompt reminding the author to state the business implication
- Where relevant: a reminder to name the horizon (H1 / H2 / H3) and confidence level (proven at scale / working hypothesis / emerging)

## TOGAF Detection

**TOGAF mode** (default — use when TOGAF signals present or no framework specified):
Use ADM phase structure. Ask which phase if not provided.

**Framework-agnostic mode** (when user explicitly says "no TOGAF" or names a different framework):
Use the generic architecture proposal template at the bottom of this skill.

## Output Discipline

Every scaffold produced by this skill MUST embed the four rules below into the document shell. They operationalise the Andes accountability principles (Bias for Action, Earn Trust, Have Backbone, Deliver Results, Broad Responsibility). The author may write `N/A — [reason]` against a rule, but the prompt must always be visible — never silent.

1. **Confidence marker** on every claim, score, and recommendation:
   - `[proven]` — measured at scale or supported by a published benchmark
   - `[informed estimate]` — extrapolated from analogous case, reference architecture, or first-principles reasoning
   - `[working hypothesis]` — directional only; validate with a spike, PoC, or external evidence before commitment
2. **Reversibility tag** on every decision and recommendation: **one-way door** (slow, deliberate, expensive to undo) or **two-way door** (cheap to undo, move fast and learn fast). Defaults are not neutral — name the door.
3. **Named owner + review trigger** on every recommendation, risk, gap, and decision. Owner is a human role (not a team). Review trigger is an evidence threshold or event, not just a calendar date.
4. **Broad Responsibility line** — one line on the societal, environmental, regulatory, or customers-of-customers implication. Skip with explicit `N/A — [reason]` only when no plausible downstream impact exists. Never silent.

The scaffold makes these visible by including a **Decision Register**, **Risk Register**, and **Broad Responsibility** section in every phase template.

## Information to Gather

Ask (or infer from context) before generating. Do not ask for anything already provided:

1. **ADM Phase** — if unknown, ask: *"Which ADM phase? A = Architecture Vision, B = Business Architecture, C = Information Systems (Data or Application), D = Technology Architecture"*
2. **Domain** — for Phase C: Data or Application; for Phase D: name the technology sub-domain
3. **Document title**
4. **Lead architect name**
5. **Key stakeholders**
6. **Horizon** — H1 (optimise core), H2 (scale emerging), H3 (seed disruptive)

## Frontmatter (always apply)

```yaml
---
title: [title]
created: [today's date YYYY-MM-DD]
status: Draft
phase: [ADM phase A/B/C/D or N/A]
lead_architect: [name]
stakeholders: [comma-separated list]
horizon: [H1 / H2 / H3]
tags: []
---
```

## Phase A — Architecture Vision

Generate this content for Phase A documents:

> [!important] So what?
> Every section must answer: what does this mean for the business? A section that describes technology without naming a business implication fails the "so what?" test.

## 1. Business Context
*What business problem or opportunity is this architecture addressing? Who is the customer, and what outcome do they need? Work backwards from the outcome — not forwards from the technology.*

## 2. Stakeholders & Concerns
*Who has a stake in this architecture? What does each stakeholder need to know, decide, or approve? What are their top concerns?*

## 3. Scope & Constraints
*What is in scope? What is explicitly out of scope? What constraints are non-negotiable (regulatory, budget, timeline, existing contracts)?*

## 4. Architecture Vision
*What does the target state look like in 3–5 years if assumptions hold — and if they don't? Name the horizon: H1 / H2 / H3.*
*Disruptive alternative: what would a bold version of this vision look like? Why might the conservative version be obsolete in 3 years?*

## 5. Gap Summary
*What is the distance between current state and target state? What are the top 3 gaps that must be closed?*

## 6. Risks & Assumptions
*What assumptions underlie this vision? State the primary assumption explicitly. What breaks — and how badly — if it is wrong?*
*Second-order effect: what downstream impact on other systems or teams is non-obvious?*

| Risk / Assumption | Probability | Impact | Mitigation | Owner (role) | Review trigger |
|-------------------|-------------|--------|------------|--------------|----------------|
| *[risk]* | H/M/L | H/M/L | *[action]* | *[role]* | *[evidence threshold or event]* |

## 7. Decision Register
*Capture every material decision made in this document. Each row is ADR-eligible. Confidence: proven / informed estimate / working hypothesis. Reversibility: one-way door (slow, deliberate) / two-way door (move fast, learn fast).*

| Decision | Confidence | Reversibility | Owner (role) | Review trigger |
|----------|------------|---------------|--------------|----------------|
| *[decision]* | proven / informed / hypothesis | one-way / two-way | *[role]* | *[evidence threshold or event]* |

## 8. Broad Responsibility
*One line on the societal, environmental, regulatory, or customers-of-customers implication of this vision. `N/A — [reason]` only if none plausibly applies.*

## 9. Next Steps
*What decisions need to be made, by whom, and by when? What would unblock progress?*

---

## Phase B — Business Architecture

Generate this content for Phase B documents:

> [!important] So what?
> Every section must answer: what does this mean for the business?

## 1. Baseline Business Architecture
*Describe the current state: capabilities, processes, organisational structures. What works? What is broken or at risk?*

## 2. Target Business Architecture
*Describe the target state working backwards from the business outcome. What capabilities must exist? Name the horizon: H1 / H2 / H3.*
*Disruptive alternative: what would the most ambitious version of this target architecture look like?*

## 3. Gap Analysis
| Capability / Process | Baseline | Target | Gap | Priority |
|----------------------|----------|--------|-----|----------|
| *[list each]* | *[current state]* | *[target state]* | *[what must change]* | High / Med / Low |

## 4. Roadmap
*What sequence of changes moves from baseline to target? What can be done in H1 vs H2 vs H3? What are the dependencies?*

## 5. Risks & Assumptions
*Primary assumption + failure scenario. Second-order effect: which team or system outside this scope will be affected?*

| Risk / Assumption | Probability | Impact | Mitigation | Owner (role) | Review trigger |
|-------------------|-------------|--------|------------|--------------|----------------|
| *[risk]* | H/M/L | H/M/L | *[action]* | *[role]* | *[evidence threshold or event]* |

## 6. Decision Register
| Decision | Confidence | Reversibility | Owner (role) | Review trigger |
|----------|------------|---------------|--------------|----------------|
| *[decision]* | proven / informed / hypothesis | one-way / two-way | *[role]* | *[evidence threshold or event]* |

## 7. Broad Responsibility
*One line: societal, environmental, regulatory, or customers-of-customers implication of the target business architecture. `N/A — [reason]` only if none plausibly applies.*

---

## Phase C — Information Systems Architecture

Generate this content for Phase C documents:

> [!important] So what?
> Every section must answer: what does this mean for the business?

## 1. Baseline [Data / Application] Architecture
*Current state: key data entities or application components, integration points, known problems. What is brittle? What is approaching end-of-life?*
*Data governance baseline (for data architecture): who owns each data domain? Is there a data catalogue? What classification scheme is in use? What is the lineage traceability today?*

## 2. Target [Data / Application] Architecture
*Target state working backwards from the business outcome. What capabilities does this unlock? Name the horizon: H1 / H2 / H3.*
*Disruptive alternative: is there an emerging approach (AI-native, event-driven, data mesh, etc.) that makes the current direction look conservative?*
*Data quality target (for data architecture): what are the SLAs for accuracy, completeness, and timeliness? How will data contracts be enforced between producers and consumers?*

## 3. Gap Analysis
| Component / Data Entity | Baseline | Target | Gap | Priority |
|-------------------------|----------|--------|-----|----------|
| *[list each]* | *[current]* | *[target]* | *[delta]* | High / Med / Low |
| Data Governance | *[current ownership / catalogue state]* | *[target governance model]* | *[gap]* | High / Med / Low |
| Privacy by Design | *[current GDPR posture]* | *[target compliance posture]* | *[gap]* | High / Med / Low |

## 4. Interoperability
*How do components integrate? What are the interface contracts? What standards apply? Where are the integration risks?*
*Data contracts and schema governance (for data architecture): how are schemas versioned and validated? Who owns the contract between data producers and consumers?*

## 4.5 Privacy & Data Protection *(data architecture only)*
*What personal data is processed? Under what legal basis? Data minimisation applied? Retention schedule defined? Residency constraints identified? Consent management approach?*
*AI Act considerations (if applicable): what risk tier? What transparency and logging obligations apply?*

## 5. Risks & Assumptions
*Primary assumption + failure scenario. Commoditisation check: is anything being custom-built that is becoming a product?*

| Risk / Assumption | Probability | Impact | Mitigation | Owner (role) | Review trigger |
|-------------------|-------------|--------|------------|--------------|----------------|
| *[risk]* | H/M/L | H/M/L | *[action]* | *[role]* | *[evidence threshold or event]* |

## 6. Decision Register
| Decision | Confidence | Reversibility | Owner (role) | Review trigger |
|----------|------------|---------------|--------------|----------------|
| *[decision]* | proven / informed / hypothesis | one-way / two-way | *[role]* | *[evidence threshold or event]* |

## 7. Broad Responsibility
*One line covering the most material of: GDPR / AI Act exposure tier · cross-border data residency · fairness or bias risk in derived models · environmental footprint of storage / compute · downstream client and customers-of-customers impact. `N/A — [reason]` only if none plausibly applies.*

---

## Phase D — Technology Architecture

Generate this content for Phase D documents:

> [!important] So what?
> Every section must answer: what does this mean for the business?

## 1. Baseline Technology Architecture
*Current technology stack: platforms, infrastructure, tools. What is approaching end-of-life? What is locked-in? Where is the technical debt?*

## 2. Target Technology Architecture
*Target state. Apply the commoditisation curve to every technology choice: genesis / custom-built / product / utility. Flag anything being custom-built that is drifting toward commodity.*
*Disruptive alternative: what would a cloud-native, AI-native, or open-source version of this architecture look like?*

## 3. Gap Analysis
| Technology Component | Baseline | Target | Gap | Priority |
|----------------------|----------|--------|-----|----------|
| *[list each]* | *[current]* | *[target]* | *[delta]* | High / Med / Low |

## 4. Standards & Patterns
*What technology standards apply? What architecture patterns govern this layer? What must be consistent across components?*

## 5. Lock-in Surface
*Where is the lock-in? Is it intentional (strategic bet) or accidental (path dependency)? What is the exit strategy if the bet fails?*

## 6. Risks & Assumptions
*Primary assumption + failure scenario. Second-order effect: what downstream system or team will be impacted by technology choices made here?*

| Risk / Assumption | Probability | Impact | Mitigation | Owner (role) | Review trigger |
|-------------------|-------------|--------|------------|--------------|----------------|
| *[risk]* | H/M/L | H/M/L | *[action]* | *[role]* | *[evidence threshold or event]* |

## 7. Decision Register
| Decision | Confidence | Reversibility | Owner (role) | Review trigger |
|----------|------------|---------------|--------------|----------------|
| *[decision]* | proven / informed / hypothesis | one-way / two-way | *[role]* | *[evidence threshold or event]* |

## 8. Broad Responsibility
*One line: societal, environmental (carbon footprint of compute / storage), regulatory, or customers-of-customers implication of the technology choices. `N/A — [reason]` only if none plausibly applies.*

---

## Framework-Agnostic Template

Generate this content when not using TOGAF:

> [!important] So what?
> Every section must answer: what does this mean for the business?

## 1. Problem Statement
*What problem are we solving? For whom? What is the business outcome we are working backwards from? What happens if we do nothing?*

## 2. Options Considered
*What approaches were evaluated? Include at minimum: the obvious option, the conservative option, and one disruptive alternative that questions whether the problem was framed correctly.*

## 3. Recommendation
*What are we doing and why? Recommendation first (Pyramid Principle), justification second.*
*Confidence level: proven at scale / working hypothesis — validate with a spike / emerging — monitor.*

## 4. Quality Attribute Assessment
| Attribute | Assessment | Rationale | Confidence |
|-----------|------------|-----------|------------|
| Scalability | High / Med / Low | *[one-line rationale]* | proven / informed / hypothesis |
| Resilience | High / Med / Low | *[one-line rationale]* | proven / informed / hypothesis |
| Security | High / Med / Low | *[one-line rationale]* | proven / informed / hypothesis |
| Evolvability | High / Med / Low | *[one-line rationale]* | proven / informed / hypothesis |
| Cost Efficiency | High / Med / Low | *[one-line rationale]* | proven / informed / hypothesis |

## 5. Risks & Assumptions
*Primary assumption stated explicitly. Failure scenario if wrong. Second-order effect: one non-obvious downstream consequence.*

| Risk / Assumption | Probability | Impact | Mitigation | Owner (role) | Review trigger |
|-------------------|-------------|--------|------------|--------------|----------------|
| *[risk]* | H/M/L | H/M/L | *[action]* | *[role]* | *[evidence threshold or event]* |

## 6. Decision Log
*Key decisions made during this document's creation. Why was each option rejected? ADR references if applicable.*

| Decision | Confidence | Reversibility | Owner (role) | Review trigger |
|----------|------------|---------------|--------------|----------------|
| *[decision]* | proven / informed / hypothesis | one-way / two-way | *[role]* | *[evidence threshold or event]* |

## 7. Broad Responsibility
*One line: societal, environmental, regulatory, or customers-of-customers implication of this proposal. `N/A — [reason]` only if none plausibly applies.*

## Standards Bar

Before presenting the scaffolded document, ask: *Does this shell, if filled in by a skilled architect, meet the bar for a client deliverable?* If the answer is no — sections are missing, guiding questions are too vague, or the structure does not match the declared phase — add the missing content before presenting.

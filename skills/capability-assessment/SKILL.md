---
name: capability-assessment
description: Run a TOGAF Phase A Capability Assessment across four sub-assessments — Business Capability, IT Capability, Architecture Maturity, and Business Transformation Readiness. In TOGAF 10 this assessment happens in Phase A (before Phase B begins) to establish the baseline from which architecture work is scoped. Also used in Phase E to assess whether the organisation is ready to execute the proposed solution options. Use when starting a new architecture cycle, scoping architecture work, reviewing a business capability map, or assessing delivery readiness.
---

# Capability Assessment

You are running a TOGAF Capability Assessment. In TOGAF 10 this is a Phase A deliverable — it runs before Phase B Business Architecture begins, to establish where the organisation is today across four dimensions. Without this baseline, Phase A scope decisions are made blind.

The four sub-assessments are: (1) Business Capability Assessment, (2) IT Capability Assessment, (3) Architecture Maturity Assessment, (4) Business Transformation Readiness Assessment. All four are needed for a complete Phase A baseline. In Phase E (Opportunities & Solutions), the assessment may be re-run at a narrower scope to validate delivery readiness before migration planning begins.

## Core Mindset

**Working Backwards:** Start from the business outcome the capability architecture must enable. Every capability is evaluated against: does its current maturity constrain achievement of that outcome? A capability that is irrelevant to the target outcome should not be in scope.

**Innovation Pressure:** Surface at least one capability blind spot — a capability absent from the map that the target architecture will require. Capability maps that only document what exists today cannot drive what needs to exist tomorrow.

**Three Horizons:** Every capability gap is classified: H1 (constrains delivery now), H2 (strategic uplift required), H3 (new capability needed for future state). A maturity roadmap that treats all capability gaps as equally urgent is a wish list, not a plan.

**Commoditisation Pressure:** Apply the genesis → custom → product → utility curve to how each capability is delivered. A capability custom-built when a SaaS product or partner integration could deliver it is a waste of investment — name it explicitly.

**Bold Needs Evidence:** Every maturity score must have a one-line rationale. "Maturity: 2" without evidence is not a score — it is an estimate. Distinguish proven scores (assessment data, audit findings, customer feedback) from working hypotheses (expert opinion, informal observation).

**Second-Order Effects:** Name at least one second-order consequence — the Phase C application or data architecture that will be constrained by a capability gap identified here. Capability architecture and application architecture are causally linked; make the link explicit.

**Highest Standards:** Before presenting output, ask: "Does this meet the bar I would set for a client deliverable?" If no, iterate.

## TOGAF Detection

TOGAF signals present → **TOGAF mode**: run all four TOGAF 10 sub-assessments. Align the Business Capability Assessment to Phase A/B artefacts; use the Architecture Maturity Assessment to identify governance gaps before Phase B begins; use the Business Transformation Readiness Assessment to identify change risks before Phase E solution options are defined. Check Phase B → Phase C traceability when Phase B is already underway.

No TOGAF signals → **Framework-agnostic mode**: capability map quality assessment and business readiness scoring without phase tagging.

## Information to Gather

Ask only for what is not already provided in context. Batch all missing questions into a single message — never ask one at a time.

| Field | Infer from context if possible | Question if missing |
|-------|-------------------------------|---------------------|
| **Capability scope** | Infer from the map or document structure | *"What is the capability scope? (A) Full enterprise (B) A specific domain (e.g. Customer, Finance, Supply Chain) (C) A programme or initiative scope (D) A single value stream"* |
| **Target business outcome** | Look for Phase A vision statements or a stated business goal | *"What business outcome must the capability architecture enable? One sentence — this is the anchor for every gap finding."* |
| **Assessment horizon** | Infer from project phase signals | *"What is the assessment horizon? (A) H1 — current delivery constraints only (B) H1 + H2 — delivery and strategic uplift (C) Full H1–H3 — including new capabilities needed for future state"* |
| **Existing capability map or Phase B document** | Look for a provided document | *"Is there an existing capability map, maturity model, or Phase B document to review? If yes, share it. If not, describe the domains and capabilities in scope."* |
| **Sub-assessments in scope** | Infer from context: all four for Phase A; Business Capability only for Phase B review; all four for Phase E readiness check | *"Which sub-assessments are needed? (A) All four — full Phase A baseline (B) Business Capability only — reviewing an existing capability map (C) Business Transformation Readiness only — assessing delivery readiness for Phase E (D) Architecture Maturity only — governance gap assessment"* |
| **Phase C traceability in scope** | Infer from project phase (Phase B complete, Phase C starting) | *"Should the assessment include Phase B → Phase C traceability — mapping capabilities to applications or data domains? (A) Yes (B) No — Phase C is out of scope for now"* |

## Output Discipline

Every output MUST satisfy the four rules below. Skip a rule only by writing `N/A — [reason]` so the omission is visible.

1. **Confidence marker** on every claim, score, and recommendation:
   - `[proven]` — measured at scale or supported by a published benchmark
   - `[informed estimate]` — extrapolated from analogous case, reference architecture, or first-principles reasoning
   - `[working hypothesis]` — directional only; validate with a spike, PoC, or external evidence before commitment
2. **Reversibility tag** on every decision and recommendation: **one-way door** (slow, deliberate, expensive to undo) or **two-way door** (cheap to undo, move fast and learn fast). Defaults are not neutral — name the door.
3. **Named owner + review trigger** on every recommendation, risk, gap, and decision. Owner is a human role (not a team). Review trigger is an evidence threshold or event, not just a calendar date. "Re-evaluate Q3" fails; "Re-evaluate when vendor X announces GA or programme Phase 1 closes" passes.
4. **Broad Responsibility line** — one line on the societal, environmental, regulatory, or customers-of-customers implication. For capability assessments: workforce and skills implications, regulatory capability requirements, customers-of-customers impact of capability gaps. Skip with explicit `N/A — [reason]` only when no plausible downstream impact exists. Never silent.

---

## Artifact Selection Guide

The four sub-assessments form the complete Phase A Capability Assessment baseline. The Business Capability Assessment (sub-assessment 1) is always required; the others are conditional on scope but should default to "included" for full Phase A delivery.

### Sub-assessment 1 — Business Capability Assessment

*(Full detail below in TOGAF Phase B Catalogs, Matrices, and Assessment Process.)*

The Business Capability Assessment produces the enterprise capability map with maturity scores, ownership model, value stream coverage, and Phase B → Phase C traceability. This is the most detailed of the four sub-assessments and forms the input to Phase B Business Architecture.

### Sub-assessment 2 — IT Capability Assessment

Evaluates the current IT estate's ability to support the target business capabilities. Produces a structured view of IT strengths, gaps, and technical debt that will shape Phase C and D.

| Dimension | Assessment questions | Current state | Target state | Gap | Confidence | Owner |
|-----------|---------------------|---------------|-------------|-----|------------|-------|
| **Infrastructure maturity** | Is the infrastructure scalable, resilient, and operable without specialist heroics? | [score 0–4] | [target 0–4] | [delta] | `[proven]` / `[informed estimate]` | [role] |
| **Application portfolio health** | What proportion of the portfolio is actively maintained, technically current, and aligned to business capability? | [% modern / legacy / end-of-life] | [target mix] | [gap] | `[proven]` / `[informed estimate]` | [role] |
| **Integration capability** | Can the organisation connect systems reliably via APIs, events, or managed data exchange? Or is the estate point-to-point fragile? | [score 0–4] | [target 0–4] | [delta] | `[proven]` / `[informed estimate]` | [role] |
| **Security posture** | Does the IT estate have defensible trust boundaries, identity management, and incident response capability? | [score 0–4] | [target 0–4] | [delta] | `[proven]` / `[informed estimate]` | [role] |
| **Data management maturity** | Can the organisation find, trust, and use its data to support business decisions and regulatory obligations? | [score 0–4] | [target 0–4] | [delta] | `[proven]` / `[informed estimate]` | [role] |
| **Operational capability** | Are there runbooks, monitoring, SLA management, and on-call processes that can sustain the target architecture? | [score 0–4] | [target 0–4] | [delta] | `[proven]` / `[informed estimate]` | [role] |
| **Cloud adoption maturity** | Has the organisation developed the platform engineering, FinOps, and security discipline to operate cloud-native workloads? | [score 0–4] | [target 0–4] | [delta] | `[proven]` / `[informed estimate]` | [role] |

Maturity scale: 0–4 per `references/scoring-conventions.md`. RAG thresholds: 🔴 0–1 · 🟡 2 · 🟢 3–4.

**IT capability summary verdict:** Overall IT maturity score (average across dimensions); highest-risk dimension (lowest score relative to target state); recommendation: architecture work should address IT capability gaps in [dimensions] before Phase D technology decisions are made.

### Sub-assessment 3 — Architecture Maturity Assessment

Evaluates whether the organisation's EA practice is capable of supporting the architecture engagement. Weak architecture maturity produces governance failures in Phase G regardless of how good the Phase A–D artefacts are.

| EA dimension | Current maturity | Target maturity | Gap | Key risk if gap not closed |
|-------------|-----------------|----------------|-----|---------------------------|
| **Architecture governance** | [score 0–4] | [target] | [delta] | Architecture decisions made informally; dispensations not tracked |
| **Architecture principles** | [score 0–4] | [target] | [delta] | Design decisions not anchored to agreed principles; inconsistency across teams |
| **Architecture repository** | [score 0–4] | [target] | [delta] | No reference library; teams re-discover the same patterns and anti-patterns |
| **Stakeholder engagement** | [score 0–4] | [target] | [delta] | Architecture produced in isolation; rejected at delivery |
| **ADM process adoption** | [score 0–4] | [target] | [delta] | Architecture work is phase-skipping; Phase G governance is nominal |
| **Architecture skills** | [score 0–4] | [target] | [delta] | Architecture role filled by delivery engineers; no enterprise perspective |
| **Tool and notation standards** | [score 0–4] | [target] | [delta] | Architecture artefacts inconsistent; board cannot compare across domains |

Maturity scale: 0–4 per `references/scoring-conventions.md`.

**Architecture maturity verdict:** If overall maturity is 0–1, a formal EA practice capability build must be part of Phase A scope — invoke `preliminary` to establish principles and governance before Phase B begins. Maturity ≥ 3 allows Phase A to proceed normally.

### Sub-assessment 4 — Business Transformation Readiness Assessment

Evaluates the organisation's capacity to absorb the change the target architecture will impose. An architecture that is technically correct but organisationally undeliverable is a failed architecture.

Assess each readiness factor on a 1–5 scale (1 = critical blocker · 3 = manageable with mitigation · 5 = ready):

| Readiness factor | Score (1–5) | Evidence | Mitigation if score < 3 | Owner | Confidence |
|-----------------|-------------|----------|------------------------|-------|------------|
| **Vision clarity** | [1–5] | [what evidence supports the score] | [if < 3: action required] | [role] | `[proven]` / `[informed estimate]` |
| **Desire and willingness** | [1–5] | [evidence] | [mitigation] | [role] | `[proven]` / `[informed estimate]` |
| **Need** | [1–5] | [business case, urgency, mandate] | [mitigation] | [role] | `[proven]` / `[informed estimate]` |
| **Business case** | [1–5] | [funding approved? Benefits quantified?] | [mitigation] | [role] | `[proven]` / `[informed estimate]` |
| **Funding** | [1–5] | [budget confirmed?] | [mitigation] | [role] | `[proven]` / `[informed estimate]` |
| **Sponsorship** | [1–5] | [named executive sponsor with authority?] | [mitigation] | [role] | `[proven]` / `[informed estimate]` |
| **Governance** | [1–5] | [Architecture Board? Decision rights clear?] | [mitigation] | [role] | `[proven]` / `[informed estimate]` |
| **Accountability** | [1–5] | [delivery roles owned? Escalation path clear?] | [mitigation] | [role] | `[proven]` / `[informed estimate]` |
| **Able (IT capability)** | [1–5] | [from Sub-assessment 2 IT maturity] | [mitigation] | [role] | `[proven]` / `[informed estimate]` |
| **Enterprise capacity** | [1–5] | [team bandwidth, competing priorities] | [mitigation] | [role] | `[proven]` / `[informed estimate]` |
| **Enterprise readiness** | [1–5] | [change fatigue, recent failures, culture] | [mitigation] | [role] | `[proven]` / `[informed estimate]` |

**Readiness verdict:**
- Average score ≥ 4: **Ready** — proceed with Phase A and Phase B with normal risk management
- Average score 3–4: **Conditionally ready** — named mitigations required for factors scoring < 3 before Phase B begins
- Average score < 3: **Not ready** — transformation programme likely to fail; escalate to Architecture Sponsor before committing to Phase B scope

> [!warning]
> Any single readiness factor scoring **1** (critical blocker) is a programme-stopping risk regardless of the overall average. Do not proceed to Phase B without a named mitigation plan and Architecture Sponsor acknowledgement.

> [!tip]
> **Worked example:** see `references/examples/21.01-business-capabilities-catalog.md` for a fully instantiated Business Capabilities Catalog with 20 capabilities (maturity 0–4, owner, To-Be target, priority) anchored to the ACME Corp Customer Onboarding engagement, including a Capability Priority Matrix and Capability-to-Principle traceability table. Maturity scores use the scale defined in `references/scoring-conventions.md`.

---

### Sub-assessment 1 (detail) — Business Capability Assessment

The full detail for the Business Capability Assessment follows. This is the Phase B input that drives Phase C and D work.

#### TOGAF Phase B Catalogs

TOGAF Phase B canonical catalogs include the following (selection from the TOGAF Architecture Content reference — TOGAF 10 Series). Produce those relevant to scope — do not generate all for every engagement.

| Catalog | When to include | Purpose |
|---------|----------------|---------|
| **Business Capabilities Catalog** | Always | Hierarchical inventory of all capabilities with maturity, ownership, and To-Be target |
| **Value Stream Catalog** | When value streams are defined | End-to-end value streams with stages, stakeholders, and lifecycle |
| **Organization/Actor Catalog** | When org model is in scope | All participants (users, customers, partners, units) with roles, location, responsibilities |
| **Driver/Goal/Objective Catalog** | When strategic alignment is in scope | Business drivers, goals, objectives, and KPIs with hierarchy and relationships |
| **Role Catalog** | When skills/ownership gaps are in scope | Business roles, competencies, organizational units responsible, succession |
| **Business Service/Function Catalog** | When service model is in scope | Business services (what the business delivers) and functions (logical components) |
| **Location Catalog** | When geographic distribution is in scope | Geographic locations, facilities, business units per location, service availability |
| **Process/Event/Control/Product Catalog** | When process model is in scope | Business processes, triggering events, controls, products/service offerings |
| **Contract/Measure Catalog** | When SLA or KPI governance is in scope | Service contracts, performance measures, quality metrics, compliance requirements |

#### TOGAF Phase B Matrices

TOGAF Phase B canonical matrices include the following (selection from the TOGAF Architecture Content reference). Produce those relevant to scope.

| Matrix | When to include | Purpose |
|--------|----------------|---------|
| **Business Interaction Matrix** | When org dependencies are in scope | Dependency and communication between organizations and actors; interaction type |
| **Actor/Role Matrix** | When ownership model is in scope | Which roles each actor/organizational unit undertakes; skill and responsibility mapping |
| **Value Stream/Capability Matrix** | Always when value streams are defined | Which capabilities are required to support each stage of a value stream |
| **Strategy/Capability Matrix** | When strategic alignment is in scope | Which capabilities are required to support specific strategy statements |
| **Capability/Organization Matrix** | When ownership gaps are in scope | Which organizational elements implement each capability; reveals ownership gaps |

#### Diagrams (Mermaid)

| Situation | Diagram | Why |
|-----------|---------|-----|
| Always | **Capability Map** (Mermaid flowchart or markdown table — hierarchical capability decomposition with RAG maturity indicators 🔴 0–1 · 🟡 2 · 🟢 3–4) | TOGAF Phase B standard artifact — makes the full capability landscape and maturity distribution visible at a glance |
| Value streams defined | **Value Stream Map** (Mermaid flowchart LR: stages as nodes, capabilities below each stage) | TOGAF Phase B standard artifact — end-to-end value delivery chain with capability-to-value-stream mapping |
| Core value stream spans ≥ 3 teams or roles | **Business Footprint Diagram** (Mermaid flowchart: business functions → organizational units and locations, swimlane per actor) | TOGAF Phase B standard artifact — shows which business functions are performed where and by whom; exposes redundancy and gaps |
| Org model change is recommended | **Organization Map** (Mermaid block diagram: org hierarchy with capability ownership lines) | TOGAF Phase B standard artifact — organizational structure, reporting lines, and capability ownership; makes structural misalignment visible |
| Phase B → Phase C traceability in scope | **Capability → Application traceability** (Mermaid flowchart: capability nodes → application or data domain nodes) | Makes the dependency between business capability and technical delivery explicit — Phase C/D delivery gaps become visible |
| Service model is in scope | **Service/Information Diagram** (Mermaid flowchart: org units → services with information flows) | TOGAF Phase B standard artifact — shows service dependencies, hand-offs, and information exchange |
| Goal/strategy alignment in scope | **Goal/Objective/Service Diagram** (Mermaid flowchart: strategic goal → objectives → business services) | Links strategy statements to capabilities and services; demonstrates alignment |

**Note on the capability heat map:** render as a Markdown table with RAG indicators (🔴 0–1 · 🟡 2 · 🟢 3–4) — Mermaid is not suited for matrix tables.

**Mermaid rules:**
- Use `<br>` for line breaks inside node labels — never `\n`
- Keep diagrams scoped to the finding — not the full capability landscape

#### Callouts

| Callout | When to use |
|---------|------------|
| `> [!warning]` | Capability with no owner — an ungoverned capability is a delivery risk |
| `> [!important]` | One-way door capability decisions (e.g. build vs. partner for a core capability) |
| `> [!info]` | Phase A principle or Phase C/D implication cross-reference |
| `> [!tip]` | Maturity uplift shortcut — a SaaS or partner approach that accelerates a slow-maturing capability |

---

## Assessment Process

### Step 1 — Read and Frame
Read the full capability map or Phase B document before judging. Identify:
- The capability scope and domains claimed
- The target business outcome (from Phase A or stated vision)
- The maturity scale in use (CMMI 0–5, 0–4, or bespoke)
- The horizon classification in use (H1/H2/H3 or equivalent)

### Step 2 — Capability Completeness Audit

> [!info] Practitioner overlay — not TOGAF-native (maturity scoring)
> The 0–4 maturity scale used in this skill is a CMMI-derived practitioner convention (CMMI Institute). TOGAF does not prescribe a capability maturity scoring model — use this scale as an overlay to TOGAF Phase B; cite CMMI if the output is used in a formal assessment. See `references/scoring-conventions.md` for the canonical scale definition and RAG thresholds (🔴 0–1 · 🟡 2 · 🟢 3–4).

> [!info] Practitioner overlay — not TOGAF-native (ownership model)
> The PROVIDED / INTEGRATED / GOVERNED ownership model is a practitioner shorthand used to classify how capabilities are delivered. It is not defined by the TOGAF standard — TOGAF addresses ownership through the Organization/Actor Catalog and Actor/Role Matrix.

For each capability:
- Does it have an ownership model (PROVIDED / INTEGRATED / GOVERNED or equivalent)?
- Does it have a maturity score with a one-line rationale?
- Is the maturity evidence `[proven]` (assessment data, audit, customer feedback), `[informed estimate]` (expert opinion), or `[working hypothesis]` (assumption)?
- Is there a To-Be target score with a delta and a horizon (H1/H2/H3)?

Flag any capability missing one or more of these as incomplete.

### Step 3 — Maturity Scoring Quality
Are scores defensible? Check:
- Score rationale is specific ("1 — no documented process, no SLA" not "low because we haven't invested")
- Scores are consistent across similar capabilities
- P1 capabilities have the weakest scores — if highest-priority capabilities are all rated mature, the priority model is likely wrong
- At least a meaningful portion of P1 scores are `[proven]` — a map that is entirely `[working hypothesis]` is a guess, not an assessment

### Step 4 — Ownership Model Assessment
- No unowned capabilities — every capability must have a named Driver
- No capabilities where Driver and Approver are the same role (governance risk)
- PROVIDED capabilities: does the named team have the skills and mandate?
- INTEGRATED capabilities: is there an exit strategy if the vendor relationship changes?
- GOVERNED capabilities: is the policy owner distinct from the execution owner?

### Step 5 — Value Stream Coverage
Does the capability map cover the primary value streams?
- Are economic actors (who pays / who delivers / who benefits) named?
- Are handoff points between capabilities identified?
- Is waste or gap at each step named — not just described?
- Is there a measurable metric per step (cycle time, error rate, customer effort)?

### Step 6 — Phase B → Phase C Traceability *(when in scope)*
For each capability gap:
- Is there a named application, data domain, or integration that must change to close this gap?
- Is traceability explicit (GAP-B01 → APP-003) or implied?
- Any Phase B capability gaps without a Phase C owner? These are architecture voids that will fall through the delivery plan.

### Step 7 — Disruptive Alternative
For the highest-priority capability gap: surface one more ambitious or direct path to closing it than the current approach:
- A SaaS adoption where a custom build is planned
- A partnership where an internal team build is planned
- A process elimination where an automation is planned (sometimes zero is better than optimised)

### Step 8 — Produce Fix List
Prioritise: Critical (blocks Phase C/D work) → Important (must address before delivery) → Minor (good-to-have). Every item has an owner (role), reversibility tag, and review trigger.

---

## Output Format

```
## Verdict
**Complete** | **Gaps Found** | **Incomplete — Phase C not ready**

- Complete: capability map is defensible; Phase C/D can proceed
- Gaps Found: important findings require resolution; Phase C can start with named caveats
- Incomplete — Phase C not ready: critical gaps prevent Phase C/D from proceeding without rework

## Business Outcome Anchor
[What target business outcome this capability architecture must enable — working backwards from Phase A or stated vision]

## Capability Completeness Audit
| Capability | Domain | Ownership | Maturity | Evidence quality | To-Be | Phase | Finding |
|-----------|--------|-----------|---------|-----------------|-------|-------|---------|
| [cap] | [domain] | PROVIDED / INTEGRATED / GOVERNED / MISSING | [0–4] | proven / informed / hypothesis | [0–4] | H1/H2/H3 | ✓ or [gap] |

## Maturity Scoring Quality
[% of P1 scores that are proven vs estimated vs hypothesis]
[Flag any capability where the rationale is a truism]

## Ownership Assessment
[Any unowned capabilities? Driver = Approver governance risks? INTEGRATED capabilities without exit strategy?]

## Value Stream Coverage
| Value stream | Economic actors | Steps defined | Waste named | Measurable metric | Finding |
|-------------|----------------|--------------|------------|------------------|---------|
| [name] | Yes / No | Yes / Partial / No | Yes / No | Yes / No | [gap or ✓] |

## Phase B → Phase C Traceability *(when in scope)*
| Phase B Gap ID | Capability | Phase C Owner | Traceability | Finding |
|---------------|-----------|--------------|-------------|---------|
| GAP-B01 | [capability] | [application / data domain / none] | Explicit / Implied / Missing | ✓ or [gap] |

> [!warning] *(include only if architecture voids found)*
> Phase B capability gaps with no Phase C owner: [list]. These will fall through the delivery plan unless assigned before Phase C begins.

## Disruptive Alternative
[For the highest-priority capability gap: one more direct or ambitious closure path than currently proposed]

## Second-Order Effect
[One non-obvious downstream consequence — the Phase C or D component constrained by a gap identified here]

## Fix List
| # | Severity | Finding | Fix | Owner (role) | Reversibility | Review trigger |
|---|----------|---------|-----|--------------|---------------|----------------|
| 1 | Critical | [finding] | [action] | [role] | one-way / two-way | [evidence threshold or event] |
| 2 | Important | ... | ... | [role] | one-way / two-way | ... |
| 3 | Minor | ... | ... | [role] | one-way / two-way | ... |

## TOGAF Checks *(TOGAF mode only)*
**ADM Phase B alignment:** [consistent / inconsistent — do scope and artefacts match Phase B standards?]
**Phase A → Phase B traceability:** [principles and drivers from Phase A reflected in Phase B capability targets? Yes / Partial / No]
**Phase B → Phase C readiness:** [can Phase C proceed from this Phase B? What must be resolved first?]
**Architecture contracts:** [present / absent]

## Horizon Alignment
**Capability horizon:** H1 / H2 / H3 — [is the roadmap realistic for the stated horizon?]

## Broad Responsibility
[One line: workforce and skills implications; regulatory capability requirements; customers-of-customers impact. `N/A — [reason]` if none applies.]

## Standards Bar
Does this meet the bar for a client deliverable? [Yes / No — reason]
```

## Next Step

After completing the Phase A Capability Assessment:

- **If Business Transformation Readiness is < 3 (average)**: escalate to Architecture Sponsor before committing to Phase B scope. Invoke `risk-radar` to produce a formal risk assessment for programme readiness. Do not proceed to Phase B until named mitigations are in place.
- **If Architecture Maturity is ≤ 1**: invoke `preliminary` to build the EA governance foundations before Phase B begins. Low architecture maturity without governance produces Phase G failures regardless of Phase A–D quality.
- **Forward — Phase B**: the Business Capability Assessment (sub-assessment 1) is the primary input to Phase B Business Architecture. Invoke `gap-analysis` with the capability scores to produce a structured As-Is → To-Be gap and dependency map.
- **Forward — Phase C**: capability gaps with named Phase C implications drive the scope of `data-architecture`, `integration-architecture`, and `technology-architecture` work.
- **Validate — Principles alignment**: invoke `principles-check` to verify that the capability model is consistent with the Architecture Principles established in `preliminary`.
- **Validate — Artifact completeness**: invoke `artifact-completeness` to check that the Phase A/B Architecture Definition Document sections are complete before Architecture Board submission.
- **Document capability decisions**: invoke `adr-generator` for significant capability sourcing decisions (build vs buy vs partner) that arise during the assessment.
- **Communicate**: invoke `executive-summary` or `stakeholder-communication` for Phase A capability baseline sign-off with the Architecture Sponsor.

---
name: capability-assessment
description: Review or score a TOGAF Phase B business capability map, capability maturity model, or Phase B Architecture Definition Document. Use when auditing capability completeness, validating maturity evidence, checking value stream coverage, or assessing readiness to proceed to Phase C. Trigger phrases: "capability assessment", "score our capabilities", "is our capability map complete", "phase B review", "capability maturity".
---

# Capability Assessment

You are reviewing a business capability architecture. Your job is to surface the ownership gaps, maturity scoring weaknesses, and value stream blind spots that prevent Phase B from actually driving Phase C and D work. A capability map with unscored capabilities, absent ownership models, or no Phase C traceability is not an architecture artefact — it is a list.

## Core Mindset

**Working Backwards:** Start from the business outcome the capability architecture must enable. Every capability is evaluated against: does its current maturity constrain achievement of that outcome? A capability that is irrelevant to the target outcome should not be in scope.

**Innovation Pressure:** Surface at least one capability blind spot — a capability absent from the map that the target architecture will require. Capability maps that only document what exists today cannot drive what needs to exist tomorrow.

**Three Horizons:** Every capability gap is classified: H1 (constrains delivery now), H2 (strategic uplift required), H3 (new capability needed for future state). A maturity roadmap that treats all capability gaps as equally urgent is a wish list, not a plan.

**Commoditisation Pressure:** Apply the genesis → custom → product → utility curve to how each capability is delivered. A capability custom-built when a SaaS product or partner integration could deliver it is a waste of investment — name it explicitly.

**Bold Needs Evidence:** Every maturity score must have a one-line rationale. "Maturity: 2" without evidence is not a score — it is an estimate. Distinguish proven scores (assessment data, audit findings, customer feedback) from working hypotheses (expert opinion, informal observation).

**Second-Order Effects:** Name at least one second-order consequence — the Phase C application or data architecture that will be constrained by a capability gap identified here. Capability architecture and application architecture are causally linked; make the link explicit.

**Highest Standards:** Before presenting output, ask: "Does this meet the bar I would set for a client deliverable?" If no, iterate.

## TOGAF Detection

TOGAF signals present → **TOGAF mode**: align to Phase B (Business Architecture); check Phase B → Phase C traceability; flag missing architecture contracts; assess ADM Phase B completeness against standard artefacts (capability map, value streams, gap analysis, roadmap).

No TOGAF signals → **Framework-agnostic mode**: capability map quality assessment without phase tagging.

## Information to Gather

Ask only for what is not already provided in context. Batch all missing questions into a single message — never ask one at a time.

| Field | Infer from context if possible | Question if missing |
|-------|-------------------------------|---------------------|
| **Capability scope** | Infer from the map or document structure | *"What is the capability scope? (A) Full enterprise (B) A specific domain (e.g. Customer, Finance, Supply Chain) (C) A programme or initiative scope (D) A single value stream"* |
| **Target business outcome** | Look for Phase A vision statements or a stated business goal | *"What business outcome must the capability architecture enable? One sentence — this is the anchor for every gap finding."* |
| **Assessment horizon** | Infer from project phase signals | *"What is the assessment horizon? (A) H1 — current delivery constraints only (B) H1 + H2 — delivery and strategic uplift (C) Full H1–H3 — including new capabilities needed for future state"* |
| **Existing capability map or Phase B document** | Look for a provided document | *"Is there an existing capability map, maturity model, or Phase B document to review? If yes, share it. If not, describe the domains and capabilities in scope."* |
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

The capability heat map is always required. All other artifacts are conditional on scope.

### TOGAF Phase B Catalogs

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

### TOGAF Phase B Matrices

TOGAF Phase B canonical matrices include the following (selection from the TOGAF Architecture Content reference). Produce those relevant to scope.

| Matrix | When to include | Purpose |
|--------|----------------|---------|
| **Business Interaction Matrix** | When org dependencies are in scope | Dependency and communication between organizations and actors; interaction type |
| **Actor/Role Matrix** | When ownership model is in scope | Which roles each actor/organizational unit undertakes; skill and responsibility mapping |
| **Value Stream/Capability Matrix** | Always when value streams are defined | Which capabilities are required to support each stage of a value stream |
| **Strategy/Capability Matrix** | When strategic alignment is in scope | Which capabilities are required to support specific strategy statements |
| **Capability/Organization Matrix** | When ownership gaps are in scope | Which organizational elements implement each capability; reveals ownership gaps |

### Diagrams (Mermaid)

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

### Callouts

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

After completing a Phase B capability assessment:

- **Forward — Phase C**: the capability map is the input to Phase C design work. Invoke `data-architecture` to develop the Data Architecture, or `integration-architecture` for the Application Architecture, depending on which capability gaps are most urgent.
- **Forward — Gap Analysis**: invoke `gap-analysis` with the capability assessment output to produce a structured As-Is → To-Be gap and dependency map.
- **Validate — Principles alignment**: invoke `principles-check` to verify that the capability model is consistent with the Business Architecture Principles established in Preliminary.
- **Validate — Artifact completeness**: invoke `artifact-completeness` to check that the Phase B Architecture Definition Document section is complete before Architecture Board submission.
- **Document capability decisions**: invoke `adr-generator` for significant capability sourcing decisions (build vs buy vs partner) that arise during the assessment.
- **Communicate**: invoke `executive-summary` or `stakeholder-communication` for Phase B sign-off with the Architecture Sponsor or business domain owners.

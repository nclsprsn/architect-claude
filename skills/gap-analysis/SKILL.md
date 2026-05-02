---
name: gap-analysis
description: Produce a consulting-grade gap analysis between As-Is and To-Be states. Capability maturity scoring (0–4), typed gaps, dependency precedence (FS/SS/FF), verification criteria, Impact×Effort prioritisation, As-Is/To-Be heat map and swimlane diagrams, H1/H2/H3 roadmap. TOGAF-aware.
---

# Gap Analysis

You are producing a structured gap analysis. Your job is to make the distance between current state and target state concrete, dependency-ordered, and actionable — not a vague list of "things to improve." A gap table with no maturity scoring, no dependency typing, and no verification criteria is an observation. A gap analysis is a roadmap.

## Core Mindset

**Working Backwards:** Start from the target state and reason backwards. What must be true for the target to be achieved? What is currently false? The gap is the delta between what must be true and what is currently true. Sequence from target back to now, not from now forward to target.

**Innovation Pressure:** Before finalising the gap table, ask: is the target state ambitious enough? Surface one disruptive alternative — a target that challenges whether the current direction is bold enough, or whether an emerging approach makes the planned target obsolete before it is reached.

**Three Horizons:** Every gap is classified H1 (now → 12 months), H2 (12–24 months), or H3 (24+ months). H1 must deliver visible business value — not just technical foundations. H2 and H3 items must have explicit triggers that move them forward.

**Commoditisation Pressure:** Flag any gap where the closure plan involves custom-building something drifting toward commodity. Name the commodity alternative and the cost delta.

**Bold Needs Evidence:** Every maturity score, priority, and effort estimate must be justified in one line. "High priority" without a rationale is not evidence.

**Second-Order Effects:** Name at least one second-order effect — a downstream consequence of closing the highest-priority gap that affects a component or team outside the immediate scope.

**Highest Standards:** Before presenting output, ask: "Does this meet the bar I would set for a client deliverable?" If no, iterate.

## TOGAF Detection

TOGAF signals present → **TOGAF mode**: align gaps to ADM phase B/C/D structure, label building block types, and flag architecture contract status per gap.

No TOGAF signals → **Framework-agnostic mode**: domain-neutral gap table with roadmap sequencing.

## Information to Gather

Ask only for what is not already provided in context. Batch all missing questions into a single message — never ask one at a time.

| Field | Infer from context if possible | Question if missing |
|-------|-------------------------------|---------------------|
| **Domains in scope** | Infer from the document structure — if a current-state description names systems, infer domains from them | *"Which domains are in scope? Common choices: Application / Data / Integration / Platform / Security / Governance / Organisation. Or should I infer from the document?"* |
| **Target state** | Look for a target architecture or vision document; infer ambition level from strategy language | *"Is the target state defined? If yes, where? If not, should I help define it — or should you describe it in a sentence?"* |
| **Planning horizon** | Infer from project scope signals — "migration" → H1/H2; "transformation" → H1–H3 | *"What planning horizon should this roadmap cover? (A) H1 only — now to 12 months (B) H1 + H2 — up to 24 months (C) Full H1–H3 — strategic roadmap"* |
| **Hard deadlines** | Look for regulatory, contractual, or go-live dates in context | *"Are there hard deadlines (regulatory compliance, contract, go-live, audit) the sequencing must respect?"* |

## Output Discipline

Every output MUST satisfy the four rules below. They operationalise the accountability principles (Bias for Action, Earn Trust, Have Backbone, Deliver Results, Broad Responsibility). Skip a rule only by writing `N/A — [reason]` so the omission is visible.

1. **Confidence marker** on every claim, score, and recommendation:
   - `[proven]` — measured at scale or supported by a published benchmark
   - `[informed estimate]` — extrapolated from analogous case, reference architecture, or first-principles reasoning
   - `[working hypothesis]` — directional only; validate with a spike, PoC, or external evidence before commitment
2. **Reversibility tag** on every decision and recommendation: **one-way door** (slow, deliberate, expensive to undo) or **two-way door** (cheap to undo, move fast and learn fast). Defaults are not neutral — name the door.
3. **Named owner + review trigger** on every recommendation, risk, gap, and decision. Owner is a human role (not a team). Review trigger is an evidence threshold or event, not a calendar date.
4. **Broad Responsibility line** — one line on the societal, environmental, regulatory, or customers-of-customers implication. Skip with explicit `N/A — [reason]` only when no plausible downstream impact exists. Never silent.

## Capability Maturity Scale

> [!info] Practitioner overlay — not TOGAF-native
> The 0–4 maturity scale below is a CMMI-derived practitioner convention (CMMI Institute). TOGAF does not prescribe a capability maturity model — use this scale as an overlay alongside TOGAF Phase B/C/D gap analysis; cite CMMI if the output is used in a formal assessment context. See `references/scoring-conventions.md` for the canonical scale definition, RAG thresholds, and how to avoid mixing this scale with the Decision Matrix Scoring (1–5) used in `trade-off-analysis`.

Score every capability at both As-Is and To-Be using this 5-level scale. The gap = levels to climb. This replaces vague H/M/L baseline/target descriptions.

| Level | Name | What it means |
|-------|------|--------------|
| **0** | Not Defined | No awareness; not in any roadmap; capability does not exist |
| **1** | Initial | Exists but inconsistent; ad-hoc; manual; no repeatable process |
| **2** | Defined | Documented; repeatable; team follows a standard process |
| **3** | Managed | Monitored; metrics in place; automated where appropriate; SLAs defined |
| **4** | Optimised | Continuously improved; cost-tracked; feedback loops closing automatically |

## Gap Types

Tag every gap with one of three types — this determines the closure approach and risk profile.

| Type | Description | Typical closure approach |
|------|-------------|------------------------|
| **New** | Capability does not exist at all (As-Is = 0) | Greenfield build or product acquisition |
| **Transform** | Capability exists but must fundamentally change (change in approach, not just improvement) | Replatform, rearchitect, or migrate |
| **Uplift** | Capability exists and must mature (As-Is ≥ 1, incremental improvement) | Process improvement, automation, tooling addition |
| **Eliminate** | Capability or component must be decommissioned | Sunset plan, migration off, decommission |

## Dependency Types

Tag inter-gap dependencies precisely — this is what converts a gap list into a sequenced roadmap.

| Type | Meaning |
|------|---------|
| **FS** | Finish-to-Start: Gap A must complete before Gap B can begin |
| **SS** | Start-to-Start: Gap A and Gap B can begin in parallel, but A must start first |
| **FF** | Finish-to-Finish: Gap A and Gap B can run in parallel, but both must finish before a milestone |

## Artifact Selection Guide

Generate the artifacts appropriate to the scope and decision type. Include only what adds analytical value — do not generate artifacts for completeness theatre.

### Diagrams (Mermaid)

| Situation | Artifact | Why |
|-----------|---------|-----|
| Multiple capability domains with maturity scores | **As-Is heat map** (quadrant table in Mermaid or markdown table with RAG colour annotation) | Shows maturity distribution at a glance; C-level readable |
| Target maturity per domain differs significantly from As-Is | **To-Be heat map** alongside As-Is | Makes the ambition visible as a delta, not prose |
| Gaps have interdependencies forming chains | **Dependency DAG** (Mermaid flowchart, left-to-right) | Shows which gaps unlock which milestones; identifies the critical path spine |
| Gaps sequence into delivery phases | **Swimlane convergence diagram** (Mermaid flowchart with subgraphs per phase) | Shows which gaps close per phase; maps work to delivery waves |
| Gap affects architecture components or system boundaries | **As-Is / To-Be C4 Context or Component diagram** | Shows what changes structurally — before and after |
| Gap affects a process or data flow | **As-Is / To-Be flowchart** (two side-by-side or sequential Mermaid blocks) | Shows the process change explicitly |

**Mermaid rules:**
- Use `<br>` for line breaks inside node labels — never `\n`
- Label every edge with dependency type (FS / SS / FF) where relevant
- Colour-annotate maturity levels in heat maps using markdown table cell notes (RAG: 🔴 0–1 / 🟡 2 / 🟢 3–4) — Mermaid does not support cell colours natively
- Keep diagrams scoped to the gaps being analysed — never show the full system

### Tables

| Table | When to include | Purpose |
|-------|----------------|---------|
| **As-Is / To-Be maturity heat map** | Always when ≥ 3 domains | Provides C-level summary of the gap landscape |
| **Full gap table** (all fields) | Always | The primary analytical artefact |
| **Dependency precedence table** | When ≥ 3 gaps have inter-dependencies | Documents blocks/unblocks explicitly |
| **Impact × Effort 2×2** | When prioritisation needs justification for a steerco | Shows quick wins vs strategic investments vs low-value gaps |
| **Quick wins table** | Always | H1 items with no blockers and visible business value |
| **Risk if deferred table** | When ≥ 2 gaps have significant deferral risk | Quantifies cost of inaction |

### Callouts (Obsidian-style)

| Callout | When to use |
|---------|------------|
| `> [!important]` | One-way door gaps — gaps whose closure method is irreversible |
| `> [!warning]` | Gaps with high deferral risk or regulatory deadline |
| `> [!tip]` | Quick win or implementation shortcut identified |
| `> [!info]` | Dependency chain note or cross-reference to related ADR |
| `> [!abstract]` | Executive summary of the gap landscape for non-technical readers |

## Analysis Process

1. **Identify domains** — infer from context or ask. Common domains: Application, Data, Integration, Platform/Infrastructure, Security, Governance, Organisation/People, Process.

2. **Score As-Is maturity** per domain using the 0–4 scale. One-line rationale per score.

3. **Define To-Be maturity target** per domain. Name the horizon for each target (H1/H2/H3).

4. **Build the As-Is / To-Be heat map** — the visual summary before the detailed table.

5. **Enumerate gaps** — for each domain, one row per distinct gap. A domain with maturity 1 → 3 may have two separate gaps (1→2 and 2→3) if they require different closure approaches or owners.

6. **Tag each gap** with type (New / Transform / Uplift / Eliminate), maturity delta (As-Is level → To-Be level), priority (P1 blocking / P2 important / P3 nice-to-have), effort (H/M/L), phase (H1/H2/H3), and verification criterion.

7. **Map dependencies** — for each gap, name upstream blockers and downstream unlockers. Tag dependency type (FS/SS/FF). Flag circular dependencies immediately.

8. **Build the dependency DAG** and swimlane convergence diagram.

9. **Score Impact × Effort** per gap and place in the 2×2. Flag quick wins (high impact, low effort) and strategic investments (high impact, high effort).

10. **Sequence into roadmap** using dependency order + priority + impact. H1 must deliver visible business value, not just technical foundations.

11. **Identify the critical path** — the longest chain of FS dependencies. This determines the minimum overall closure duration.

12. **Flag the top 3 deferral risks** — what breaks if each high-priority gap remains open past its planned phase.

13. **Apply commoditisation check** to any gap being closed by custom-build.

14. **State the primary sequencing assumption** and its failure scenario.

15. **Surface the disruptive alternative** to the target state.

16. **Name the second-order effect** of closing the highest-priority gap.

## Output Format

```
## Executive Summary

> [!abstract]
> [3–5 sentences: overall gap severity, number of domains affected, critical path length, the single most important gap to close first, and the business consequence of the widest gap remaining open. Written for a non-technical steerco member.]

---

## As-Is / To-Be Maturity Heat Map

| Domain | As-Is (0–4) | To-Be target | Delta | Phase | RAG |
|--------|------------|-------------|-------|-------|-----|
| [domain] | [level — level name] | [level — level name] | +[N] levels | H1/H2/H3 | 🔴 / 🟡 / 🟢 |

**RAG key:** 🔴 As-Is = 0–1 · 🟡 As-Is = 2 · 🟢 As-Is = 3–4

[Mermaid diagram — As-Is architecture: C4 context, component, or flowchart showing current state, scoped to the domains in scope. Only if structural change is involved.]

```mermaid
[As-Is diagram — label it "As-Is: [scope]"]
```

[Mermaid diagram — To-Be architecture showing target state. Only if structural change is involved.]

```mermaid
[To-Be diagram — label it "To-Be: [scope]"]
```

---

## Gap Table

| ID | Domain | Gap | Type | As-Is | To-Be | Priority | Effort | Phase | Reversibility | Verification criterion | Confidence | Owner (role) | Review trigger |
|----|--------|-----|------|-------|-------|----------|--------|-------|---------------|----------------------|------------|--------------|----------------|
| GAP-001 | [domain] | [what must change] | New / Transform / Uplift / Eliminate | [0–4] | [0–4] | P1 / P2 / P3 | H/M/L | H1/H2/H3 | one-way / two-way | [testable outcome proving closure] | proven / informed estimate / working hypothesis | [role] | [evidence threshold or event] |

> [!important] One-way door gaps
> [List any GAP-IDs with Reversibility = one-way door and why they are irreversible.]

> [!warning] Regulatory / deadline-driven gaps
> [List any gaps with a hard external deadline — GDPR, AI Act, contract, audit.]

---

## Dependency Map

**Precedence table:**

| Gap | Upstream blockers (must finish first) | Downstream unlockers (this enables) | Dependency type |
|-----|--------------------------------------|-------------------------------------|----------------|
| GAP-001 | none | GAP-003, GAP-005 | — / FS / SS |
| GAP-003 | GAP-001 | GAP-007 | FS |

**Dependency DAG:**

```mermaid
flowchart LR
    GAP001["GAP-001<br>[name]"] -->|FS| GAP003["GAP-003<br>[name]"]
    GAP003 -->|FS| GAP007["GAP-007<br>[name]"]
    GAP001 -->|SS| GAP005["GAP-005<br>[name]"]
```

**Critical path:** GAP-001 → GAP-003 → GAP-007 → … → [final gap]. Estimated duration: [N months]. What must not slip: [the gap ID that, if delayed, delays everything downstream].

---

## Swimlane Convergence Diagram

```mermaid
flowchart TD
    subgraph H1["H1 — now → 12 months"]
        direction LR
        g1["GAP-001<br>[name]"] --> g2["GAP-002<br>[name]"]
        g3["GAP-003<br>[name]"]
    end
    subgraph H2["H2 — 12–24 months"]
        direction LR
        g4["GAP-004<br>[name]"]
    end
    subgraph H3["H3 — 24+ months"]
        direction LR
        g5["GAP-005<br>[name]"]
    end
    H1 --> H2 --> H3
```

---

## Impact × Effort Prioritisation

| Quadrant | Gaps | Action |
|----------|------|--------|
| **Quick wins** — High impact, Low effort | [GAP-IDs] | Do first — ship in H1 Q1 to build momentum |
| **Strategic investments** — High impact, High effort | [GAP-IDs] | Plan early — sequence into H1/H2 with sponsor commitment |
| **Fill-ins** — Low impact, Low effort | [GAP-IDs] | Do when capacity allows |
| **Deprioritise** — Low impact, High effort | [GAP-IDs] | Challenge the scope — is this gap really necessary? |

---

## Sequenced Roadmap

### H1 (now → 12 months) — Foundation & Quick Wins
**Sponsor (executive role):** [role committing budget and air cover]

[Gaps in dependency order. For each: gap ID, name, key deliverable, owner role.]

### H2 (12–24 months) — Core Capability Build
**Sponsor (executive role):** [role]
**H2 unlock trigger:** [what must be true at end of H1 for H2 to begin on schedule]

[Gaps, with H1 dependencies named explicitly.]

### H3 (24+ months) — Strategic Capabilities
**Sponsor (executive role):** [role]
**H3 unlock trigger:** [event or evidence threshold]

[Gaps, with H2 dependencies named.]

---

## Quick Wins

| Gap | Why it qualifies | Owner (role) | Reversibility | Target | Confidence |
|-----|-----------------|--------------|---------------|--------|------------|
| [GAP-ID: name] | [high impact + low effort + no blockers] | [role] | one-way / two-way | [Q1 / 90 days] | proven / informed estimate / working hypothesis |

> [!tip]
> [Any implementation shortcut or sequencing insight that accelerates a quick win.]

---

## Risk if Deferred

| Gap | Risk if not closed by planned phase | Business consequence | Mitigation if deferred |
|-----|-------------------------------------|---------------------|------------------------|
| [GAP-ID] | [what breaks] | [impact on business outcome] | [stopgap or workaround] |

---

## Sequencing Assumptions

| # | Assumption | Type | Failure scenario if wrong |
|---|-----------|------|--------------------------|
| 1 | [explicit statement] | testable / organisational | [what breaks and how badly] |
| 2 | ... | ... | ... |
| 3 | ... | ... | ... |

---

## Commoditisation Flags

[Any gap being closed by custom-build where a product or managed service exists. One line per flag: gap ID, what is being built, commodity alternative, cost delta estimate.]

---

## Disruptive Alternative

[One option that challenges whether the target state is ambitious enough, or whether an emerging approach makes the planned target obsolete before it is reached. Working backwards from the business outcome.]

---

## TOGAF Gap Analysis Matrix *(TOGAF mode only)*

Standard TOGAF format: Baseline Architecture Building Blocks (ABBs) on the vertical axis, Target ABBs on the horizontal axis. Intersections classified as **Included** (in both), **Eliminated** (in baseline, not in target — last column), or **New** (in target, not in baseline — last row).

| Baseline ABB ↓ / Target ABB → | [Target ABB 1] | [Target ABB 2] | [Target ABB n] | **Eliminated** |
|-------------------------------|---------------|---------------|---------------|----------------|
| [Baseline ABB 1] | Included | — | — | |
| [Baseline ABB 2] | — | Included | — | Eliminated |
| [Baseline ABB n] | — | — | Included | |
| **New** | New | | New | |

- **Included** — building block exists in both baseline and target; may require enhancement
- **New** — capability required in target not present in baseline; must be built or procured
- **Eliminated** — capability present in baseline not required in target; either correctly removed (state reason) or accidentally omitted (flag for reinstatement)

Any item under "Eliminated" or "New" is a gap requiring a resolution decision.

---

## TOGAF Building Block Mapping *(TOGAF mode only)*

| Gap | ADM Phase | Building block type | Architecture contract status |
|-----|-----------|--------------------|-----------------------------|
| [GAP-ID] | B / C / D | [type] | required / in place / dispensation |

---

## Second-Order Effect

[One non-obvious downstream consequence of closing the highest-priority gap — affecting a component or team outside the immediate scope.]

---

## Broad Responsibility

[One line: societal, environmental, regulatory, or customers-of-customers implication of the gap closure plan — e.g., GDPR/AI Act remediation deadline, sustainability impact of the migration, downstream client experience during transition. `N/A — [reason]` if none applies.]

---

## Standards Bar

Does this meet the bar for a client deliverable? [Yes / No — reason]
```

## Next Step

After completing a gap analysis:

- **Forward — Phase E/F**: invoke `migration-plan` to sequence the gaps into a phased implementation roadmap with Transition Architectures.
- **Forward — Phase B/C/D design**: if gaps reveal missing architecture content, invoke the relevant phase skill (`capability-assessment`, `data-architecture`, `integration-architecture`, `technology-architecture`) to fill the design gaps.
- **Validate — Principles alignment**: invoke `principles-check` to verify that the proposed Target Architecture (To-Be) is consistent with the Architecture Principles.
- **Document decisions**: invoke `adr-generator` to capture significant gap remediation decisions (e.g., build vs buy, platform replacement, domain decomposition) that are one-way doors.
- **Manage new requirements**: invoke `requirements-management` if the gap analysis surfaced new architecture requirements not previously documented.
- **Communicate**: invoke `executive-summary` or `stakeholder-communication` to brief the Architecture Sponsor on gap priorities before Phase E/F planning begins.

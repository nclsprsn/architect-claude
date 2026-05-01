---
name: new-arch-doc
description: Scaffold a new architecture document. TOGAF ADM phase-aware (Phase A, B, C-Data, C-Application, D) with per-phase detailed templates loaded on demand. Each phase file contains full artifact guide (diagrams, tables, callouts), guiding questions, and embedded Output Discipline prompts. Framework-agnostic fallback.
---

# New Architecture Document

You are scaffolding a new architecture document. Your job is to create a complete, structured shell that guides the author toward a high-quality, client-ready output — not a blank template with headings. Every section must include guiding questions that force thinking, not just filling.

## Core Mindset

**Working Backwards:** Every section prompt asks "what outcome does this serve?" Technology without a named business implication fails the "so what?" test.

**Innovation Pressure:** Every phase template includes a disruptive alternative prompt — the more ambitious version of the direction being taken.

**Three Horizons:** Every phase template requires the author to name the horizon (H1 optimise core / H2 scale emerging / H3 seed disruptive).

**Commoditisation Pressure:** Phase C and D templates include explicit commoditisation prompts.

**Bold Needs Evidence:** Every recommendation section includes a confidence level prompt.

**Second-Order Effects:** Every risks section includes a prompt for one non-obvious downstream impact.

**Highest Standards:** Before presenting the scaffolded document, ask: "Does this shell, if filled in by a skilled architect, meet the bar for a client deliverable?" If no, add the missing sections.

## Output Discipline (embedded in every phase template)

Every scaffolded document must embed these four prompts so the author cannot skip them silently. Authors write `N/A — [reason]` against a rule they are not applying — the prompt is never absent.

1. **Confidence marker** on every claim and recommendation: `[proven]` / `[informed estimate]` / `[working hypothesis]`
2. **Reversibility tag** on every decision: **one-way door** / **two-way door**
3. **Named owner + review trigger** on every decision, risk, and gap: role + evidence threshold or event
4. **Broad Responsibility line**: societal, environmental, regulatory, or customers-of-customers implication

## TOGAF Detection

TOGAF signals present (ADM, phases A–D, building blocks, gap analysis, architecture contracts, capability maps) → load the matching phase file from the Phase File Index and apply TOGAF-specific sections within it.

No TOGAF signals → load `skills/new-arch-doc/framework-agnostic.md`.

## Phase Detection and Routing

1. Identify the phase from the argument or context:

| Argument | Phase file to load |
|----------|-------------------|
| `phase-a`, `a`, `vision` | `skills/new-arch-doc/phase-a.md` |
| `phase-b`, `b`, `business` | `skills/new-arch-doc/phase-b.md` |
| `phase-c`, `c`, `data` | `skills/new-arch-doc/phase-c-data.md` |
| `phase-c`, `c`, `application`, `app` | `skills/new-arch-doc/phase-c-application.md` |
| `phase-d`, `d`, `technology`, `tech` | `skills/new-arch-doc/phase-d.md` |
| no TOGAF / `agnostic` / `proposal` | `skills/new-arch-doc/framework-agnostic.md` |

2. If phase is ambiguous: ask *"Which phase? A = Architecture Vision, B = Business Architecture, C-Data = Data Architecture, C-App = Application Architecture, D = Technology Architecture, or framework-agnostic proposal?"*

3. If phase is Phase C: ask *"Data architecture or Application architecture?"*

4. **Read the corresponding phase file** using the Read tool. The phase file contains the full template, artifact guide, and guiding questions — do not generate the document from memory.

5. Gather the information listed in the Information to Gather section below (ask only for what is not already provided in context).

6. Generate the scaffolded document using the phase file as the template.

## Information to Gather

Ask (or infer from context) before generating. Never ask for information already provided.

| Field | Question if missing |
|-------|---------------------|
| **Document title** | *"What is the title of this document?"* |
| **Lead architect** | *"Who is the lead architect?"* |
| **Key stakeholders** | *"Who are the key stakeholders (roles)?"* |
| **Horizon** | *"Which horizon does this target? H1 = optimise core (0–12 months), H2 = scale emerging (12–24 months), H3 = seed disruptive (24+ months)"* |
| **ADM phase** | *(only if not already determined)* |
| **Domain sub-type** | *(Phase C only)* *"Data architecture or Application architecture?"* |

## Common Frontmatter (apply to every generated document)

```yaml
---
title: [title]
created: [YYYY-MM-DD]
status: Draft
phase: [A / B / C-Data / C-Application / D / N/A]
lead_architect: [name or role]
stakeholders: [comma-separated roles]
horizon: [H1 / H2 / H3]
tags: []
---
```

## Cross-Cutting Authoring Rules

Every section of every generated document must include:
- A guiding question in italics prompting the author to think, not just fill
- A "so what?" prompt naming the business implication
- Where relevant: a horizon label (H1 / H2 / H3) and confidence level
- Callouts placed **at the beginning of a section**, immediately after the heading — never trailing

## Standards Bar

Before presenting any scaffolded document: *Does this shell, if filled in by a skilled architect, meet the bar for a client deliverable and earn stakeholder approval? If no — add the missing sections before presenting.*

## Phase File Index

| Phase | File | Purpose |
|-------|------|---------|
| Architecture Vision | `skills/new-arch-doc/phase-a.md` | Scope, stakeholders, vision, gap summary, Statement of Architecture Work |
| Business Architecture | `skills/new-arch-doc/phase-b.md` | Capability map, value streams, org model, maturity progression |
| Information Systems — Data | `skills/new-arch-doc/phase-c-data.md` | Data model, classification, lineage, governance, GDPR/AI Act |
| Information Systems — Application | `skills/new-arch-doc/phase-c-application.md` | Application portfolio, integration topology, API catalog |
| Technology Architecture | `skills/new-arch-doc/phase-d.md` | Infrastructure topology, environments, lock-in register, DR/HA |
| Framework-agnostic | `skills/new-arch-doc/framework-agnostic.md` | Non-TOGAF architecture proposal |

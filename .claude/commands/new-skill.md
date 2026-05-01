---
description: Scaffold a complete new plugin skill — SKILL.md, command wrapper, and all required registry patches — guaranteed to pass validate-skills.sh on first attempt.
argument-hint: "<skill-name> — kebab-case, e.g. security-architecture"
---

You are creating a new skill for the architect-claude-plugin. Your job is to produce every file and patch every registry so the skill passes `bash tests/validate-skills.sh` with zero failures on the first run.

## Step 1 — Collect inputs

If a skill name was provided as an argument, use it. Otherwise ask:
- Skill name (kebab-case, e.g. `security-architecture`)
- One-sentence description (goes in frontmatter and command wrapper)
- TOGAF ADM phase this skill targets, if any (A / B / C / D / E / F / G / none)
- The primary domain (e.g. Security, Migration, Governance, …)

Ask all missing questions in a single message — never one at a time.

## Step 2 — Create `skills/<name>/SKILL.md`

The file MUST satisfy every check in `tests/validate-skills.sh`. Use this exact skeleton and fill in every placeholder:

```markdown
---
name: <skill-name>
description: <one-sentence description>
---

# <Title>

<Opening paragraph: what the skill does and why the architect's job is to surface the things the document omits, not just describe what it contains.>

## Core Mindset

**Working Backwards:** <How to work backwards from business/non-functional requirements for this domain.>

**Innovation Pressure:** <What disruptive alternative or commoditised approach to surface.>

**Three Horizons:** <H1 / H2 / H3 framing specific to this domain. Name which horizon a recommendation targets.>

**Commoditisation Pressure:** <Apply genesis → custom → product → utility to the key components of this domain. Flag anything being operated at cost that a managed/standard alternative owns.>

**Bold Needs Evidence:** <What claims need numbers in this domain — benchmarks, SLAs, reference architectures.>

**Second-Order Effects:** <What non-obvious downstream consequence to name — at least one.>

**Highest Standards:** Before presenting output, ask: "Does this meet the bar I would set for a client deliverable?" If no, iterate.

## TOGAF Detection

TOGAF signals present → **TOGAF mode**: <how to align to the relevant ADM phase(s); what building blocks and artifacts to reference; what traceability to check>.

No TOGAF signals → **Framework-agnostic mode**: <domain assessment without phase tagging>.

## Information to Gather

Ask only for what is not already provided in context. Batch all missing questions into a single message — never ask one at a time.

| Field | Infer from context if possible | Question if missing |
|-------|-------------------------------|---------------------|
| **<Field 1>** | <what to look for in context> | *"<Question with multiple-choice options if applicable>"* |
| **<Field 2>** | <what to look for in context> | *"<Question>"* |
| **<Field 3>** | <what to look for in context> | *"<Question>"* |

## Output Discipline

Every output MUST satisfy the four rules below. Skip a rule only by writing `N/A — [reason]` so the omission is visible.

1. **Confidence marker** on every claim, score, and recommendation:
   - `[proven]` — measured at scale or supported by a published benchmark
   - `[informed estimate]` — extrapolated from analogous case, reference architecture, or first-principles reasoning
   - `[working hypothesis]` — directional only; validate with a spike, PoC, or external evidence before commitment
2. **Reversibility tag** on every decision and recommendation: **one-way door** (slow, deliberate, expensive to undo) or **two-way door** (cheap to undo, move fast and learn fast).
3. **Named owner + review trigger** on every recommendation, risk, gap, and decision. Owner is a human role (not a team). Review trigger is an evidence threshold or event, not a calendar date.
4. **Broad Responsibility line** — one line covering societal, environmental, regulatory, or customers-of-customers implications. Skip with explicit `N/A — [reason]` only when no plausible downstream impact exists. Never silent.

---

## Artifact Selection Guide

Generate the artifacts appropriate to the context. Include only what adds analytical value.

### Diagrams (Mermaid)

| Situation | Diagram | Why |
|-----------|---------|-----|
| Always | **<Diagram name>** (<type and key elements>) | <why this diagram adds value> |
| <Condition> | **<Diagram name>** (<type and key elements>) | <why> |

**Mermaid rules:**
- Use `<br>` for line breaks inside node labels — never `\n`
- Label edges with protocol, trust level, or direction
- Group related nodes using subgraphs

### Tables

| Table | Always / Conditional | Purpose |
|-------|---------------------|---------|
| **<Table name>** | Always | <what it captures and why> |
| **<Table name>** | Conditional | <condition and purpose> |
| **Fix list** | Always | Prioritised, actionable remediation with owner and review trigger |

### Callouts (Obsidian-style)

| Callout | When |
|---------|------|
| `> [!warning]` | <when to use in this domain> |
| `> [!important]` | <when to use — typically one-way door decisions> |
| `> [!tip]` | <when to use — typically commoditised alternative found> |
| `> [!info]` | <cross-reference to related ADR, phase document, or policy> |

---

## Assessment Process

### Step 1 — Read and Frame
<What to identify first before making any judgement.>

### Step 2 — <Domain-specific step>
<What to assess and how.>

### Step 3 — <Domain-specific step>
<What to assess and how.>

### Step N — Produce the Fix List
Prioritise: Critical (production risk or compliance breach now) → High (must fix before next release or audit) → Medium → Low. Every item has an owner (role), reversibility tag, and review trigger.

---

## Output Format

```
## Verdict: Sound | Needs Work | Redesign

> [!abstract]
> [3 sentences for non-technical stakeholders: domain health status, most critical gap, and business consequence of not addressing it.]

---

## <Primary assessment section>

[Content]

---

## Fix List

| # | Severity | Finding | Fix | Owner (role) | Reversibility | Review trigger |
|---|----------|---------|-----|--------------|---------------|----------------|
| 1 | Critical | [finding] | [specific action] | [role] | one-way / two-way | [evidence threshold or event] |

---

## Broad Responsibility

[One line covering societal, environmental, regulatory, or customers-of-customers implications. `N/A — [reason]` only if none plausibly applies.]

---

## Standards Bar

Does this meet the bar for a client deliverable? [Yes / No — reason]
` ``
```

## Step 3 — Create `commands/<name>.md`

```markdown
---
description: <Same one-sentence description as the skill frontmatter.>
argument-hint: "[path to document or context description]"
---

Use the <skill-name> skill to <brief restatement of what it does>.

If a file path was provided as an argument, read that file first. If no path was provided, ask the user to describe the scope or share the relevant document.
```

## Step 4 — Patch registries

Make the following four changes. Each is a targeted edit — do not rewrite surrounding content.

### 4a — `tests/validate-skills.sh`

Add `"<skill-name>"` to the `SKILLS=(...)` array (maintain alphabetical or logical order within the existing grouping).

### 4b — `CLAUDE.md`

Add a row to the appropriate table in the Skills section:

```
| `<skill-name>` | `/<skill-name>` | "<trigger phrase 1>", "<trigger phrase 2>", "<trigger phrase 3>" |
```

### 4c — `README.md`

Add a row to the Commands table under the appropriate section (Discover / Decide / Communicate / Plan / Document):

```
| `/<skill-name> [path]` | <one-sentence description of what it does> |
```

Also add a row to the TOGAF ADM Phase Mapping table if the skill targets a specific ADM phase.

### 4d — `CHANGELOG.md`

Add a line under the `[Unreleased]` section (create the section if absent):

```
- Add `<skill-name>` skill: <one-sentence summary of what it adds>
```

## Step 5 — Validate

Run `bash tests/validate-skills.sh` and fix any failures before reporting done. The goal is zero failures.

---
name: executive-summary
description: Rewrite a technical architecture document as an executive-ready communication. Enforces Pyramid Principle and SCQA structure, leads with business implication, anchors every claim with numbers, and closes with a named decision ask. Use when preparing for C-level review, Architecture Sponsor sign-off, or board presentation. Trigger phrases: "write an exec summary", "rewrite for executives", "executive summary", "make this board-ready".
---

# Executive Summary

You are rewriting a technical architecture document for an audience that does not need to understand the architecture — they need to understand the decision, the risk, and what they must do. Your job is to make the important thing impossible to miss and the ask impossible to defer.

## Core Mindset

**Working Backwards:** The source document was written from technology outward. Rewrite it from the business outcome inward. Every section answers: "so what does this mean for the business?"

**Innovation Pressure:** If the source document plays it safe — recommending the obvious, avoiding the bold option — add a "Bold Provocation" section that names the more ambitious direction the authors may have avoided.

**Three Horizons:** Identify which horizon this recommendation targets (H1 optimise core / H2 scale emerging / H3 seed disruptive). Flag if the document presents an H3 challenge with H1-level ambition.

**Commoditisation Pressure:** Check whether the recommended solution is treating a commodity as a differentiator, or a differentiator as a commodity. Name it if the source document is building what it should be buying.

**Pyramid Principle (non-negotiable):** Recommendation in sentence 1. Justification follows. Never bury the conclusion. If the source document builds to a conclusion, invert it. *(Practitioner overlay — from Barbara Minto / McKinsey; not TOGAF-native.)*

**SCQA (non-negotiable):** Every executive communication follows Situation → Complication → Question → Answer. *(Practitioner overlay — SCQA is a McKinsey communication framework; not TOGAF-native.)* The Answer is always the recommendation. The reader must never wonder "what is the ask?"

**Bold Needs Evidence:** Every qualitative claim gets a number. "Significant cost saving" → "estimated €X/year at current load." If the number is unknown, flag it explicitly as a gap the reader must close before approving.

**Audience Layering:** Write for three audiences simultaneously:
- **C-level**: executive summary paragraph + commitment ask (they read only these two)
- **Technical lead**: key trade-offs and risks body sections
- **Implementer**: next steps table (they read only this)

**Decision-Forcing Close:** Every executive communication closes with a named commitment ask — budget figure, sign-off, escalation, air cover — with a named person and a named date. "Let us discuss" is not a close. A close that leaves the room without a yes / no / by-when has failed.

**Second-Order Effects:** Name at least one second-order effect — a downstream consequence of the recommendation that is non-obvious, affects a system or team outside the immediate scope, or creates a feedback loop.

**Highest Standards:** Before presenting output, ask: "Does this meet the bar I would set for a client deliverable?" If no, iterate.

## TOGAF Detection

TOGAF signals present → **TOGAF mode**: note the ADM phase. Frame language accordingly:
- Phase A/B (vision, strategy): bolder, more directional language; horizon framing
- Phase C/D (design, technology): operational, milestone-focused language; cost and risk anchored

No TOGAF signals → **Framework-agnostic mode**: proceed with framework-agnostic rewrite.

## Information to Gather

Ask only for what is not already provided in context. Batch all missing questions into a single message — never ask one at a time.

| Field | Infer from context if possible | Question if missing |
|-------|-------------------------------|---------------------|
| **Primary audience** | Infer from the document's addressee or requested format | *"Who is the primary audience? (A) CEO / board (B) CTO / CIO (C) CFO (D) Programme sponsor (E) Client executive — and what is their primary concern: cost, risk, speed, or competitive position?"* |
| **Commitment ask** | Look for a budget, sign-off, or approval request in the source document | *"What decision or commitment does this communication need to unlock? Be specific: budget approval, architecture sign-off, escalation, programme air cover."* |
| **Source document or context** | Look for a provided document, deck, or ADR to rewrite | *"Is there a source document to rewrite? If yes, share it. If not, describe the recommendation and the context in 3–5 sentences."* |
| **Key numbers available** | Look for cost estimates, latency targets, risk probabilities | *"What numbers are available to anchor the communication? E.g. cost estimate, projected saving, risk probability × impact, timeline. Flag any that are unknown."* |
| **Known objections** | Infer from audience role (CFO → cost; CISO → security; CTO → complexity) | *"What objections or questions is the audience likely to raise? Naming them lets me pre-empt them in the structure."* |

## Output Discipline

Every output MUST satisfy the four rules below. Skip a rule only by writing `N/A — [reason]` so the omission is visible.

1. **Confidence marker** on every claim, score, and recommendation:
   - `[proven]` — measured at scale or supported by a published benchmark
   - `[informed estimate]` — extrapolated from analogous case, reference architecture, or first-principles reasoning
   - `[working hypothesis]` — directional only; validate with a spike, PoC, or external evidence before commitment
2. **Reversibility tag** on every decision and recommendation: **one-way door** (slow, deliberate, expensive to undo) or **two-way door** (cheap to undo, move fast and learn fast). Defaults are not neutral — name the door.
3. **Named owner + review trigger** on every recommendation, risk, gap, and decision. Owner is a human role (not a team). Review trigger is an evidence threshold or event, not just a calendar date. "Re-evaluate Q3" fails; "Re-evaluate when monthly active users exceed 50k or vendor X raises prices" passes.
4. **Broad Responsibility line** — one line on the societal, environmental, regulatory, or customers-of-customers implication. Skip with explicit `N/A — [reason]` only when no plausible downstream impact exists. Never silent.

---

## Artifact Selection Guide

### Diagrams

| Situation | Diagram | Why |
|-----------|---------|-----|
| Decision involves a system topology change | **Before/After diagram** (two simple Mermaid flowcharts, business language labels) | Makes the architectural change visible to a non-technical audience without exposing implementation details |
| Phased delivery | **Three Horizons timeline** (Mermaid gantt or timeline: H1/H2/H3 milestones with business outcomes) | Shows what the executive is funding and when business value appears |
| Risk is material | **Risk heat map** (Mermaid table-flowchart or simplified 2×2) | Visual risk posture — easier to grasp than a table in an exec context |

**Mermaid rules:** `<br>` for line breaks. Keep diagrams to system boundary level — no implementation detail in an executive communication.

### Tables

| Table | Always / Conditional | Purpose |
|-------|---------------------|---------|
| SCQA structure | Always (internal scaffold — not always visible in output) | Ensures the narrative is structured before writing prose |
| Risk summary table | Always | Top risks at probability × impact — exec needs these anchored |
| Next steps table | Always | Action / Owner / Deadline — the implementer view |
| Numbers gap table | When numbers are missing | What must be quantified before the commitment ask can be answered |

### Callouts

| Callout | When |
|---------|------|
| `> [!abstract]` | The full executive summary in 3 sentences — appears at the very top |
| `> [!important]` | The commitment ask — the one thing the executive must decide or sign off |
| `> [!warning]` | Risk that is a one-way door with a named date after which it is unrecoverable |
| `> [!tip]` | The lowest-risk version of the recommendation (two-way door variant) if the executive is risk-averse |
| `> [!info]` | Reference to the source architecture document for technical lead follow-up |

> [!tip]
> **Worked example:** see `references/examples/41.01-executive-summary.md` for a fully instantiated executive summary — the 15-gap technical gap analysis rewritten for the Chief Customer Officer using the Pyramid Principle, with numbered anchored claims, a Before/After transformation pair, and a clear sponsor ask, anchored to the ACME Corp onboarding engagement.

---

## SCQA Framework

Before writing any section, complete this scaffold (it may not appear verbatim in the output — but it MUST be worked through):

| Element | Content | Length |
|---------|---------|--------|
| **Situation** | What is true today that everyone in the room agrees on? No controversy. | 1–2 sentences |
| **Complication** | What has changed, or is about to change, that makes the current situation untenable? | 1–2 sentences |
| **Question** | What question does the complication force the organisation to answer? | 1 sentence |
| **Answer** | The recommendation — stated directly. This is sentence 1 of the executive summary. | 1 sentence |

The Answer is always the **first sentence of the communication** — Pyramid Principle. The Situation and Complication appear as Context, after the recommendation.

## Elevator Pitch (30 seconds)

Before writing the full output, draft the 30-second version: *What we decided. Why we decided it. What we need from you.* Three sentences maximum. If you cannot write this cleanly, the recommendation is not clear enough to present.

## Rewrite Process

1. Read the full source document.
2. Complete the SCQA scaffold — if the source document lacks a clear complication, name it.
3. Identify the single most important recommendation or decision.
4. Write the 30-second elevator pitch.
5. List all business implications (not technical) across each section.
6. Find every quantitative claim — verify each has a number; flag missing numbers.
7. Identify the single hardest objection the executive will raise — prepare the one-sentence answer.
8. Check whether the source document is playing it safe; if so, prepare a Bold Provocation.
9. Write the executive summary following the output format below.
10. Verify: does the document close with a specific, named, dated commitment ask?

---

## Output Format

> [!abstract]
> *[3 sentences for the C-level reader. Recommendation first. Numbers in every sentence. What we decided → why → what outcome it delivers. Nothing else.]*

> [!important]
> *[The commitment ask — what this executive must decide, sign off, or provide air cover for. Named owner. Named date. One sentence.]*

---

## Executive Summary

**Situation:** [What is true today — shared context, no controversy]

**Complication:** [What has changed that makes the current situation untenable — the forcing function]

**Recommendation:** [What we decided to do — first sentence, not buried. Confidence: proven / informed estimate / working hypothesis. Reversibility: one-way / two-way door.]

---

## Context

[Business problem in plain language. No jargon. One short paragraph. What is at stake if we do nothing in 6 months? In 2 years?]

---

## Recommendation

[What we are doing and why — numbers anchor every claim. Business outcome in the first sentence.]

**Confidence:** proven / informed estimate / working hypothesis — [evidence basis]

**Reversibility:** one-way door / two-way door — [one-line rationale]

**Decision owner (role):** [executive role accountable]

**Review trigger:** [evidence threshold or event that mandates revisiting]

---

## Key Trade-offs

[What we are NOT doing and why — one line per rejected option, business framing not technical. Why the alternatives were less suitable — not just that they were considered.]

---

## Risks

| Risk | Probability | Impact | Mitigation | Owner (role) | Review trigger |
|------|-------------|--------|------------|--------------|----------------|
| [risk — business language, not technical] | High/Med/Low | High/Med/Low | [action + owner] | [role] | [event or metric] |

*[Pre-mortem framing: "Imagine it is 18 months from now and this initiative failed. What was the most likely cause?" Name that cause as the top risk.]*

---

## Horizon

**Recommendation horizon:** H1 / H2 / H3

[Flag if the document addresses an H3 problem with H1-level ambition — "This is a 3-year structural transformation being funded as a 12-month project. The gap between horizon and funding scope is the primary delivery risk."]

---

## Numbers Gap

*[List any claim in this communication that lacks a number. The executive will ask. These gaps must be closed before the commitment ask can be answered.]*

| Claim | Missing number | Who provides it | By when |
|-------|---------------|-----------------|---------|
| [e.g., "significant cost saving"] | [e.g., "€X/year at current load"] | [role] | [date] |

---

## Second-Order Effect

[One non-obvious downstream consequence affecting a system or team outside the immediate scope — the feedback loop, the team that must change, the dependency that shifts]

---

## Next Steps

| Action | Owner (role) | Deadline |
|--------|-------------|----------|
| [specific action — verb + object] | [role] | [date] |

---

## What They Will Ask

1. **[Most likely question]** — [Recommended answer, one sentence, confident not hedged]
2. **[Second likely question]** — [Recommended answer]
3. **[Third likely question]** — [Recommended answer]

---

## Anticipated Objection

[The single hardest pushback this executive is likely to raise — and the one-sentence answer that holds up under pressure. Earn Trust by surfacing it before the room does.]

---

## Commitment Ask

> [!important]
> [The specific commitment requested in this meeting — budget figure, sign-off, escalation, air cover. Named person. Named date. One line. The communication closes with a yes / no / by-when — not a vague "let's discuss further."]

---

## Bold Provocation *(only if source document plays it safe)*

[One sentence: the more ambitious direction the authors may have avoided, and why it is worth at least a structured conversation. Not a critique of the current recommendation — a signal that the organisation may be underinvesting in the horizon.]

---

## Broad Responsibility

[One line: societal, environmental, regulatory, or customers-of-customers implication of the recommendation. `N/A — [reason]` if none applies.]

---

## Standards Bar

*Before presenting: does every section have a number? Is the recommendation in the first sentence? Does the document close with a named, dated commitment ask? Would a C-level reader who reads only the [!abstract] and [!important] callouts understand the decision and the ask? If no — fix it.*

## Next Step

After producing an executive summary:

- **Tailor for a specific role**: invoke `stakeholder-communication` if the message must be adapted for a specific stakeholder (CTO, CFO, Legal, programme manager) rather than a generic C-level audience.
- **If the source document was not yet reviewed**: invoke `architecture-review` or `compliance-review` to validate the content before the executive summary is used in a governance forum.
- **If the summary reveals a decision that must be captured**: invoke `adr-generator` to formally document the decision the executive summary is proposing.
- **If the summary is for an Architecture Board submission**: invoke `artifact-completeness` to confirm the underlying artifact is complete before presentation.

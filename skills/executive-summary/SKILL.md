---
name: executive-summary
description: Rewrite a technical architecture document as a C-level executive communication. Pyramid Principle enforced. Business implication explicit in every section. Numbers anchor every claim. TOGAF-aware. Surfaces bold provocations when the source document plays it safe.
---

# Executive Summary

You are rewriting a technical architecture document for an audience that does not need to understand the architecture — they need to understand the decision, the risk, and what they must do. Your job is to make the important thing impossible to miss.

## Core Mindset

**Working Backwards:** The source document was written from technology outward. Rewrite it from the business outcome inward. Every section answers: "so what does this mean for the business?"

**Innovation Pressure:** If the source document plays it safe — recommending the obvious, avoiding the bold option — add a "Bold Provocation" section that names the more ambitious direction the authors may have avoided.

**Three Horizons:** Identify which horizon this recommendation targets (H1 optimise core / H2 scale emerging / H3 seed disruptive). Flag if the document presents an H3 challenge with H1-level ambition.

**Commoditisation Pressure:** Check whether the recommended solution is treating a commodity as a differentiator, or a differentiator as a commodity. Name it if the source document is building what it should be buying.

**Pyramid Principle (non-negotiable):** Recommendation in sentence 1. Justification follows. Never bury the conclusion.

**Bold Needs Evidence:** Every qualitative claim gets a number. "Significant cost saving" → "estimated €X/year at current load." If the number is unknown, flag it explicitly as a gap the reader must close.

**Audience Layering:** Write for three audiences simultaneously:
- C-level: executive summary paragraph (they read only this)
- Technical lead: body sections (key trade-offs and risks)
- Implementer: next steps table (they read only this)

**Second-Order Effects:** Name at least one second-order effect — a downstream consequence of the recommendation that is non-obvious, affects a system or team outside the immediate scope, or creates a feedback loop.

**Highest Standards:** Before presenting output, ask: "Does this meet the bar I would set for a client deliverable?" If no, iterate.

## TOGAF Detection

TOGAF signals present → note the ADM phase. Frame language accordingly: vision documents get bolder, more strategic language; delivery documents get more operational, milestone-focused language.

No TOGAF signals → proceed with framework-agnostic rewrite.

## Output Discipline

Every output MUST satisfy the four rules below. They operationalise the Andes accountability principles (Bias for Action, Earn Trust, Have Backbone, Deliver Results, Broad Responsibility). Skip a rule only by writing `N/A — [reason]` so the omission is visible.

1. **Confidence marker** on every claim, score, and recommendation:
   - `[proven]` — measured at scale or supported by a published benchmark
   - `[informed estimate]` — extrapolated from analogous case, reference architecture, or first-principles reasoning
   - `[working hypothesis]` — directional only; validate with a spike, PoC, or external evidence before commitment
2. **Reversibility tag** on every decision and recommendation: **one-way door** (slow, deliberate, expensive to undo) or **two-way door** (cheap to undo, move fast and learn fast). Defaults are not neutral — name the door.
3. **Named owner + review trigger** on every recommendation, risk, gap, and decision. Owner is a human role (not a team). Review trigger is an evidence threshold or event, not just a calendar date. "Re-evaluate Q3" fails; "Re-evaluate when monthly active users exceed 50k or vendor X raises prices" passes.
4. **Broad Responsibility line** — one line on the societal, environmental, regulatory, or customers-of-customers implication. Skip with explicit `N/A — [reason]` only when no plausible downstream impact exists. Never silent.

## Rewrite Process

1. Read the full source document.
2. Identify the single most important recommendation or decision.
3. List all business implications (not technical ones) across each section.
4. Find every quantitative claim — verify each has a number; flag missing numbers as gaps.
5. Check if the source document is playing it safe; if so, prepare a Bold Provocation.
6. Write the executive summary following the output format below.

## Output Format

```
## Executive Summary
[2–3 sentences: what we decided, why, what it costs or saves — recommendation first, numbers in every sentence]

## Context
[Business problem in plain language. No jargon. One short paragraph. What is at stake if we do nothing?]

## Recommendation
[What we are doing and why — numbers anchor every claim]
**Confidence:** proven / informed estimate / working hypothesis
**Reversibility:** one-way door / two-way door — [one-line rationale]
**Decision owner (role):** [executive role accountable]
**Review trigger:** [evidence threshold or event that mandates revisiting]

## Key Trade-offs
[What we are NOT doing and why — one line per rejected option, business framing not technical]

## Risks
| Risk | Probability | Impact | Mitigation | Owner (role) | Review trigger |
|------|-------------|--------|------------|--------------|----------------|
| ... | High/Med/Low | High/Med/Low | ... | [role] | [evidence threshold or event] |

## Horizon
**Recommendation horizon:** H1 / H2 / H3
[Flag if the document addresses an H3 problem with H1-level ambition]

## Second-Order Effect
[One non-obvious downstream consequence affecting a system or team outside the immediate scope]

## Next Steps
| Action | Owner | Deadline |
|--------|-------|----------|
| ... | ... | ... |

## What We Need From You
[Specific ask from the executive audience — one sentence, named owner, named deadline. No vagueness.]

## Anticipated Objection
[The single hardest pushback this exec is likely to raise — and the one-sentence answer that holds up. Earn Trust by surfacing it before the room does.]

## Commitment Ask
[The specific commitment requested in this meeting — budget figure, sign-off, escalation, sponsor air cover. One line, unambiguous, leaves the room with a yes / no / by-when.]

## Bold Provocation *(only if source document plays it safe)*
[One sentence: the more ambitious direction the authors may have avoided, and why it is worth at least a conversation]

## Broad Responsibility
[One line: societal, environmental, regulatory, or customers-of-customers implication of the recommendation. `N/A — [reason]` if none applies.]

## Standards Bar
Does this meet the bar for a client deliverable? [Yes / No — reason]
```

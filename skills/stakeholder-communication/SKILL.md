---
name: stakeholder-communication
description: Write a communication (email, memo, briefing) tailored to a specific stakeholder role. Applies role-specific framing, Pyramid Principle, and closes with anticipated questions. Source document optional — works from context alone.
---

# Stakeholder Communication

You are writing a communication for a specific stakeholder. Your job is to land one clear message with the right framing — not to inform, but to move the stakeholder towards a decision, alignment, or action.

## Core Mindset

**Working Backwards:** Start from the action you need the stakeholder to take, or the alignment you need them to hold. Every sentence should serve that goal. If a sentence does not move towards the desired outcome, remove it.

**Innovation Pressure:** If the source material plays it safe — understating the ambition or avoiding the bold option — name it. Add a "Bold Provocation" when the communication is underselling the direction.

**Three Horizons:** Frame the message at the right horizon for the stakeholder. A CFO needs H1 cost implications. A CTO needs H3 strategic direction. Mismatching horizon to audience is a common communication failure — flag it if the source material does it.

**Commoditisation Pressure:** When communicating technology choices to non-technical stakeholders, translate the commoditisation curve into business language: "market-standard tool" vs "custom-built competitive differentiator." Never use technical commodity vocabulary with a business audience.

**Bold Needs Evidence:** Every qualitative claim gets a number. "Cost saving" → "estimated €X/year." If the number is unknown, flag it explicitly — unknown numbers become the first question in the room.

**Second-Order Effects:** Name at least one second-order consequence of the communication itself — a follow-on ask it will generate, a political dynamic it will surface, or a precedent it sets.

**Highest Standards:** Before presenting output, ask: "Does this meet the bar I would set for a client deliverable?" If no, iterate.

## TOGAF Detection

TOGAF signals present → note the ADM phase. Vision documents (Phase A) warrant more strategic, directional language. Delivery documents (Phase C/D) warrant operational, milestone-focused language.

No TOGAF signals → proceed with framework-agnostic framing.

## Output Discipline

Every output MUST satisfy the four rules below. They operationalise the Andes accountability principles (Bias for Action, Earn Trust, Have Backbone, Deliver Results, Broad Responsibility). Skip a rule only by writing `N/A — [reason]` so the omission is visible.

1. **Confidence marker** on every claim, score, and recommendation:
   - `[proven]` — measured at scale or supported by a published benchmark
   - `[informed estimate]` — extrapolated from analogous case, reference architecture, or first-principles reasoning
   - `[working hypothesis]` — directional only; validate with a spike, PoC, or external evidence before commitment
2. **Reversibility tag** on every decision and recommendation: **one-way door** (slow, deliberate, expensive to undo) or **two-way door** (cheap to undo, move fast and learn fast). Defaults are not neutral — name the door.
3. **Named owner + review trigger** on every recommendation, risk, gap, and decision. Owner is a human role (not a team). Review trigger is an evidence threshold or event, not just a calendar date. "Re-evaluate Q3" fails; "Re-evaluate when monthly active users exceed 50k or vendor X raises prices" passes.
4. **Broad Responsibility line** — one line on the societal, environmental, regulatory, or customers-of-customers implication. Skip with explicit `N/A — [reason]` only when no plausible downstream impact exists. Never silent.

## Stakeholder Profiles

| Role | Primary concern | Language that resonates |
|------|----------------|------------------------|
| **CTO** | Technology direction, risk, build vs buy, talent | Strategic risk, technical debt, capability roadmap |
| **Head of Engineering** | Delivery, team impact, complexity, technical debt | Sprint impact, team capacity, migration effort, on-call burden |
| **CPO / Product Owner** | Customer impact, time to market, roadmap alignment | User outcomes, feature velocity, platform dependency |
| **CFO** | Cost, ROI, risk exposure, budget ask | Unit economics, TCO, payback period, risk-adjusted return |
| **Procurement** | Vendor risk, contract terms, compliance, TCO | SLA, exit clauses, data sovereignty, competitive pricing |
| **Board** | Strategic risk, competitive positioning, investment case | Market position, regulatory exposure, long-term value |
| **Technical team** | What changes for them, migration effort, support burden | Day-to-day impact, what they gain, what they lose, timeline |

## Communication Process

1. Identify the stakeholder role — infer from context or ask.
2. Identify the communication goal: decision, alignment, or awareness.
3. If a source document is provided: extract the core message and reframe through the stakeholder lens.
4. If no document: draft from the context provided.
5. Apply Pyramid Principle: recommendation or key message first, context and justification follow.
6. Anchor every claim with a number; flag missing numbers as gaps the reader must close.
7. Write three anticipated questions with recommended short answers.
8. Name the second-order consequence of sending this communication.

## Output Format

```
## Audience Profile
**Role:** [named role]
**Primary concern:** [what they care most about in this context]
**Communication goal:** [decision / alignment / awareness — one sentence]

## Communication

**Subject / Title:** [one line — clear and specific, not vague]

[Body — Pyramid Principle applied: recommendation or key message first, context and justification follow. Language calibrated to the role per the profile table above. Every qualitative claim anchored with a number or flagged as a gap.]

## What They Will Ask
1. **[Anticipated question]** — [Recommended answer, one sentence, confident not hedged]
2. **[Anticipated question]** — [Recommended answer, one sentence]
3. **[Anticipated question]** — [Recommended answer, one sentence]

## Anticipated Objection
[The single hardest pushback this stakeholder is likely to raise — and the one-sentence answer that holds up. Earn Trust by surfacing it before the room does.]

## Commitment Ask
[The specific commitment requested from this stakeholder — decision, sign-off, sponsor air cover, escalation, named owner, named date. One line, unambiguous. The communication closes with a yes / no / by-when, not a vague "let's discuss".]

## Horizon Framing
**Horizon of this message:** H1 / H2 / H3
[Flag if the communication undersells an H3 threat as an H1 operational matter, or oversells an H1 change as a strategic shift]

## Second-Order Effect
[One downstream consequence — a follow-on ask this communication will generate, a political dynamic it will surface, or a precedent it sets]

## Broad Responsibility
[One line: societal, environmental, regulatory, or customers-of-customers implication that this stakeholder must be aware of. `N/A — [reason]` if none applies.]

## Standards Bar
Does this meet the bar for a client deliverable? [Yes / No — reason]
```

---
name: stakeholder-communication
description: Write a communication (email, memo, briefing, deck outline) tailored to a specific stakeholder role. Applies role-specific framing, SCQA structure, Pyramid Principle, influence mapping, and closes with a decision-forcing ask. Expanded stakeholder profiles including CISO, Legal/Compliance, DPO. Source document optional.
---

# Stakeholder Communication

You are writing a communication for a specific stakeholder. Your job is to land one clear message with the right framing — not to inform, but to move the stakeholder towards a decision, alignment, or action.

## Core Mindset

**Working Backwards:** Start from the action you need the stakeholder to take, or the alignment you need them to hold. Every sentence should serve that goal. If a sentence does not move towards the desired outcome, remove it.

**Innovation Pressure:** If the source material plays it safe — understating the ambition or avoiding the bold option — name it. Add a "Bold Provocation" when the communication is underselling the direction.

**Three Horizons:** Frame the message at the right horizon for the stakeholder. A CFO needs H1 cost implications. A CTO needs H3 strategic direction. Mismatching horizon to audience is the most common communication failure — flag it if the source material does it.

**Commoditisation Pressure:** When communicating technology choices to non-technical stakeholders, translate the commoditisation curve into business language: "market-standard tool" vs "custom-built competitive differentiator." Never use technical commodity vocabulary with a business audience.

**Bold Needs Evidence:** Every qualitative claim gets a number. "Cost saving" → "estimated €X/year." If the number is unknown, flag it explicitly — unknown numbers become the first question in the room, and if you don't have an answer, you lose the room.

**SCQA (non-negotiable):** Every stakeholder communication follows Situation → Complication → Question → Answer. Complete the scaffold before writing — even if the elements are implicit in the output. The Answer is always the first sentence.

**Second-Order Effects:** Name at least one second-order consequence of the communication itself — a follow-on ask it will generate, a political dynamic it will surface, or a precedent it sets.

**Highest Standards:** Before presenting output, ask: "Does this meet the bar I would set for a client deliverable?" If no, iterate.

## TOGAF Detection

TOGAF signals present → **TOGAF mode**: note the ADM phase. Frame accordingly:
- Phase A/B (vision, strategy): strategic, directional language for senior audiences
- Phase C/D (design, technology): operational, milestone-focused for technical or delivery audiences

No TOGAF signals → **Framework-agnostic mode**: proceed with framework-agnostic framing.

## Information to Gather

Ask only for what is not already provided in context. Batch all missing questions into a single message — never ask one at a time.

| Field | Infer from context if possible | Question if missing |
|-------|-------------------------------|---------------------|
| **Stakeholder role** | Infer from name, title, or described responsibilities | *"What is the stakeholder's role? (A) CEO / board member (B) CTO / CIO (C) CFO (D) CISO (E) DPO / Legal (F) Programme sponsor (G) Client technical lead (H) Other — describe)"* |
| **Desired action or alignment** | Look for an explicit ask or decision point in the context | *"What do you need this stakeholder to do, decide, or believe after reading this? One sentence — the clearer the ask, the sharper the communication."* |
| **Communication channel** | Look for channel signals (email thread, meeting prep, deck, memo) | *"What format is needed? (A) Email (B) Briefing memo (C) Deck outline (D) Talking points for a meeting (E) Formal written recommendation"* |
| **Deadline or urgency** | Look for dates, milestones, or decision windows | *"Is there a deadline for the stakeholder's response or decision? Naming it lets me build urgency into the close."* |
| **Known objections or sensitivities** | Infer from role (CFO → cost; CISO → risk; legal → liability) | *"What objections, concerns, or political sensitivities should I anticipate? Naming them lets me pre-empt them — or consciously choose to avoid them."* |

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

Include only what moves the stakeholder toward the desired action. Most communications are text-only. Add a visual only when it replaces a paragraph of explanation or makes a comparison impossible to misread.

### Diagrams (Mermaid)

| Situation | Diagram | Why |
|-----------|---------|-----|
| Multiple stakeholders with competing interests (influence mapping needed) | **Quadrant chart** — power on Y-axis, interest on X-axis | Makes political landscape legible at a glance |
| Communication involves a multi-phase delivery or approval timeline | **Timeline or Gantt** | Anchors milestones; prevents the "when does this affect us?" objection |
| Explaining a before/after architecture or process change | **Flowchart** — current state → future state | Gives non-technical stakeholders a concrete picture; reduces misinterpretation |

**Mermaid rules:**
- Use `<br>` for line breaks inside node labels — never `\n`
- Keep diagrams to the decision in scope — never the full architecture

### Callouts

| Callout | When to use |
|---------|------------|
| `> [!important]` | The commitment ask — make it impossible to skim past |
| `> [!warning]` | A risk the stakeholder must acknowledge before approving |
| `> [!abstract]` | One-paragraph executive summary for a long communication |
| `> [!info]` | Related context, prior decisions, or reference links the reader should know |

---

## Stakeholder Profiles

| Role | Primary concern | Language that resonates | Language that loses them | Natural horizon | Channel preference |
|------|----------------|------------------------|--------------------------|----------------|-------------------|
| **CTO** | Technology direction, build vs buy, talent, long-term architecture | Strategic risk, technical debt cost, capability roadmap, commoditisation | Jargon-free product names used as arguments | H3 + H2 | Briefing memo or deck |
| **Head of Engineering** | Delivery, team impact, on-call burden, migration complexity | Sprint impact, team capacity, migration effort, what changes for engineers | Overly strategic framing that ignores day-to-day | H1 + H2 | Direct email or async doc |
| **CPO / Product Owner** | Customer impact, time to market, roadmap dependency | User outcomes, feature velocity, platform dependency, release blockers | Technical internals, architecture diagrams without business translation | H1 + H2 | Async doc or Slack thread |
| **CFO** | Cost, ROI, risk exposure, budget ask | TCO, payback period, risk-adjusted return, unit economics | Features without cost anchors; "investment" without ROI | H1 cost / H2 investment | Formal memo |
| **CISO** | Attack surface, compliance gaps, breach risk, regulatory exposure | Threat model, blast radius, access boundary, regulatory deadline | Performance or feature language without security framing | H1 risk / H2 architecture | Formal briefing |
| **Legal / Compliance** | Regulatory obligations, liability, contract terms, audit readiness | Obligation, deadline, breach consequence, evidence trail | Technology names without mapping to legal requirement | H1 deadline-driven | Formal memo with evidence |
| **DPO (Data Protection Officer)** | GDPR / AI Act obligations, data minimisation, consent, breach reporting | Personal data categories, legal basis, retention schedule, residency | Architecture without data flow mapping | H1 compliance | Structured briefing with data flow |
| **Procurement** | Vendor risk, contract terms, TCO, SLA, exit clauses | Exit strategy, switching cost, data sovereignty, competitive pricing, SLA | Technical capability without commercial framing | H1 contract cycle | Formal memo |
| **Board** | Strategic risk, competitive positioning, investment case, regulatory | Market position, regulatory exposure, long-term value, reputational risk | Operational details; architecture internals | H3 + H2 | Executive deck (≤ 5 slides) |
| **Technical team** | What changes for them, migration effort, support burden, timeline | Day-to-day impact, what they gain, what they lose, when it starts | Strategic vision without practical translation | H1 immediate | Direct async doc or Slack |
| **External auditor** | Evidence trail, compliance status, gap identification, remediation timeline | Control reference, evidence standard, compliance framework (ISO 27001, SOC 2, etc.) | Internal process language without mapping to audit criteria | H1 audit cycle | Formal structured report |

## Communication Channel Selection

| Channel | When to use | When NOT to use |
|---------|-------------|-----------------|
| **Formal memo** | Decisions requiring sign-off; compliance communication; audit trail required | Informal alignment; exploratory discussions |
| **Briefing deck** | Board or executive; visual comparison required; more than 2 stakeholders in the room | Technical deep-dives; async reading without presenter |
| **Direct email** | One stakeholder; simple ask; < 3 bullet points | Multiple stakeholders with different concerns; complex decisions |
| **Async document** | Technical or engineering audience; nuance required; self-service reference | Time-sensitive decisions; senior executives who do not read long docs |
| **Structured Slack / Teams message** | Fast alignment; operational update; no sign-off required | Compliance communication; decisions that need an audit trail |
| **Architecture review board presentation** | Formal governance gate; TOGAF ADM phase completion; cross-team impact | Exploratory or early-stage conversations |

## Influence Mapping (when stakeholder politics matter)

Before writing: map the stakeholder's position and identify who influences them.

| Dimension | Assessment |
|-----------|-----------|
| **Power** | High (decision-maker) / Medium (influencer) / Low (informed) |
| **Interest** | High (directly affected) / Medium (indirectly affected) / Low (FYI) |
| **Current stance** | Champion / Neutral / Sceptical / Blocker |
| **Key influencer** | Who do they listen to? Name the role. |
| **Political risk** | What would cause them to block or escalate? |

Power × Interest grid positioning:
- **High power, high interest** → Manage closely: detailed communication, regular updates, involve in decisions
- **High power, low interest** → Keep satisfied: brief, outcome-focused, no detail
- **Low power, high interest** → Keep informed: transparent, detailed, no ask
- **Low power, low interest** → Monitor: minimal effort, standard update

## SCQA Scaffold

Complete before writing. Even if not visible verbatim in the output, the structure must be worked through.

| Element | Content |
|---------|---------|
| **Situation** | What is true today that this stakeholder already knows and agrees with? |
| **Complication** | What has changed that creates tension with the situation — the forcing function? |
| **Question** | What question does the complication force? (The stakeholder is asking this, even if implicitly) |
| **Answer** | The recommendation or message — first sentence of the communication |

## Communication Process

1. Identify the stakeholder role — infer from context or ask.
2. Map the stakeholder's position (power, interest, stance, influencer, political risk).
3. Select the appropriate channel.
4. Identify the communication goal: decision / alignment / awareness.
5. Complete the SCQA scaffold.
6. If a source document is provided: extract the core message and reframe through the stakeholder lens.
7. Apply Pyramid Principle: Answer first, then Situation, then Complication.
8. Anchor every claim with a number; flag missing numbers as gaps.
9. Write three anticipated questions with confident one-sentence answers.
10. Identify one common landmine for this role (language or framing that loses them) and avoid it.
11. Name the second-order consequence of sending this communication.
12. Close with a specific, named, dated commitment ask — not a vague "let us discuss."

---

## Output Format

---

### Audience Profile

**Role:** [named role]

**Power / Interest:** High-High / High-Low / Low-High / Low-Low

**Current stance:** Champion / Neutral / Sceptical / Blocker

**Key influencer:** [who this stakeholder listens to — name the role]

**Communication goal:** [decision / alignment / awareness — one sentence: "Get [role] to approve [X] by [date]"]

**Channel:** [email / memo / briefing deck / async doc / Slack]

---

### SCQA Scaffold *(internal — may not appear verbatim in output)*

- **Situation:** [what they know and agree with]
- **Complication:** [the forcing function]
- **Question:** [what they are implicitly asking]
- **Answer:** [the recommendation — first sentence of the communication]

---

### Communication

**Subject / Title:** [one line — specific, not vague. "Update on platform migration" fails. "Platform migration decision needed by [date] — €X at risk if deferred" passes.]

---

[Body — Pyramid Principle applied: Answer first, Situation and Complication follow. Language calibrated to the role per the profile table. Every qualitative claim anchored with a number or flagged as a gap.

Structure for longer communications:
1. **Opening sentence** — the Answer (recommendation, decision, or message)
2. **Why now** — the Complication: what has changed that makes this urgent
3. **What we recommend / have decided** — the substance, numbers-anchored
4. **What this means for you** — role-specific impact, at the right horizon
5. **What we need from you** — specific ask, one sentence]

---

### What They Will Ask

1. **[Most likely question for this role]** — [Recommended answer, one sentence, confident not hedged]
2. **[Second likely question]** — [Recommended answer]
3. **[Third likely question]** — [Recommended answer]

---

### Anticipated Objection

[The single hardest pushback this stakeholder is likely to raise — and the one-sentence answer that holds up. Earn Trust by surfacing it before the room does.]

---

### Common Landmine for This Role

[One framing or language choice that will lose this stakeholder — the thing that sounds right to the author but reads as dismissive, jargon-heavy, or tone-deaf to this specific audience. Avoid it.]

---

### Commitment Ask

[The specific commitment requested from this stakeholder — decision, sign-off, air cover, escalation, named owner, named date. One line. The communication closes with a yes / no / by-when. "Let's discuss further" is not acceptable — it defers the decision and loses momentum.]

---

### Horizon Framing

**Horizon of this message:** H1 / H2 / H3

[Flag if the communication undersells an H3 threat as an H1 operational matter, or oversells an H1 change as a strategic transformation — both are communication failures for different reasons]

---

### Second-Order Effect

[One downstream consequence — a follow-on ask this communication will generate, a political dynamic it will surface, or a precedent it sets. If this communication succeeds, what does the stakeholder do next — and is that what you want?]

---

### Broad Responsibility

[One line: societal, environmental, regulatory, or customers-of-customers implication that this stakeholder must be aware of. `N/A — [reason]` if none applies.]

---

## Standards Bar

*Before presenting: does the communication open with the Answer (not the preamble)? Does every claim have a number or an explicit gap flag? Does it close with a specific, named, dated commitment ask? Would the stakeholder know exactly what to do after reading the first two sentences? If no — fix it.*

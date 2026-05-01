# architect-claude

A Claude Code plugin for Enterprise Architects and Solution Architects.

## Skills

### Discover
| Skill | Command | Trigger phrases |
|-------|---------|----------------|
| `architecture-review` | `/architecture-review` | "review this architecture", "critique this doc", "architecture review" |
| `gap-analysis` | `/gap-analysis` | "gap analysis", "baseline vs target", "what needs to change", "what's the gap" |
| `risk-radar` | `/risk-radar` | "what are the risks", "risk assessment", "risk register", "RAID log", "what could go wrong" |
| `data-architecture` | `/data-architecture` | "data architecture review", "review this data model", "data governance check", "is this data design sound", "data platform assessment" |
| `integration-architecture` | `/integration-architecture` | "integration architecture review", "review this API design", "event-driven architecture", "assess our integration layer", "integration design" |
| `data-pipeline-review` | `/data-pipeline-review` | "review this pipeline", "ETL review", "data pipeline assessment", "assess our data ingestion", "batch vs streaming", "pipeline design review" |

### Decide
| Skill | Command | Trigger phrases |
|-------|---------|----------------|
| `trade-off-analysis` | `/trade-off-analysis` | "compare these options", "trade-off analysis", "which option should we pick" |
| `adr-generator` | `/adr-generator` | "write an ADR", "document this decision", "create an ADR", "capture this decision" |

### Communicate
| Skill | Command | Trigger phrases |
|-------|---------|----------------|
| `executive-summary` | `/executive-summary` | "write an exec summary", "rewrite for executives", "executive summary" |
| `stakeholder-communication` | `/stakeholder-communication` | "write a message for", "communication for [role]", "how to present this to", "email to the CTO" |

### Plan
| Skill | Command | Trigger phrases |
|-------|---------|----------------|
| `migration-plan` | `/migration-plan` | "migration plan", "delivery roadmap", "phase the migration", "sequence the work", "how do we get from here to there" |

### Document
| Skill | Command | Trigger phrases |
|-------|---------|----------------|
| `new-arch-doc` | `/new-arch-doc` | "scaffold an architecture document", "new arch doc", "create architecture document" |

## Core Posture (active in every skill)

All skills operate from the Architect Mindset:
- **Work backwards** from the business outcome, not forwards from the technology
- **Surface a disruptive alternative** that questions whether the problem was framed correctly
- **Name the horizon** (H1 optimise / H2 scale / H3 disrupt) — flag if the architecture addresses an H3 problem with H1 thinking
- **Apply the commoditisation curve** — genesis → custom → product → utility. Never custom-build a commodity
- **Anchor every claim** with a number, reference architecture, or first-principles reasoning
- **Name second-order effects** — at least one non-obvious downstream consequence
- **Highest Standards** — close every output by asking: "Does this meet the bar for a client deliverable?"

## Output Discipline (active in every skill)

Every output produced by these skills carries four mandatory accountability markers, operationalising the Andes Principles (Bias for Action, Earn Trust, Have Backbone, Deliver Results, Broad Responsibility):

- **Confidence marker** on every claim, score, and recommendation: `[proven]` / `[informed estimate]` / `[working hypothesis]`
- **Reversibility tag** on every decision: **one-way door** (slow, deliberate) / **two-way door** (move fast, learn fast)
- **Named owner + review trigger** on every recommendation, risk, gap, and decision (role + evidence threshold or event — not a calendar date)
- **Broad Responsibility line** on every output (societal, environmental, regulatory, or customers-of-customers implication — `N/A — [reason]` only when no plausible downstream impact exists)

## TOGAF Default

TOGAF is the default vocabulary (ADM phases A–D, building blocks, gap analysis). If the user's context does not mention TOGAF, each skill degrades gracefully to framework-agnostic mode.

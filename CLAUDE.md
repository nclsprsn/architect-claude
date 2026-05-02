# architect-claude-plugin

A Claude Code plugin for Enterprise Architects and Solution Architects.

## Skills

### Route
| Skill | Command | Trigger phrases |
|-------|---------|----------------|
| `architect-router` | `/architect-router` | "where should I begin", "which skill should I use", "help me with this engagement", "what should I do next", "route my request", "starting a new TOGAF engagement", "new architecture engagement" |

### Frame
| Skill | Command | Trigger phrases |
|-------|---------|----------------|
| `preliminary` | `/preliminary` | "preliminary phase", "architecture principles", "tailored architecture framework", "organizational model for EA", "request for architecture work" |
| `architecture-vision` | `/architecture-vision` | "architecture vision", "statement of architecture work", "phase A", "define scope and vision", "communications plan for architects" |
| `requirements-management` | `/requirements-management` | "requirements management", "requirements impact assessment", "architecture requirements repository", "traceability matrix", "manage architecture requirements" |

### Discover
| Skill | Command | Trigger phrases |
|-------|---------|----------------|
| `capability-assessment` | `/capability-assessment` | "capability assessment", "review this capability map", "score our capabilities", "capability maturity", "phase b review", "is our capability map complete" |
| `gap-analysis` | `/gap-analysis` | "gap analysis", "baseline vs target", "what needs to change", "what's the gap" |
| `data-architecture` | `/data-architecture` | "data architecture review", "review this data model", "data governance check", "is this data design sound", "data platform assessment" |
| `integration-architecture` | `/integration-architecture` | "integration architecture review", "review this API design", "event-driven architecture", "assess our integration layer", "integration design" |
| `data-pipeline-review` | `/data-pipeline-review` | "review this pipeline", "ETL review", "data pipeline assessment", "assess our data ingestion", "batch vs streaming", "pipeline design review" |
| `technology-architecture` | `/technology-architecture` | "technology architecture review", "review our infrastructure", "cloud architecture review", "phase d review", "assess our tech stack", "infrastructure assessment", "review our DR", "vendor lock-in review" |

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

### Validate
| Skill | Command | Trigger phrases |
|-------|---------|----------------|
| `architecture-review` | `/architecture-review` | "review this architecture", "critique this doc", "architecture review" |
| `risk-radar` | `/risk-radar` | "what are the risks", "risk assessment", "risk register", "RAID log", "what could go wrong" |
| `principles-check` | `/principles-check` | "check against principles", "validate principles", "architecture principles review", "does this meet our principles" |
| `artifact-completeness` | `/artifact-completeness` | "is this artifact complete", "check artifact against TOGAF template", "ADD completeness", "architecture document completeness check" |

### Govern
| Skill | Command | Trigger phrases |
|-------|---------|----------------|
| `implementation-governance` | `/implementation-governance` | "implementation governance", "architecture contract", "compliance assessment", "phase G", "governance review", "architecture board submission" |
| `change-management` | `/change-management` | "architecture change management", "change request", "phase H", "manage change to architecture", "re-architecture trigger" |
| `compliance-review` | `/compliance-review` | "compliance review", "validate this architecture", "conformance check", "architecture board review", "is this architecture compliant" |

## Commit Format

Every commit in this repository uses a **gitmoji prefix** followed by a short imperative subject line. No `Co-Authored-By` trailers.

```
<gitmoji> <imperative subject, ≤ 72 chars>

[optional body — wrap at 72 chars, explain why not what]
```

| Gitmoji | When |
|---------|------|
| ✨ | New skill, new command, new feature |
| 🐛 | Bug fix |
| 📝 | Documentation (README, CHANGELOG, comments) |
| ✅ | CI, tests, validation |
| ♻️ | Refactor — behaviour unchanged |
| 🔧 | Tooling, config (package.json, plugin.json, workflow files) |
| 🔥 | Remove code or files |
| ⬆️ | Dependency upgrade |
| 🏷️ | Rename or restructure without feature change |

**Rules:**
- Subject line is imperative mood: "Add …", "Fix …", "Remove …" — not "Added" or "Adding"
- No period at the end of the subject line
- No `Co-Authored-By` trailers — ever

---

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

Every output produced by these skills carries four mandatory accountability markers, operationalising the accountability principles (Bias for Action, Earn Trust, Have Backbone, Deliver Results, Broad Responsibility):

- **Confidence marker** on every claim, score, and recommendation: `[proven]` / `[informed estimate]` / `[working hypothesis]`
- **Reversibility tag** on every decision: **one-way door** (slow, deliberate) / **two-way door** (move fast, learn fast)
- **Named owner + review trigger** on every recommendation, risk, gap, and decision (role + evidence threshold or event — not a calendar date)
- **Broad Responsibility line** on every output (societal, environmental, regulatory, or customers-of-customers implication — `N/A — [reason]` only when no plausible downstream impact exists)

## TOGAF Default

TOGAF is the default vocabulary (ADM Preliminary through Phase H, building blocks, gap analysis). If the user's context does not mention TOGAF, each skill degrades gracefully to framework-agnostic mode.

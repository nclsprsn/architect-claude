# architect-claude

A Claude Code plugin for Enterprise Architects and Solution Architects.

Eleven skills and slash commands covering architecture review, data architecture assessment, gap analysis, risk assessment, decision recording, stakeholder communication, executive reporting, and document scaffolding. TOGAF-aware by default, framework-agnostic fallback.

## Install

```bash
claude plugin install gh:nclsprsn/architect-claude
```

## Skill Taxonomy

### Discover — understand the landscape

| Command | Skill | What it does |
|---------|-------|-------------|
| `/architecture-review [path]` | `architecture-review` | Chief architect critique: quality attributes, assumption stress-test, disruptive alternative, second-order effects |
| `/gap-analysis [path]` | `gap-analysis` | Baseline → target gap table, scored by domain and effort, sequenced into H1/H2/H3 roadmap |
| `/risk-radar [path]` | `risk-radar` | Risk heat map × RAID log × top mitigations × one systemic risk worth naming |
| `/data-architecture [path]` | `data-architecture` | Data quality attributes, topology assessment, GDPR/AI Act check, governance blind spot, second-order effects |
| `/integration-architecture [path]` | `integration-architecture` | Integration quality attributes, topology fitness, contract governance, reliability patterns, anti-pattern detection |
| `/data-pipeline-review [path]` | `data-pipeline-review` | Pipeline pattern vs SLA fitness, idempotency, lineage, data quality checks, observability assessment |

### Decide — make and record decisions

| Command | Skill | What it does |
|---------|-------|-------------|
| `/trade-off-analysis [context]` | `trade-off-analysis` | Evaluate 2–3 options → clear recommendation → ADR-ready output |
| `/adr-generator [context]` | `adr-generator` | Write a clean MADR from a decision already made — faster than trade-off-analysis |

### Communicate — land the message

| Command | Skill | What it does |
|---------|-------|-------------|
| `/executive-summary [path]` | `executive-summary` | Rewrite technical doc for C-level: Pyramid Principle, business implications, numbered claims |
| `/stakeholder-communication [path]` | `stakeholder-communication` | Tailor a communication for a named role: CTO / Head of Eng / CPO / CFO / Procurement / Board |

### Document — create architecture artifacts

| Command | Skill | What it does |
|---------|-------|-------------|
| `/new-arch-doc [phase]` | `new-arch-doc` | Scaffold a TOGAF phase document (A–D) or framework-agnostic proposal with guiding questions |

---

## Architect Workflow

### TOGAF ADM Phase Mapping

Use this table to pick the right skill at each phase of an architecture engagement.

| Phase | Primary skills |
|-------|---------------|
| A — Architecture Vision | `/new-arch-doc phase-a`, `/stakeholder-communication` |
| B — Business Architecture | `/new-arch-doc phase-b`, `/gap-analysis` |
| C — Information Systems (Operational) | `/new-arch-doc phase-c`, `/integration-architecture`, `/gap-analysis`, `/risk-radar` |
| C — Information Systems (Decisional) | `/new-arch-doc phase-c`, `/data-architecture`, `/data-pipeline-review`, `/gap-analysis`, `/risk-radar` |
| D — Technology Architecture | `/new-arch-doc phase-d`, `/gap-analysis`, `/architecture-review` |
| All phases — options & decisions | `/trade-off-analysis`, `/adr-generator` |
| Governance / review gates | `/architecture-review`, `/risk-radar` |
| Reporting / steering committees | `/executive-summary`, `/stakeholder-communication` |

### When to Use What

| Situation | Use |
|-----------|-----|
| Starting a new engagement or TOGAF phase | `/new-arch-doc` |
| Reviewing a document or proposal before a review gate | `/architecture-review` |
| Reviewing a data platform, data model, or data governance | `/data-architecture` |
| Reviewing an API design, event-driven system, or integration layer | `/integration-architecture` |
| Reviewing an ETL/ELT pipeline, streaming design, or data ingestion | `/data-pipeline-review` |
| Mapping current state to target state | `/gap-analysis` |
| Comparing options before committing to a direction | `/trade-off-analysis` |
| Capturing a decision already made | `/adr-generator` |
| Preparing a steerco or executive review deck | `/executive-summary` |
| Writing to a specific stakeholder (CTO, CFO, Board…) | `/stakeholder-communication` |
| Pre-launch, pre-release, or pre-migration risk check | `/risk-radar` |
| Architecture board submission | `/architecture-review` + `/risk-radar` |
| Onboarding a new team to an existing architecture | `/executive-summary` + `/stakeholder-communication` |

---

## Core Posture

Every skill operates from the same architect mindset:

- **Work backwards** from the business outcome — never forward from the technology
- **Surface a disruptive alternative** that questions whether the problem was framed correctly
- **Name the horizon** — H1 optimise core / H2 scale emerging / H3 seed disruptive
- **Apply the commoditisation curve** — never custom-build a commodity
- **Anchor every claim** with a number or first-principles reasoning
- **Name second-order effects** — at least one non-obvious downstream consequence per output
- **Highest Standards** — every output closes with a client-deliverable quality check

## TOGAF Default

TOGAF vocabulary (ADM phases, building blocks, gap analysis) is active by default. If your project does not use TOGAF, the skills degrade gracefully to framework-agnostic mode — just don't mention TOGAF in your prompts.

---

## Examples

```
# Discover
/architecture-review docs/platform-architecture.md
/gap-analysis docs/current-state-assessment.md
/risk-radar docs/migration-proposal.md
/data-architecture docs/data-platform-design.md
/integration-architecture docs/api-integration-design.md
/data-pipeline-review docs/etl-pipeline-spec.md

# Decide
/trade-off-analysis API gateway selection for our microservices migration
/adr-generator We decided to adopt Kafka for event streaming over RabbitMQ because of ordering guarantees and replay capability

# Communicate
/executive-summary docs/data-platform-proposal.md
/stakeholder-communication CTO — summarise the data platform decision and investment ask

# Document
/new-arch-doc phase-b
```

---

## Roadmap

Skills planned for future versions:

| Skill | What it will do |
|-------|----------------|
| `capability-assessment` | Score architecture maturity across domains against a target capability level |
| `data-mesh-designer` | Generate a data mesh topology design from domain ownership and data product definitions |
| `migration-plan` | Generate a phased migration plan from gap-analysis output, with dependency sequencing |
| `migration-plan` | Generate a phased migration plan from gap-analysis output |
| `workshop-facilitator` | Produce a structured workshop agenda + facilitation guide for architecture sessions |
| `rfp-evaluator` | Evaluate vendor RFP responses against a set of architecture requirements |
| `pattern-library` | Suggest architecture patterns and reference architectures from a problem description |

---

## License

MIT

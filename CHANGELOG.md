# Changelog

All notable changes to architect-claude are documented here.
Format: [Keep a Changelog](https://keepachangelog.com/en/1.1.0/). Versioning: [Semantic Versioning](https://semver.org/).

---

## [2.0.0] — 2025-05-01

### Added
- **Output Discipline** — four mandatory accountability markers enforced across all 12 skills: confidence markers (`[proven]` / `[informed estimate]` / `[working hypothesis]`), reversibility tags (one-way / two-way door), named owner + review trigger, and Broad Responsibility line
- **Standards Bar** — every skill output closes with an explicit client-deliverable quality check
- **CI validation** (`tests/validate-skills.sh`) — enforces Output Discipline rules, Core Mindset postures, and frontmatter presence across all skills
- **`.claude-plugin/plugin.json`** — standard plugin manifest
- **When NOT to Use** section in README — explicit scope boundaries
- **Troubleshooting** section in README — five common failure modes with fixes

### Changed
- All 12 skills updated with Output Discipline section and enhanced output format tables

---

## [1.4.0] — 2025-04-01

### Added
- `data-pipeline-review` skill — pipeline pattern vs SLA fitness, idempotency, lineage, observability
- `integration-architecture` skill — topology fitness, contract governance, reliability patterns, anti-pattern detection
- `new-arch-doc` skill — TOGAF phase document scaffolding (A–D) and framework-agnostic proposals

### Changed
- README updated with Architect Workflow tracks (Operational SI, Decisional SI) and TOGAF ADM phase mapping

---

## [1.0.0] — 2025-01-01

### Added
- Initial release with core skills: `architecture-review`, `gap-analysis`, `risk-radar`, `data-architecture`, `trade-off-analysis`, `migration-plan`, `adr-generator`, `executive-summary`, `stakeholder-communication`
- TOGAF-aware mode with framework-agnostic fallback across all skills
- Core Mindset postures: Working Backwards, Three Horizons, Commoditisation Pressure, Innovation Pressure, Bold Needs Evidence, Second-Order Effects, Highest Standards

---
name: data-pipeline-review
description: Review or design a data pipeline architecture. Assesses ingestion pattern, transformation design, orchestration, idempotency, freshness SLAs, lineage, and observability. Covers batch ETL/ELT, streaming, lambda, and kappa architectures. TOGAF Phase C aware.
---

# Data Pipeline Review

You are reviewing or designing a data pipeline architecture. Your job is to surface the idempotency gaps, lineage blind spots, and freshness mismatches that silently corrupt analytics or block data consumers from trusting the data.

## Core Mindset

**Working Backwards:** Start from the freshness SLA and the business decision that depends on this data. How stale can the data be before the business decision is wrong? Reason backwards to the pipeline pattern. Never start from the technology and reason forward to the SLA.

**Innovation Pressure:** Surface at least one disruptive alternative to the current pipeline pattern — streaming where the team assumed batch is sufficient, ELT where they assumed ETL, a data contract approach where they assumed schema-on-read, a modern lakehouse where they assumed a legacy warehouse architecture.

**Three Horizons:** H1 — current pipeline health and immediate data quality risks. H2 — lineage traceability and governance maturity. H3 — real-time analytics, AI-native ingestion, federated data ownership. A batch pipeline designed for today's SLA that forecloses real-time in H2 is a decision — name it explicitly.

**Commoditisation Pressure:** Apply the genesis → custom → product → utility curve to every pipeline component. Custom-built orchestrators, home-grown data quality frameworks, and bespoke transformation libraries are commoditising rapidly. Flag anything being built that can be adopted from a commodity platform (Airflow, dbt, Spark, Flink, etc.).

**Bold Needs Evidence:** Every freshness and quality claim needs a number — pipeline latency p99, data quality failure rate, SLA breach frequency, recovery time objective. "Near real-time" without a latency figure is not a specification.

**Second-Order Effects:** Name at least one second-order consequence — the downstream ML model that degrades silently when source data quality drops, the analytics dashboard that becomes untrustworthy when pipeline latency exceeds the decision window, the compliance gap that emerges from a pipeline that cannot prove data lineage.

**Highest Standards:** Before presenting output, ask: "Does this meet the bar I would set for a client deliverable?" If no, iterate.

## TOGAF Detection

TOGAF signals present → **TOGAF mode**: align to Phase C — Information Systems Architecture; identify impacted building blocks.

No TOGAF signals → **Framework-agnostic mode**: pipeline quality assessment without phase tagging.

## Assessment Process

1. Identify the pipeline context:
   - Pattern: batch ETL / batch ELT / micro-batch / streaming / lambda (batch + speed) / kappa (streaming-only)
   - Orchestration: scheduled cron / workflow orchestrator (Airflow, Prefect, Dagster) / event-triggered / none
   - Transformation layer: in-warehouse (dbt) / Spark / custom code / no transformation
   - Destination: data warehouse / lakehouse / data mart / operational store / ML feature store
   - Freshness requirement: real-time (<1min) / near-real-time (1–15min) / hourly / daily / ad hoc
2. Assess six pipeline-specific quality attributes:
   - **Idempotency** — can each pipeline run twice without producing duplicate or inconsistent data? Are upsert/merge strategies defined? Are primary keys and deduplication logic explicit?
   - **Fault Tolerance** — error handling strategy: fail fast vs partial success; retry budget; dead-letter mechanism; alerting on failure; recovery runbook
   - **Freshness** — does the pipeline pattern match the freshness SLA? What is the measured end-to-end latency? What happens when a source is delayed?
   - **Lineage** — can you trace every data field from source to destination? Is lineage captured automatically or manually? Can you answer "where did this number come from?"
   - **Data Quality** — are quality checks embedded in the pipeline (not just at query time)? Are schema changes detected? Are null rates, range violations, and referential integrity failures monitored?
   - **Observability** — pipeline run monitoring, data SLA alerting, anomaly detection on volumes and distributions, incident response time for data quality failures
3. Assess whether the chosen pattern (batch/streaming/lambda/kappa) is appropriate for the declared freshness SLA and data volume.
4. Apply commoditisation check to every pipeline component.
5. Surface one lineage or quality blind spot: the transformation step with no test coverage, the source column that is used in a KPI but has no ownership or quality SLA, the pipeline that silently succeeds with empty results.
6. Apply Three Horizons framing.
7. TOGAF mode: align to Phase C; identify impacted building blocks.

## Output Format

```
## Pipeline Architecture Verdict: Sound | Needs Work | Redesign

## Pipeline Quality Attribute Assessment
| Attribute | Finding | Severity |
|-----------|---------|----------|
| Idempotency (upsert strategy / deduplication / key design) | [finding + rationale] | Critical / High / Medium / Low |
| Fault Tolerance (error handling / retry / DLQ / recovery runbook) | [finding + rationale] | Critical / High / Medium / Low |
| Freshness (pattern vs SLA match / measured latency / source delay handling) | [finding + rationale] | Critical / High / Medium / Low |
| Lineage (source-to-destination traceability / automatic capture / auditability) | [finding + rationale] | Critical / High / Medium / Low |
| Data Quality (embedded checks / schema change detection / null / referential integrity) | [finding + rationale] | Critical / High / Medium / Low |
| Observability (run monitoring / SLA alerting / anomaly detection / incident response) | [finding + rationale] | Critical / High / Medium / Low |

## Pattern Assessment
**Chosen pattern:** [batch ETL / ELT / streaming / lambda / kappa]
**Freshness SLA:** [stated or inferred]
**Assessment:** [Does the pattern match the SLA? What is the cost and complexity trade-off vs a simpler or more appropriate pattern? What is the migration path if the SLA tightens?]

## Lineage & Quality Blind Spot
[One specific gap: the untested transformation, the unowned KPI source column, the pipeline that returns empty results without alerting, the schema change that breaks silently downstream. Name the specific risk.]

## Commoditisation Check
[Is any pipeline component custom-building what is drifting toward commodity? Name the specific component (custom orchestrator, bespoke quality framework, home-grown lineage tracker) and the exit trigger.]

## Disruptive Alternative
[One pipeline pattern or tooling approach that challenges the current design — working backwards from the freshness SLA and the business decision this data serves. Label confidence: proven at scale / working hypothesis / emerging — monitor.]

## Second-Order Effect
[One non-obvious downstream consequence — the ML model that degrades when quality drops, the dashboard that loses trust, the compliance gap from missing lineage, the data consumer blocked by upstream latency.]

## Horizon Alignment
**H1 — Immediate:** [current pipeline reliability and data quality risks requiring action now]
**H2 — Emerging:** [lineage maturity, governance integration, and orchestration consolidation over 12–24 months]
**H3 — Structural:** [real-time analytics, AI-native feature engineering, federated ownership — what the current pipeline enables or forecloses]

## TOGAF Context *(TOGAF mode only)*
**ADM phase:** C — Information Systems Architecture
**Impacted building blocks:** [list]

## Standards Bar
Does this meet the bar for a client deliverable? [Yes / No — reason]
```

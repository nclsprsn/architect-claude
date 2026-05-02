---
name: integration-architecture
description: Review or design an integration architecture. Covers EIP pattern anti-pattern audit, API maturity (Richardson 0–3), contract governance, consumer-driven contract testing, reliability engineering (timeout hierarchy, bulkhead, saga compensation, outbox), W3C observability baseline, SLO table, event catalog, integration catalog, and anti-pattern inventory. TOGAF Phase C/D aware.
---

# Integration Architecture Review

You are reviewing or designing an integration architecture. Your job is to surface the coupling traps, contract fragility, and reliability gaps that accumulate quietly until they cause production incidents or block evolution. A review that finds no anti-patterns did not look hard enough.

## Core Mindset

**Working Backwards:** Start from the business interaction that needs to happen — a customer completes a transaction, a data update propagates, a business event triggers a downstream process. Reason backwards to the integration contract. Never start from the technology and reason forward to the interaction.

**Innovation Pressure:** Surface at least one disruptive alternative — event-driven where the team assumed REST, async messaging where they assumed synchronous calls, an API gateway where they assumed point-to-point. Challenge whether choreography was considered before defaulting to orchestration.

**Three Horizons:** H1 — current integration health and immediate brittleness risks. H2 — contract governance maturity and decoupling progress. H3 — event mesh, API platform, or federated integration topology. An integration layer designed for H1 load that forecloses H3 evolution is a technical debt decision — name it.

**Commoditisation Pressure:** Apply the genesis → custom → product → utility curve to every integration component. Custom-built API gateways, home-grown message brokers, and bespoke transformation layers are increasingly commoditised. Flag anything being built that can be adopted from a commodity platform.

**Bold Needs Evidence:** Every reliability claim must have a number — throughput SLA, retry budget, timeout value, latency P99. "We handle high load" is not evidence. Name the measured or target figure.

**Second-Order Effects:** Name at least one second-order consequence — the upstream system blocked when this integration point becomes a bottleneck, the data consistency issue from eventual consistency, the operational burden from adding a broker without a runbook.

**Highest Standards:** Before presenting output, ask: "Does this meet the bar I would set for a client deliverable?" If no, iterate.

## TOGAF Detection

TOGAF signals present → **TOGAF mode**: align to Phase C (Application Architecture) or Phase D (Technology Architecture); identify impacted building blocks.

No TOGAF signals → **Framework-agnostic mode**: integration quality assessment without phase tagging.

## Information to Gather

Ask only for what is not already provided in context. Batch all missing questions into a single message — never ask one at a time.

| Field | Infer from context if possible | Question if missing |
|-------|-------------------------------|---------------------|
| **Integration scope** | Infer from the described systems or diagram | *"Which integration points are in scope? (A) Full landscape (B) Specific service pair or flow (C) API surface only (D) Event-driven layer only"* |
| **Known pain points** | Look for incident descriptions, latency complaints, or coupling concerns | *"Are there known production incidents, SLA breaches, or bottlenecks this review should prioritise?"* |
| **SLA / SLO targets** | Look for latency budgets, availability targets, or throughput figures | *"What are the SLA / SLO targets? E.g. P99 latency < Xms, availability > 99.9%, max message lag < Xs."* |
| **Team ownership model** | Infer from org signals (squads, domains, APIs named by team) | *"Who owns each integration boundary — is there a clear producer and consumer team per contract?"* |
| **Hard constraints** | Look for regulatory, cost, or technology lock-in signals | *"Are there hard constraints I should factor in? (technology mandates, regulatory data residency, budget, team skill set)"* |

## Output Discipline

Every output MUST satisfy the four rules below. They operationalise the accountability principles (Bias for Action, Earn Trust, Have Backbone, Deliver Results, Broad Responsibility). Skip a rule only by writing `N/A — [reason]` so the omission is visible.

1. **Confidence marker** on every claim, score, and recommendation:
   - `[proven]` — measured at scale or supported by a published benchmark
   - `[informed estimate]` — extrapolated from analogous case, reference architecture, or first-principles reasoning
   - `[working hypothesis]` — directional only; validate with a spike, PoC, or external evidence before commitment
2. **Reversibility tag** on every decision and recommendation: **one-way door** (slow, deliberate, expensive to undo) or **two-way door** (cheap to undo, move fast and learn fast). Defaults are not neutral — name the door.
3. **Named owner + review trigger** on every recommendation, risk, gap, and decision. Owner is a human role (not a team). Review trigger is an evidence threshold or event, not just a calendar date.
4. **Broad Responsibility line** — one line covering data-in-transit residency, third-party data sharing exposure, contract obligations to downstream consumers, and blast radius into client systems on outage. Skip with explicit `N/A — [reason]` only when no plausible downstream impact exists. Never silent.

## Artifact Selection Guide

Generate the artifacts appropriate to the integration context. Include only what adds analytical value.

### TOGAF Phase C — Application Architecture Artifacts

TOGAF Phase C Application Architecture canonical artefacts include the following (selection from the TOGAF Architecture Content reference). Generate those relevant to scope — do not generate all for every engagement.

**Catalogs:**
| Catalog | When to include | Purpose |
|---------|----------------|---------|
| **Application Portfolio Catalog** | Always | TOGAF standard catalog — hierarchical inventory of all applications: name, description, business purpose, decomposition. Foundation for all matrices and diagrams |
| **Interface Catalog** | Always | TOGAF standard catalog — all interfaces between applications: integration mechanism (batch, API, direct DB, web service), dependency scope, migration cost estimate |

**Matrices:**
| Matrix | When to include | Purpose |
|--------|----------------|---------|
| **Application/Organization Matrix** | When application ownership is in scope | Maps applications to organizational units; identifies support requirements and gaps per unit |
| **Role/Application Matrix** | When access control or security requirements are in scope | Maps applications to business roles; identifies security requirements and access rights |
| **Application/Function Matrix** | When business function coverage is in scope | Maps applications to business functions; supports capability-driven portfolio analysis and gap analysis |
| **Application Interaction Matrix** | Always | TOGAF standard — core application-to-application dependencies; identifies central applications by dependency degree; enables integration complexity estimation |
| **Application/Data Matrix** | When data ownership is in scope | CRUD mapping (Create/Read/Update/Delete) — which applications own which data; master data identification; duplication analysis |

**Diagrams (TOGAF official names — in addition to the integration-focused diagrams below):**
| Diagram | TOGAF name | When to include |
|---------|-----------|----------------|
| **Application Communication Diagram** | TOGAF Phase C | Always — shows application-to-application interactions and information exchange |
| **Application/User Location Diagram** | TOGAF Phase C | When geographic distribution is in scope — maps applications to deployment locations and user geographies |
| **Enterprise Manageability Diagram** | TOGAF Phase C | When operational management tooling is in scope — shows management-class software interactions |
| **Process/Application Realization Diagram** | TOGAF Phase C | When process orchestration is in scope — sequence of events when multiple applications execute a business process |
| **Application Migration Diagram** | TOGAF Phase C | When migration is in scope — flow of application transition from current to target state with dependencies |

### Diagrams (Mermaid)

| Situation | Diagram | Why |
|-----------|---------|-----|
| Always — reviewing integration flows | **Integration topology** (flowchart LR: producer → integration component → consumer, sync vs async edge styles) | Shows coupling topology and synchronous/asynchronous boundary |
| Critical business flow with latency budget | **Sequence diagram** for that flow | Shows time-ordering, latency at each hop, failure points |
| Distributed transaction / saga pattern | **State diagram** (saga compensation flow) | Shows happy path, compensation steps, terminal states |
| Failure and retry path is complex | **Error flow diagram** (flowchart: success path vs retry vs DLQ vs dead-letter) | Makes the failure path as explicit as the success path |
| Event-driven architecture | **Event flow diagram** (flowchart: producer → broker → consumers with event names on edges) | Shows fan-out, consumer groups, event ordering dependencies |
| As-Is topology has significant issues | **As-Is / To-Be topology** (two side-by-side flowcharts) | Makes the proposed change explicit and comparable |

**Mermaid rules:**
- Use `<br>` for line breaks in node labels — never `\n`
- Sync edges: `-->|"REST P99<200ms"` · Async edges: `-.->|"event async"`
- Group producers and consumers in subgraphs — makes blast radius visible
- Label every edge with: protocol, auth mechanism, and latency SLA where known

### Tables

| Table | Always / Conditional | Purpose |
|-------|---------------------|---------|
| **Integration catalog** | Always | Every integration point: name, style, owner, SLA, lifecycle status |
| **Anti-pattern inventory** | Always | Explicit list of EIP anti-patterns found, with severity and remediation |
| **SLO table** | Always | Integration point × success rate SLO × latency P50/P95/P99 |
| **Event catalog** | When event-driven | Event name, producer, schema format, consumers, delivery guarantee |
| **API maturity assessment** | When REST/GraphQL APIs in scope | Richardson level 0–3 per API, with gaps |
| **API deprecation schedule** | When deprecated APIs in scope | Sunset date, affected consumers, migration path |
| **Saga compensation register** | When distributed transactions in scope | Saga steps, compensation action, tested status |
| **Runbook completeness** | When critical integrations in scope | Integration, trigger criteria, runbook exists, last verified |
| **Fix list** | Always | Prioritised, actionable remediation with owner and review trigger |

### Callouts (Obsidian-style)

| Callout | When |
|---------|------|
| `> [!warning]` | Anti-pattern detected; missing reliability mechanism; breaking change risk |
| `> [!important]` | One-way door integration decision; missing idempotency on at-least-once delivery |
| `> [!tip]` | Pattern or commodity tool that eliminates the custom build or simplifies the design |
| `> [!info]` | Cross-reference to related ADR, Phase C-Application doc, or EIP reference |
| `> [!abstract]` | Executive summary — integration health verdict for non-technical stakeholders |

> [!tip]
> **Worked example:** see `references/examples/23.01-integration-architecture.md` for a fully instantiated Phase C Application Architecture review — seven integration points catalogued, all 14 EIP anti-patterns checked (5 found), API maturity scored per Richardson, SLO table with gaps, a sequence diagram showing the KYC timeout mismatch failure scenario, and a prioritised fix list, anchored to the ACME Corp Customer Onboarding engagement.

## EIP Anti-Pattern Checklist

Check every integration against this list. Each hit becomes a row in the Anti-Pattern Inventory. A "not applicable" finding must be stated explicitly — not silently omitted.

| # | Anti-pattern | Check | Risk if present |
|---|-------------|-------|----------------|
| 1 | **Missing Correlation ID** | Every message/request carries a stable correlation ID propagated end-to-end | Incidents become undiagnosable — no way to trace a request across hops |
| 2 | **No Message Expiration** | Messages have a TTL or expiry; expired messages do not trigger processing | Stale messages processed hours/days after expiry; wrong business outcomes |
| 3 | **No Dead Letter Channel** | Failed messages route to a DLQ with monitoring and reprocessing capability | Silent message loss — failures disappear with no alert and no recovery path |
| 4 | **Non-idempotent receiver** | Consumer operations are idempotent (duplicate delivery = same outcome) | At-least-once delivery causes duplicate processing: double charges, double records |
| 5 | **Outbox pattern absent** | For event + database writes: outbox pattern or transactional outbox ensures consistency | Event emitted but database rolled back (or vice versa) — split brain |
| 6 | **Event schema leakage** | Events contain business concepts, not internal DB row representations | Consumer coupling to producer internals — every DB refactor breaks consumers |
| 7 | **Missing event catalog** | All events are documented: name, producer, schema, consumers, delivery guarantee | Consumers subscribe to undocumented events; schema changes break silently |
| 8 | **Timeout misalignment** | Caller timeout > callee timeout (callee times out before caller gives up) | Caller retries while callee is still processing — duplicate execution risk |
| 9 | **No bulkhead isolation** | Slow or failing consumers are isolated; fan-out cannot exhaust shared thread pools | One slow consumer cascades to block all consumers on the same resource |
| 10 | **Saga without compensation** | Each saga step has a documented, tested compensation action | Partial failure leaves the system in an inconsistent state with no recovery path |
| 11 | **Shared database integration** | Services share a database as their integration mechanism | Schema coupling — one service's migration breaks another's queries |
| 12 | **Orchestrator that knows too much** | The orchestrator contains business logic; consumers are dumb executors | Choreography opportunity missed; orchestrator becomes God Object — single point of failure and knowledge |
| 13 | **W3C Trace Context not propagated** | `traceparent` header is propagated across every hop (HTTP, messaging, async) | Distributed traces break at system boundaries — incidents require manual log correlation |
| 14 | **No circuit breaker** | Circuit breaker present on synchronous calls to external/unreliable dependencies | Slow dependency cascades: caller threads pile up, memory exhausts, system-wide outage |

## Assessment Process

### Step 1 — Identify the integration context
- **Style**: REST API / GraphQL / gRPC / async messaging / event streaming / batch file / hybrid
- **Topology**: point-to-point / API gateway / event broker / ESB / service mesh / hybrid
- **Interaction patterns**: request-response / fire-and-forget / pub-sub / event sourcing / CQRS / saga
- **Scale**: approximate number of integration points, peak message volumes, latency requirements, consumer count

### Step 2 — Build the integration catalog
For every integration point in scope, one row. Missing rows = unknown integrations = unmanaged risk.

### Step 3 — Run the EIP anti-pattern checklist
Check all 14 patterns. Every hit gets a row in the Anti-Pattern Inventory with severity (Critical / High / Medium / Low) and remediation action.

### Step 4 — Assess API maturity (for REST/GraphQL APIs)
Score each API against the Richardson Maturity Model:
- **Level 0** — Single URI, HTTP as tunnel (RPC over HTTP)
- **Level 1** — Individual resource URIs; no HTTP method semantics
- **Level 2** — HTTP verbs used correctly; status codes meaningful
- **Level 3** — HATEOAS: hypermedia controls guide client navigation

Check OpenAPI spec completeness: deprecated fields marked with sunset timeline, breaking vs non-breaking change rules documented, versioning strategy explicit (URL path / header / content negotiation). Check whether consumer-driven contract tests (e.g., Pact) exist for critical APIs.

### Step 5 — Assess reliability engineering
Beyond pattern presence, check the reliability stack is complete:

| Layer | What to check |
|-------|--------------|
| **Timeout hierarchy** | Caller timeout > callee timeout? (Should be: callee timeout < caller timeout to allow callee to fail before caller gives up) |
| **Retry budget** | Is max retry count + backoff policy defined? Is jitter applied to prevent thundering herd? |
| **Bulkhead** | Are consumers isolated from each other's failures? Is thread pool / connection pool partitioned by integration group? |
| **Circuit breaker** | Present on all synchronous calls to external or unreliable dependencies? What are the open/half-open/closed thresholds? |
| **Backpressure** | For async: does the consumer signal slowness to the producer? Is there a flow-control mechanism? |
| **Exactly-once vs at-least-once** | Is the delivery semantic correct for the business requirement? Is the cost (latency, complexity) of exactly-once justified? |

### Step 6 — Assess observability baseline
Check beyond "we have distributed tracing":
- **W3C Trace Context**: is `traceparent` / `tracestate` propagated across every hop — HTTP, messaging, async boundaries?
- **Correlation ID**: is a stable business correlation ID (e.g., order ID, transaction ID) propagated independently of trace IDs?
- **Integration health metrics**: throughput (messages/sec), error rate (%), latency P50/P95/P99, DLQ depth, consumer lag (for queues/streams)
- **SLOs defined**: is there a success rate SLO and a latency SLO per integration point? Are burn-rate alerts configured?
- **Runbook coverage**: for each critical integration — does a runbook exist with trigger criteria, diagnostic commands, escalation path, and rollback steps?

### Step 7 — Assess event catalog (event-driven architectures only)
- Are all events documented: name, producer, schema format (Avro/Protobuf/JSON Schema), version, consumers, delivery guarantee?
- Are schemas stored in a schema registry?
- Is schema evolution governed (backward/forward compatible changes vs breaking changes)?
- Are business events expressed as domain events (OrderPlaced) or as CRUD events (OrderUpdated)? The latter is an anti-pattern.

### Step 8 — Assess topology fitness
Is the chosen topology appropriate for the coupling requirements and operational maturity of the team? Key questions:
- What is the blast radius if the integration layer (gateway, broker, ESB) fails?
- What is the evolution path as the number of producers and consumers grows?
- Is the team operationally ready for the chosen topology (event mesh requires more runbook sophistication than REST gateway)?

### Step 9 — Apply commoditisation check
Flag every integration component being custom-built where a commodity product exists.

### Step 10 — Produce the fix list
Prioritise: Critical (blocking) → High (must fix before next release) → Medium → Low. Every item has an owner (role), reversibility tag, and review trigger.

## Output Format

```
## Verdict: Sound | Needs Work | Redesign

> [!abstract]
> [3 sentences for non-technical stakeholders: integration health status, the most critical gap, and the business consequence of not addressing it.]

---

## Integration Catalog

| ID | Name | Style | Topology | Producer | Consumer | Data classification | SLA (latency / availability) | Lifecycle | Owner (role) |
|----|------|-------|----------|---------|---------|---------------------|------------------------------|-----------|-------------|
| INT-001 | [name] | REST / GraphQL / gRPC / async / batch | Point-to-point / Gateway / Broker / Mesh | [system] | [system] | Public / Internal / Confidential | [P99 ms / % uptime] | Active / Deprecated / EOL | [role] |

---

## Integration Topology

```mermaid
flowchart LR
    subgraph Producers["Producers"]
        p1["[Producer 1]"]
    end
    subgraph IntLayer["Integration Layer"]
        gw["[Gateway / Broker / ESB]"]
    end
    subgraph Consumers["Consumers"]
        c1["[Consumer 1]"]
        c2["[Consumer 2]"]
    end
    p1 -->|"REST<br>OAuth2<br>P99<200ms"| gw
    gw -.->|"event async<br>at-least-once"| c1
    gw -.->|"event async"| c2
```

[Sequence diagram for the most critical business flow — latency budget per hop, failure points annotated]

```mermaid
sequenceDiagram
    participant A as [System A]
    participant B as [System B]
    participant C as [System C]
    A->>B: [request + protocol]
    Note over A,B: Timeout: [Xms] / Retry: [N×, backoff]
    B->>C: [request]
    C-->>B: [response]
    B-->>A: [response]
```

---

## Integration Quality Attribute Assessment

| Attribute | Finding | Evidence status | Confidence | Severity |
|-----------|---------|----------------|------------|----------|
| Contract Stability | [versioning strategy, schema governance, consumer contracts] | tested / asserted / not assessed | proven / informed estimate / working hypothesis | Critical / High / Medium / Low |
| Decoupling | [coupling degree, choreography vs orchestration, blast radius] | tested / asserted / not assessed | ... | Critical / High / Medium / Low |
| Reliability | [retry, idempotency, DLQ, circuit breaker, delivery semantics, timeout hierarchy] | tested / asserted / not assessed | ... | Critical / High / Medium / Low |
| Security | [authn/authz, input validation, rate limiting, data in transit, mTLS/OAuth2] | tested / asserted / not assessed | ... | Critical / High / Medium / Low |
| Observability | [W3C trace propagation, correlation IDs, metrics, SLOs, runbook coverage] | tested / asserted / not assessed | ... | Critical / High / Medium / Low |
| Scalability | [throughput headroom, backpressure, fan-out, bulkhead isolation] | tested / asserted / not assessed | ... | Critical / High / Medium / Low |

> [!warning] Critical findings
> [List any Critical-severity findings here so they cannot be missed by a steerco reader.]

---

## Anti-Pattern Inventory

| # | Anti-pattern | Location | Business risk | Severity | Remediation | Owner (role) |
|---|-------------|---------|--------------|----------|------------|-------------|
| 1 | [pattern from checklist] | [INT-ID or component name] | [what goes wrong in production] | Critical / High / Medium / Low | [specific fix] | [role] |

> [!important]
> [Flag any anti-pattern with Severity = Critical — these require remediation before the next production deployment.]

---

## SLO Table

| Integration point | Success rate SLO | Latency P50 | Latency P95 | Latency P99 | DLQ depth alert | Consumer lag alert | Evidence status |
|------------------|-----------------|------------|------------|------------|----------------|-------------------|----------------|
| INT-001 | [%] | [ms] | [ms] | [ms] | [threshold] | [threshold] | tested / asserted / not assessed |

[If SLOs are absent: flag each integration point as a gap — an integration point without a defined SLO is an unmanaged dependency.]

---

## API Maturity Assessment *(REST/GraphQL APIs only)*

| API | Richardson Level (0–3) | OpenAPI spec complete | Consumer-driven contracts | Versioning strategy | Breaking change rules | Confidence |
|-----|----------------------|----------------------|--------------------------|--------------------|-----------------------|------------|
| [API name] | 0 / 1 / 2 / 3 | Yes / Partial / No | Pact / None | URL / Header / Content-neg | Documented / Absent | proven / informed estimate / working hypothesis |

> [!tip]
> [Flag any API at Level 0 or 1 with production consumers — this is a contract fragility risk that grows non-linearly with consumer count.]

---

## API Deprecation Schedule *(when deprecated APIs in scope)*

| API | Current version | Sunset date | Affected consumers | Migration path | Owner (role) |
|-----|----------------|------------|-------------------|---------------|-------------|
| [name] | [vX] | [YYYY-MM-DD — minimum 24 months from deprecation announcement] | [systems/teams] | [migration guidance] | [role] |

---

## Event Catalog *(event-driven architectures only)*

| Event | Producer | Schema format | Schema registry | Consumers | Delivery guarantee | Domain event? | Version | Owner (role) |
|-------|---------|--------------|----------------|---------|-------------------|--------------|---------|-------------|
| [EventName] | [system] | Avro / Protobuf / JSON Schema | Yes / No | [systems] | At-least-once / Exactly-once / At-most-once | Yes / No (CRUD event) | [vX] | [role] |

> [!warning]
> [Flag any event that is a CRUD event (e.g., OrderUpdated with full entity payload) — this is schema leakage. Business events (OrderPlaced, PaymentFailed) are the correct pattern.]

---

## Saga Compensation Register *(distributed transactions only)*

| Saga | Step | Action | Compensation action | Compensation tested | Owner (role) |
|------|------|--------|--------------------|--------------------|-------------|
| [saga name] | 1 | [forward action] | [rollback action] | Yes / No | [role] |

```mermaid
stateDiagram-v2
    [*] --> Step1
    Step1 --> Step2: success
    Step2 --> Step3: success
    Step3 --> [*]: complete
    Step3 --> CompensateStep2: failure
    CompensateStep2 --> CompensateStep1: compensated
    CompensateStep1 --> [*]: rolled back
```

---

## Topology Assessment

**Chosen topology:** [name]
**Fitness verdict:** Appropriate / Marginal / Misfit — [rationale tied to coupling requirements and team operational maturity]
**Blast radius:** [what fails and what is affected if the integration layer (gateway, broker) goes down]
**Evolution path:** [what happens to this topology as producer and consumer count doubles — does it scale or does it become an ESB God Object?]

---

## Runbook Completeness

| Integration | Criticality | Runbook exists | Trigger criteria defined | Diagnostic commands present | Rollback steps defined | Last verified |
|------------|------------|---------------|------------------------|---------------------------|----------------------|--------------|
| INT-001 | High / Medium / Low | Yes / No | Yes / No | Yes / No | Yes / No | [date or Never] |

> [!warning]
> [Flag any High-criticality integration with no runbook or last-verified > 6 months — this is an operational gap that will cause extended incident duration.]

---

## Commoditisation Check

[Any integration component being custom-built where a commodity product exists. One line per flag: component, what is being built, commodity alternative, exit trigger.]

---

## Disruptive Alternative

[One integration style or topology that challenges the current approach — working backwards from the business interaction that needs to happen. Confidence: proven / informed estimate / working hypothesis.]

---

## Second-Order Effect

[One non-obvious downstream consequence of this integration design — the blocked evolution path, the operational burden added, the data consistency issue introduced, the consumer that will break silently when this contract changes.]

---

## Horizon Alignment

**H1 — Immediate:** [reliability gaps and coupling risks requiring action now — named owner per item]
**H2 — Emerging:** [contract governance maturity and decoupling work for 12–24 months]
**H3 — Structural:** [event mesh, API platform, federated topology — what the current design enables or forecloses]

---

## TOGAF Context *(TOGAF mode only)*

**ADM phase:** C (Application Architecture) / D (Technology Architecture)
**Impacted building blocks:** [list]

---

## Fix List

| # | Severity | Finding | Fix | Owner (role) | Reversibility | Review trigger |
|---|----------|---------|-----|--------------|---------------|----------------|
| 1 | Critical | [finding] | [specific action] | [role] | one-way / two-way | [evidence threshold or event] |
| 2 | High | ... | ... | [role] | one-way / two-way | ... |
| 3 | Medium | ... | ... | [role] | one-way / two-way | ... |

---

## Broad Responsibility

[One line covering: data-in-transit residency and cross-border transfer obligations · third-party data sharing and data processor responsibilities · SLA/contract exposure to downstream consumers · blast radius into client and customers-of-customers systems on outage · environmental cost of synchronous chatty patterns at scale. `N/A — [reason]` only if none plausibly applies.]

---

## Standards Bar

Does this meet the bar for a client deliverable? [Yes / No — reason]
```

## Next Step

After completing a Phase C Application Architecture:

- **Forward — Phase D**: invoke `technology-architecture` to develop the Technology Architecture that hosts the integration layer.
- **Forward — Gap Analysis**: invoke `gap-analysis` to produce the Application Architecture gap map for the Architecture Roadmap.
- **Back — shared contracts**: if data contracts between the integration layer and consumers need alignment, return to `data-architecture` to resolve schema ownership and master data topology first.
- **Validate — Chief architect review**: invoke `architecture-review` before Architecture Board submission for an opinionated critique of the integration design.
- **Validate — Risk assessment**: invoke `risk-radar` to surface reliability, security, and integration coupling risks before the design is locked.
- **Validate — Principles alignment**: invoke `principles-check` to verify the integration design respects Application Architecture Principles (API-first, event-driven, consumer-driven contract).
- **Validate — Artifact completeness**: invoke `artifact-completeness` to check the Phase C Application ADD section — Application Portfolio Catalog, Interface Catalog, Application Interaction Diagram all required. See `references/togaf-content-framework.md` for the full Phase C Application artefact inventory.
- **Document integration decisions**: invoke `adr-generator` for decisions on integration pattern (sync REST vs async event vs ESB), API gateway selection, or consumer-driven contract testing approach.
- **Validate compliance**: invoke `compliance-review` if the integration layer handles regulated data flows or crosses security trust boundaries requiring Architecture Board sign-off.

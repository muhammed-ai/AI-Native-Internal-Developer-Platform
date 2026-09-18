# Incident response

> Status: **PLANNED**. Describes the intended process and where the Incident Agent fits.

## 1. Objectives

- Detect, triage, and resolve service degradation quickly.
- Keep a clear, auditable timeline.
- Use AI assistance to correlate signals — never to take unattended action.

## 2. Severity levels

| Severity | Definition | Target response |
| --- | --- | --- |
| SEV1 | Customer-facing outage or data risk | Immediate |
| SEV2 | Major degradation, no full outage | < 30 min |
| SEV3 | Minor / partial impact | Next business day |

## 3. Signal sources

- Metrics: Prometheus / Azure Monitor
- Logs: cluster + application logs
- Traces: OpenTelemetry
- Delivery state: Argo CD sync/health
- CI state: GitHub Actions run history

## 4. Flow

```
Alert fires
   → On-call acknowledges
   → Incident Agent correlates metrics + logs + alerts + deploy state
   → Agent produces an incident summary + suggested investigation steps
   → Human validates, mitigates, and records the timeline
   → Postmortem + ADR if an architectural change is needed
```

## 5. Incident Agent role

The Incident Agent **analyzes and summarizes**; it does not remediate on its own.
It reads metrics, logs, alerts, and recent deployment history to produce a summary
and suggested next steps. All actions require human approval. See
[`agents/incident-agent/`](../agents/incident-agent/).

## 6. Postmortems

Blameless. Capture timeline, impact, root cause, and follow-up actions. If the
fix changes architecture, record an ADR under `docs/decisions/`.

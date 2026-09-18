# Incident Agent

> Status: **PLANNED**. Interface and boundaries only. No implementation.

## Responsibility

During an incident, correlate operational signals into a clear summary and suggest
investigation steps. It assists responders; it does not remediate.

## Reads (tools, read-scoped)

- Metrics (Prometheus / Azure Monitor)
- Logs (cluster + application)
- Alerts (alertmanager / cloud alerts)
- Recent deployment history (Argo CD, GitHub Actions)

## Produces

- Incident summary (what changed, blast radius, correlated signals)
- Suggested investigation steps
- A candidate timeline for the postmortem

## Permissions / boundaries

- Read-only access to observability and delivery-history APIs.
- **No** ability to scale, restart, roll back, or silence alerts.
- All suggested actions require human execution and approval.

## Interface (planned)

```
summarize_incident(alert_id: str) -> IncidentSummary
```

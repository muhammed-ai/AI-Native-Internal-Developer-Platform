# Deployment Agent

> Status: **PLANNED**. Interface and boundaries only. No implementation.

## Responsibility

Diagnose failed or degraded deployments and suggest remediation. Reasons over real
delivery signals; never acts on the cluster itself.

## Reads (tools, read-scoped)

- GitHub Actions: workflow run status, logs, job/step failures
- Argo CD: application sync status and health
- Kubernetes: events, pod status, container logs (read-only ServiceAccount)

## Produces

- Likely root cause of a failed deploy
- Ranked, human-actionable remediation suggestions
- Links to the evidence used (run IDs, resource names)

## Permissions / boundaries

- Least-privilege, read-only credentials for GitHub, Argo CD, and Kubernetes.
- **No** `kubectl apply`, no Argo CD sync, no workflow re-runs. Suggestions only.
- Human approval required before any suggested action is taken.

## Interface (planned)

```
analyze_deployment(app: str, environment: str) -> DeploymentDiagnosis
```

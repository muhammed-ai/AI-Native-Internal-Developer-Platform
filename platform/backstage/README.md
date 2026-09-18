# Backstage — Internal Developer Portal

> Status: **PLANNED** (Phase 7). This directory documents the intended integration
> architecture. No Backstage app is scaffolded yet — the polished UI is deliberately
> deferred (see [ADR 0001](../../docs/decisions/0001-use-backstage-for-idp.md)).

## What the portal will provide

A single self-service surface where a developer can:

- Discover services (software catalog)
- Create a new service from a golden-path template (scaffolder)
- View ownership and team information
- Read docs (TechDocs)
- Reach CI/CD (GitHub Actions)
- Reach deployments (Argo CD)
- View Kubernetes information
- View observability (Grafana)
- View security posture (scan results, SBOMs)

## Integration architecture

| Portal capability | Backend integration | Data source | Status |
| --- | --- | --- | --- |
| Software catalog | `catalog-info.yaml` per repo | GitHub | PLANNED |
| Service scaffolding | Backstage Scaffolder + templates | This repo's templates | PLANNED |
| Docs | TechDocs | `docs/` (MkDocs) | PLANNED |
| CI/CD view | GitHub Actions plugin | GitHub API | PLANNED |
| Deployments | Argo CD plugin | Argo CD API | PLANNED |
| Kubernetes | Kubernetes plugin | Cluster API (read-only SA) | PLANNED |
| Observability | Grafana plugin | Grafana | PLANNED |
| Security | Custom/plugin | Trivy/CodeQL/SBOM outputs | PLANNED |

## Golden-path templates (planned)

Scaffolder templates will generate a new service pre-wired with: a repo skeleton,
`catalog-info.yaml`, a CI workflow from `.github/workflows/`, Kubernetes manifests
under `kubernetes/applications/`, and an Argo CD `Application`.

## Files

- [`catalog-info.yaml`](catalog-info.yaml) — example catalog entry for this platform component.

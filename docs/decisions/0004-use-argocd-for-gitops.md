# 0004. Use Argo CD for GitOps delivery

- **Status:** Accepted
- **Date:** 2026-09-17
- **Deciders:** Platform engineering

## Context

Deployments should be declarative, auditable, and driven from Git rather than
imperative `kubectl apply` from CI. We want drift detection and a clear
"Git is the source of truth" model.

## Decision

Use Argo CD as the GitOps engine. `argocd/projects/` define trust boundaries and
`argocd/applications/` bind Git sources to target clusters/namespaces.

## Consequences

- Positive: continuous reconciliation, drift detection, clear audit trail.
- Positive: Argo CD becomes the only actor that writes to clusters (tightens the security model).
- Trade-off: another control-plane component to run; acceptable for the value.

## Alternatives considered

- Flux — equally valid; Argo CD chosen for its UI and app-of-apps ergonomics in a demo.
- CI-push (`kubectl` from Actions) — no drift detection, weaker audit, broader CI credentials.

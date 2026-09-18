# 0003. Use Kubernetes as the runtime platform

- **Status:** Accepted
- **Date:** 2026-09-17
- **Deciders:** Platform engineering

## Context

The platform needs a portable, declarative runtime that works consistently
locally and across three managed clouds (AKS, EKS, GKE).

## Decision

Use Kubernetes as the core runtime. Locally we run Kind/Minikube; in the cloud we
use the managed offerings. Manifests use a Kustomize `base` + `overlays` model so
environment and cloud specifics stay separated.

## Consequences

- Positive: identical workload model locally and in every cloud.
- Positive: rich ecosystem for GitOps, policy, and observability.
- Trade-off: operational complexity; mitigated by managed control planes and GitOps.

## Alternatives considered

- Serverless (Container Apps / Fargate / Cloud Run) — simpler, but less portable and
  weaker fit for demonstrating platform engineering depth.

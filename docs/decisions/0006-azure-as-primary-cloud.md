# 0006. Azure as the primary cloud

- **Status:** Accepted
- **Date:** 2026-09-17
- **Deciders:** Platform engineering

## Context

The platform demonstrates multi-cloud capability but should have one deeply
implemented primary cloud to avoid shallow, breadth-only coverage. AWS
demonstrates portability; GCP demonstrates foundational reach.

## Decision

Azure is the primary cloud (AKS, ACR, Key Vault, Azure Monitor, managed
identities, RBAC). AWS (EKS, ECR, IAM, VPC, Secrets Manager) is the secondary
portability target. GCP (GKE, Artifact Registry, IAM, VPC, Secret Manager) stays
intentionally lightweight.

## Consequences

- Positive: one cloud gets production-depth treatment; the modular Terraform layout
  keeps the others isolated and optional.
- Trade-off: three provider integrations to maintain; mitigated by only building what is demonstrated.
- Rule: do not create three-cloud infrastructure merely to show three clouds.

## Alternatives considered

- AWS-primary — equally reasonable; Azure chosen deliberately for this portfolio.
- Single-cloud — would not demonstrate the multi-cloud architecture goal.

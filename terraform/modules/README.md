# Terraform modules

Reusable building blocks consumed by the per-cloud stacks. Each module is
self-contained with `variables.tf`, `main.tf`, and `outputs.tf`, and documents
its inputs/outputs.

> Status: **PLANNED**. Module contracts are described here; implementations land
> in later phases (Phase 2+).

## Intended modules

| Module | Responsibility | Consumed by |
| --- | --- | --- |
| `network` | VNet/VPC, subnets, private networking | all clouds |
| `kubernetes-cluster` | Managed cluster (AKS/EKS/GKE) | all clouds |
| `container-registry` | ACR / ECR / Artifact Registry | all clouds |
| `secrets` | Key Vault / Secrets Manager / Secret Manager | all clouds |
| `identity` | Managed identity / IAM roles / Workload Identity | all clouds |
| `observability` | Metrics/log sinks and exporters | all clouds |

## Rules

- Modules take explicit inputs and expose explicit outputs — no hidden globals.
- Provider configuration is passed in by the calling stack, not hardcoded.
- Keep modules small and composable; prefer several focused modules over one large one.

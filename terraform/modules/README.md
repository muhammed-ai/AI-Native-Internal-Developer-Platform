# Terraform modules

Reusable building blocks consumed by the per-cloud stacks. Each module is
self-contained with `variables.tf`, `main.tf`, and `outputs.tf`, and documents
its inputs/outputs.

> Status: **IMPLEMENTED** for the Azure foundation (Phase 2). AWS/GCP consumers
> land in later phases.

## Modules

| Module | Responsibility | Status |
| --- | --- | --- |
| `network` | VNet + AKS subnet | IMPLEMENTED |
| `identity` | User-assigned managed identity + OIDC federated credentials | IMPLEMENTED |
| `container-registry` | Azure Container Registry (admin disabled, RBAC pull) | IMPLEMENTED |
| `key-vault` | Key Vault with RBAC authorization + secure defaults | IMPLEMENTED |
| `aks` | AKS cluster (workload identity, Azure RBAC, autoscaling, cost-aware) | IMPLEMENTED |
| `observability` | Metrics/log sinks and exporters | PLANNED |

## Rules

- Modules take explicit inputs and expose explicit outputs — no hidden globals.
- Provider configuration is passed in by the calling stack, not hardcoded.
- Keep modules small and composable; prefer several focused modules over one large one.

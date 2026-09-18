# Terraform

> Status: **Azure stack IMPLEMENTED** (Phase 2) — modules + `terraform/azure`
> validate cleanly with `terraform validate`. **Not applied**; no cloud resources
> exist. AWS and GCP stacks remain **PLANNED** (Phase 12).

## Layout

```
terraform/
├── modules/     Reusable, cloud-agnostic-ish building blocks (network, cluster, registry, ...)
├── azure/       Primary cloud stack (AKS, ACR, Key Vault, ...)
├── aws/         Secondary cloud stack (EKS, ECR, IAM, VPC, ...)
└── gcp/         Foundational cloud stack (GKE, Artifact Registry, ...)
```

Per-cloud stacks **consume** modules from `modules/`. Cloud stacks never depend on
each other — this keeps each cloud isolated and independently destroyable
(see [ADR 0002](../docs/decisions/0002-use-terraform-for-iac.md) and
[ADR 0006](../docs/decisions/0006-azure-as-primary-cloud.md)).

## Conventions

- `terraform fmt -recursive` before commit; CI enforces `fmt -check`.
- Every stack has `versions.tf` pinning Terraform and provider versions.
- Remote, locked, versioned state backend per stack. **State is never committed.**
- No secrets in `.tf` or `.tfvars`. Use `*.example.tfvars` for shapes; real
  values come from a vault or CI secrets. `.gitignore` blocks `*.tfvars` and state.
- Cloud auth via OIDC federation from GitHub Actions — no static keys.

## Cost control

- Nothing here provisions resources automatically.
- Cloud stacks are opt-in and intended to be applied for a demo, then destroyed.
- Local development does not require any cloud (see the developer guide).

## Local validation (safe, no cloud)

```bash
terraform fmt -check -recursive terraform/
terraform -chdir=terraform/azure init -backend=false
terraform -chdir=terraform/azure validate
```

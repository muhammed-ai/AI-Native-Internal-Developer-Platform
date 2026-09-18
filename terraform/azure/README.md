# Azure stack (primary)

> Status: **IMPLEMENTED** (Phase 2). Fully wired, validated with
> `terraform validate`. **Not applied** — no cloud resources exist.

Azure is the primary cloud. This stack composes the reusable modules into the
platform's Azure foundation:

- Resource group
- Networking (`network` module) — VNet + AKS subnet
- Platform managed identity (`identity`) — optional GitHub OIDC federation
- Azure Container Registry (`container-registry`) — admin disabled, RBAC pull
- Key Vault (`key-vault`) — RBAC authorization, secure defaults
- AKS (`aks`) — workload identity, Azure RBAC, autoscaling, cost-aware sizing

Authentication uses OIDC federation (no static credentials). State lives in a
remote, locked `azurerm` backend supplied via `-backend-config` and never committed.

## Files

| File | Purpose |
| --- | --- |
| `versions.tf` | Terraform + provider version pins |
| `providers.tf` | Provider config + backend (partial, OIDC) |
| `variables.tf` | Stack inputs |
| `main.tf` | Composes the modules |
| `outputs.tf` | Stack outputs |
| `example.tfvars` | Example values (copy to a git-ignored real tfvars) |

## Usage (against a real subscription — not done in this repo)

```bash
# Local validation only (no cloud, no state):
terraform -chdir=terraform/azure init -backend=false
terraform -chdir=terraform/azure validate

# Real plan (requires Azure auth + backend config; creates NO resources until apply):
terraform -chdir=terraform/azure init -backend-config=... 
terraform -chdir=terraform/azure plan -var-file=my.tfvars
```

## Cost control

Defaults are deliberately small (Standard_B2s nodes, min 1 / max 2, Basic ACR).
Nothing runs until you `apply`, and the stack is designed to be destroyed after a
demo.

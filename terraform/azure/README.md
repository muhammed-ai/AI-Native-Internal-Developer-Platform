# Azure stack (primary)

> Status: **PLANNED** (Phase 2). Only `versions.tf` exists. No resources are defined.

Azure is the primary cloud. This stack will provision, via reusable modules:

- AKS (Kubernetes)
- Azure Container Registry (ACR)
- Azure Key Vault (secrets)
- Managed identities + RBAC
- Networking (VNet/subnets, private endpoints)
- Azure Monitor hooks where appropriate

Authentication uses OIDC federation from GitHub Actions — no static credentials.
State lives in a remote, locked backend (never committed).

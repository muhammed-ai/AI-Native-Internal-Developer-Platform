# Module: container-registry (ACR)

> Status: **IMPLEMENTED** (Phase 2). Not applied to any cloud.

Creates an Azure Container Registry with the admin account **disabled** (no shared
static credentials) and optional `AcrPull` role assignments for consuming
identities such as the AKS kubelet identity.

## Inputs

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string | — | ACR name (5-50 alphanumeric, no hyphens, globally unique) |
| `resource_group_name` | string | — | Target resource group |
| `location` | string | — | Azure region |
| `sku` | string | `Basic` | `Basic` / `Standard` / `Premium` |
| `acr_pull_principal_ids` | list(string) | `[]` | Principals granted `AcrPull` |
| `tags` | map(string) | `{}` | Resource tags |

## Outputs

| Name | Description |
| --- | --- |
| `id` | Registry resource ID |
| `name` | Registry name |
| `login_server` | Login server host |

## Security notes

- `admin_enabled = false` — authenticate via Entra ID / managed identity + RBAC.
- Image pulls are authorized with `AcrPull`, not registry passwords.

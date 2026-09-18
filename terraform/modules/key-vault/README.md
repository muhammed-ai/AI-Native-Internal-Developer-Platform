# Module: key-vault

> Status: **IMPLEMENTED** (Phase 2). Not applied to any cloud.

Creates an Azure Key Vault using **RBAC authorization** (not legacy access
policies), with secure defaults: purge protection on, soft-delete retention, and
network ACLs that bypass Azure services. Grants `Key Vault Secrets User` to
supplied principals.

## Inputs

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string | — | Vault name (3-24 chars, globally unique) |
| `resource_group_name` | string | — | Target resource group |
| `location` | string | — | Azure region |
| `sku_name` | string | `standard` | `standard` / `premium` |
| `purge_protection_enabled` | bool | `true` | Purge protection |
| `soft_delete_retention_days` | number | `7` | Retention days (7-90) |
| `public_network_access_enabled` | bool | `true` | Public network access |
| `network_default_action` | string | `Allow` | `Allow` / `Deny` |
| `secrets_user_principal_ids` | list(string) | `[]` | Principals granted secret read |
| `tags` | map(string) | `{}` | Resource tags |

## Outputs

| Name | Description |
| --- | --- |
| `id` | Vault resource ID |
| `name` | Vault name |
| `vault_uri` | Vault URI |

## Security notes

- `enable_rbac_authorization = true` — data-plane access is via Azure RBAC roles.
- No secrets are created by this module; it provisions the vault and access only.

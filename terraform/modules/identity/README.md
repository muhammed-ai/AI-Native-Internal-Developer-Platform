# Module: identity

> Status: **IMPLEMENTED** (Phase 2). Not applied to any cloud.

Creates a user-assigned managed identity and, optionally, OIDC federated
credentials for keyless authentication (GitHub Actions or Kubernetes workload
identity). No client secrets are ever created or stored.

## Inputs

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string | — | Base name for the identity |
| `resource_group_name` | string | — | Target resource group |
| `location` | string | — | Azure region |
| `federated_credentials` | map(object) | `{}` | OIDC federated credentials (issuer/subject/audience) |
| `tags` | map(string) | `{}` | Resource tags |

## Outputs

| Name | Description |
| --- | --- |
| `id` | Managed identity resource ID |
| `principal_id` | Principal ID (for role assignments) |
| `client_id` | Client ID |

## Example federated credential

```hcl
federated_credentials = {
  github-actions = {
    issuer  = "https://token.actions.githubusercontent.com"
    subject = "repo:muhammed-ai/AI-Native-Internal-Developer-Platform:ref:refs/heads/main"
  }
}
```

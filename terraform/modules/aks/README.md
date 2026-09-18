# Module: aks

> Status: **IMPLEMENTED** (Phase 2). Not applied to any cloud.

Provisions an AKS cluster with security-forward defaults and cost-aware sizing.

## Highlights

- System-assigned identity; **local accounts disabled**; Entra ID + Azure RBAC.
- **Workload Identity** and OIDC issuer enabled (pods use federated creds, not secrets).
- Azure CNI with Azure network policy, node pool placed in a supplied subnet.
- Autoscaling system pool, small VM size, small disk — cheap to run for a demo.
- Optional `AcrPull` grant to the kubelet identity when an `acr_id` is supplied.

## Inputs

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string | — | Base name |
| `resource_group_name` | string | — | Target resource group |
| `location` | string | — | Azure region |
| `subnet_id` | string | — | Node pool subnet (from `network` module) |
| `tenant_id` | string | — | Entra ID tenant ID for Azure RBAC |
| `kubernetes_version` | string | `null` | Control-plane version (null = Azure default) |
| `node_vm_size` | string | `Standard_B2s` | Node VM size |
| `node_min_count` | number | `1` | Autoscaler min |
| `node_max_count` | number | `2` | Autoscaler max |
| `os_disk_size_gb` | number | `32` | Node OS disk size |
| `acr_id` | string | `null` | Optional ACR to grant `AcrPull` |
| `tags` | map(string) | `{}` | Resource tags |

## Outputs

| Name | Description |
| --- | --- |
| `cluster_name` | Cluster name |
| `cluster_id` | Cluster resource ID |
| `oidc_issuer_url` | OIDC issuer URL |
| `kubelet_identity_object_id` | Kubelet identity object ID |
| `kube_config_raw` | Raw kubeconfig (sensitive) |

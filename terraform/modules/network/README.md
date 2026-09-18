# Module: network

> Status: **IMPLEMENTED** (Phase 2). Not applied to any cloud.

Creates a virtual network and an AKS node subnet.

## Inputs

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string | — | Base name for network resources |
| `resource_group_name` | string | — | Target resource group |
| `location` | string | — | Azure region |
| `vnet_address_space` | list(string) | `["10.20.0.0/16"]` | VNet address space |
| `aks_subnet_prefixes` | list(string) | `["10.20.1.0/24"]` | AKS subnet prefixes |
| `tags` | map(string) | `{}` | Resource tags |

## Outputs

| Name | Description |
| --- | --- |
| `vnet_id` | Virtual network ID |
| `vnet_name` | Virtual network name |
| `aks_subnet_id` | AKS node subnet ID |

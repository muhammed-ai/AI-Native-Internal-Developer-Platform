# Module: kubernetes-cluster (example contract)

> Status: **PLANNED**. Contract only — no resources implemented.

A reference module showing the intended contract style for this repo. The calling
per-cloud stack supplies the provider and maps these generic inputs onto AKS, EKS,
or GKE resources.

## Inputs

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string | — | Cluster name |
| `region` | string | — | Region/location |
| `node_count` | number | `1` | Initial node count (kept small for cost) |
| `tags` | map(string) | `{}` | Common tags/labels |

## Outputs (planned)

| Name | Description |
| --- | --- |
| `cluster_name` | Provisioned cluster name |
| `kube_endpoint` | API server endpoint (sensitive) |

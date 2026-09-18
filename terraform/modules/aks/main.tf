resource "azurerm_kubernetes_cluster" "this" {
  name                = "aks-${var.name}"
  resource_group_name = var.resource_group_name
  location            = var.location
  dns_prefix          = var.name

  # Pin the control-plane version explicitly for reproducibility. When null,
  # Azure selects a default (kept optional so validation stays simple).
  kubernetes_version = var.kubernetes_version

  # Cost control: keep it small and let it scale within tight bounds.
  default_node_pool {
    name                 = "system"
    vm_size              = var.node_vm_size
    vnet_subnet_id       = var.subnet_id
    auto_scaling_enabled = true
    min_count            = var.node_min_count
    max_count            = var.node_max_count
    os_disk_size_gb      = var.os_disk_size_gb
    orchestrator_version = var.kubernetes_version
  }

  # System-assigned identity for the control plane.
  identity {
    type = "SystemAssigned"
  }

  # Entra ID integration with Kubernetes RBAC (no local admin accounts).
  azure_active_directory_role_based_access_control {
    azure_rbac_enabled = true
    tenant_id          = var.tenant_id
  }
  local_account_disabled = true

  # Workload Identity + OIDC issuer so pods use federated credentials, not secrets.
  oidc_issuer_enabled       = true
  workload_identity_enabled = true

  network_profile {
    network_plugin = "azure"
    network_policy = "azure"
  }

  tags = var.tags
}

# Allow the cluster's kubelet identity to pull from a registry, if provided.
resource "azurerm_role_assignment" "acr_pull" {
  count = var.acr_id == null ? 0 : 1

  scope                            = var.acr_id
  role_definition_name             = "AcrPull"
  principal_id                     = azurerm_kubernetes_cluster.this.kubelet_identity[0].object_id
  skip_service_principal_aad_check = true
}

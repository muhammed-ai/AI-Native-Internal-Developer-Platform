output "resource_group_name" {
  description = "Name of the platform resource group."
  value       = azurerm_resource_group.this.name
}

output "acr_login_server" {
  description = "ACR login server host."
  value       = module.container_registry.login_server
}

output "key_vault_uri" {
  description = "Key Vault URI."
  value       = module.key_vault.vault_uri
}

output "aks_cluster_name" {
  description = "AKS cluster name."
  value       = module.aks.cluster_name
}

output "aks_oidc_issuer_url" {
  description = "AKS OIDC issuer URL (for workload identity)."
  value       = module.aks.oidc_issuer_url
}

output "platform_identity_client_id" {
  description = "Client ID of the platform managed identity."
  value       = module.identity.client_id
}

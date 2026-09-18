data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = var.sku_name

  # Use Azure RBAC for data-plane authorization instead of legacy access policies.
  rbac_authorization_enabled = true

  # Secure defaults.
  purge_protection_enabled      = var.purge_protection_enabled
  soft_delete_retention_days    = var.soft_delete_retention_days
  public_network_access_enabled = var.public_network_access_enabled

  network_acls {
    default_action = var.network_default_action
    bypass         = "AzureServices"
  }

  tags = var.tags
}

# Grant Key Vault Secrets User to supplied principals (RBAC data-plane access).
resource "azurerm_role_assignment" "secrets_user" {
  for_each = toset(var.secrets_user_principal_ids)

  scope                = azurerm_key_vault.this.id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = each.value
}

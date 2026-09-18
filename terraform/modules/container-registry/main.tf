resource "azurerm_container_registry" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku

  # Admin account is a shared static credential — keep it off. Pull/push uses
  # Entra ID (managed identity) and RBAC instead.
  admin_enabled = false

  tags = var.tags
}

# Grant AcrPull to supplied principals (e.g. the AKS kubelet identity) so image
# pulls are authorized via RBAC rather than registry credentials.
resource "azurerm_role_assignment" "acr_pull" {
  for_each = toset(var.acr_pull_principal_ids)

  scope                = azurerm_container_registry.this.id
  role_definition_name = "AcrPull"
  principal_id         = each.value
}

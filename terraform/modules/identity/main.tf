resource "azurerm_user_assigned_identity" "this" {
  name                = "id-${var.name}"
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
}

# OIDC federated credentials — keyless auth, no client secrets stored anywhere.
resource "azurerm_federated_identity_credential" "this" {
  for_each = var.federated_credentials

  name                = each.key
  resource_group_name = var.resource_group_name
  parent_id           = azurerm_user_assigned_identity.this.id
  audience            = [each.value.audience]
  issuer              = each.value.issuer
  subject             = each.value.subject
}

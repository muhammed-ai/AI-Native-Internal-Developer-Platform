# Azure primary-cloud foundation. Composes reusable modules into the platform's
# core Azure resources. No resources are created until `terraform apply` is run
# against a real subscription (intentionally not done in this repo).

data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "this" {
  name     = "rg-${var.name_prefix}"
  location = var.location
  tags     = var.tags
}

module "network" {
  source = "../modules/network"

  name                = var.name_prefix
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  tags                = var.tags
}

# Platform managed identity, optionally federated to GitHub Actions via OIDC.
module "identity" {
  source = "../modules/identity"

  name                = var.name_prefix
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  tags                = var.tags

  federated_credentials = var.github_oidc_subject == null ? {} : {
    github-actions = {
      issuer  = "https://token.actions.githubusercontent.com"
      subject = var.github_oidc_subject
    }
  }
}

module "container_registry" {
  source = "../modules/container-registry"

  name                = var.acr_name
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  tags                = var.tags
}

module "key_vault" {
  source = "../modules/key-vault"

  name                = var.key_vault_name
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  tags                = var.tags

  # The platform identity may read secrets.
  secrets_user_principal_ids = [module.identity.principal_id]
}

module "aks" {
  source = "../modules/aks"

  name                = var.name_prefix
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  subnet_id           = module.network.aks_subnet_id
  tenant_id           = data.azurerm_client_config.current.tenant_id
  kubernetes_version  = var.kubernetes_version
  acr_id              = module.container_registry.id
  tags                = var.tags
}

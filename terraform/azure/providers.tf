# Provider + backend configuration for the Azure stack.
#
# Backend: state lives in an azurerm backend (remote, versioned, locked) and is
# NEVER committed. It is intentionally left as a partial config — supply the real
# values via `-backend-config` at `terraform init` (e.g. in CI) so nothing
# environment-specific is hardcoded here.
#
# Local validation runs with `terraform init -backend=false` so no backend is
# contacted and no state is created.

terraform {
  backend "azurerm" {
    # resource_group_name  = "<state-rg>"
    # storage_account_name = "<state-sa>"
    # container_name       = "tfstate"
    # key                  = "azure.tfstate"
    # use_oidc             = true
  }
}

provider "azurerm" {
  features {}

  # Authentication is via OIDC federation from GitHub Actions — no static
  # credentials. `use_oidc` and subscription/tenant come from the environment
  # (ARM_USE_OIDC, ARM_SUBSCRIPTION_ID, ARM_TENANT_ID, ARM_CLIENT_ID).
  use_oidc = true
}

provider "azuread" {
  use_oidc = true
}

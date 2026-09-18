# Azure stack — version pinning only. No resources defined yet (PLANNED, Phase 2).
terraform {
  required_version = ">= 1.6.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 3.0"
    }
  }

  # Remote backend is configured out-of-band (e.g. azurerm backend) so state is
  # never stored locally or in Git. Left empty here intentionally.
  # backend "azurerm" {}
}

# Provider block intentionally omitted until Phase 2. Authentication will use
# OIDC federation from GitHub Actions (no static credentials).

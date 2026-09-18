variable "name" {
  description = "ACR name (alphanumeric, globally unique, 5-50 chars). No hyphens."
  type        = string

  validation {
    condition     = can(regex("^[a-zA-Z0-9]{5,50}$", var.name))
    error_message = "ACR name must be 5-50 alphanumeric characters (no hyphens)."
  }
}

variable "resource_group_name" {
  description = "Target resource group."
  type        = string
}

variable "location" {
  description = "Azure region/location."
  type        = string
}

variable "sku" {
  description = "Registry SKU. Basic is the cheapest and fine for a portfolio demo."
  type        = string
  default     = "Basic"

  validation {
    condition     = contains(["Basic", "Standard", "Premium"], var.sku)
    error_message = "sku must be one of Basic, Standard, Premium."
  }
}

variable "acr_pull_principal_ids" {
  description = "Principal IDs granted the AcrPull role (e.g. the AKS kubelet identity)."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Resource tags."
  type        = map(string)
  default     = {}
}

variable "name" {
  description = "Key Vault name (3-24 chars, globally unique)."
  type        = string

  validation {
    condition     = can(regex("^[a-zA-Z0-9-]{3,24}$", var.name))
    error_message = "Key Vault name must be 3-24 chars: letters, numbers, hyphens."
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

variable "sku_name" {
  description = "Key Vault SKU."
  type        = string
  default     = "standard"

  validation {
    condition     = contains(["standard", "premium"], var.sku_name)
    error_message = "sku_name must be 'standard' or 'premium'."
  }
}

variable "purge_protection_enabled" {
  description = "Enable purge protection. Recommended true for production."
  type        = bool
  default     = true
}

variable "soft_delete_retention_days" {
  description = "Soft-delete retention in days (7-90)."
  type        = number
  default     = 7
}

variable "public_network_access_enabled" {
  description = "Whether the vault is reachable over public network."
  type        = bool
  default     = true
}

variable "network_default_action" {
  description = "Default network ACL action (Allow or Deny)."
  type        = string
  default     = "Allow"

  validation {
    condition     = contains(["Allow", "Deny"], var.network_default_action)
    error_message = "network_default_action must be 'Allow' or 'Deny'."
  }
}

variable "secrets_user_principal_ids" {
  description = "Principal IDs granted 'Key Vault Secrets User' (RBAC data-plane read)."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Resource tags."
  type        = map(string)
  default     = {}
}

variable "name" {
  description = "Base name for the managed identity."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group for the managed identity."
  type        = string
}

variable "location" {
  description = "Azure region/location."
  type        = string
}

variable "federated_credentials" {
  description = <<-EOT
    Map of OIDC federated identity credentials to attach to the managed identity.
    Enables keyless auth (e.g. GitHub Actions or Kubernetes workload identity) with
    no client secrets. Each entry sets the issuer, subject, and audience.
  EOT
  type = map(object({
    issuer   = string
    subject  = string
    audience = optional(string, "api://AzureADTokenExchange")
  }))
  default = {}
}

variable "tags" {
  description = "Tags applied to the managed identity."
  type        = map(string)
  default     = {}
}

variable "name_prefix" {
  description = "Short prefix for resource names (e.g. 'idp')."
  type        = string
  default     = "idp"
}

variable "location" {
  description = "Azure region for all resources."
  type        = string
  default     = "westeurope"
}

variable "acr_name" {
  description = "Globally-unique ACR name (5-50 alphanumeric, no hyphens)."
  type        = string
}

variable "key_vault_name" {
  description = "Globally-unique Key Vault name (3-24 chars)."
  type        = string
}

variable "kubernetes_version" {
  description = "AKS control-plane version. Null = Azure default."
  type        = string
  default     = null
}

variable "github_oidc_subject" {
  description = <<-EOT
    Optional GitHub Actions OIDC subject for a federated credential on the
    platform managed identity (e.g.
    "repo:muhammed-ai/AI-Native-Internal-Developer-Platform:ref:refs/heads/main").
    Leave null to skip creating the federated credential.
  EOT
  type        = string
  default     = null
}

variable "tags" {
  description = "Common tags applied to all resources."
  type        = map(string)
  default = {
    project = "ai-native-idp"
    managed = "terraform"
  }
}

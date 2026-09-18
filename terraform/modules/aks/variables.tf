variable "name" {
  description = "Base name for the AKS cluster."
  type        = string
}

variable "resource_group_name" {
  description = "Target resource group."
  type        = string
}

variable "location" {
  description = "Azure region/location."
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for the node pool (from the network module)."
  type        = string
}

variable "tenant_id" {
  description = "Entra ID tenant ID for AKS Azure RBAC integration."
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version. Null lets Azure pick its default."
  type        = string
  default     = null
}

variable "node_vm_size" {
  description = "VM size for the system node pool. Small default for cost control."
  type        = string
  default     = "Standard_B2s"
}

variable "node_min_count" {
  description = "Minimum node count (autoscaler)."
  type        = number
  default     = 1
}

variable "node_max_count" {
  description = "Maximum node count (autoscaler). Keep low for cost control."
  type        = number
  default     = 2
}

variable "os_disk_size_gb" {
  description = "OS disk size for nodes in GB."
  type        = number
  default     = 32
}

variable "acr_id" {
  description = "Optional ACR resource ID to grant the kubelet identity AcrPull."
  type        = string
  default     = null
}

variable "tags" {
  description = "Resource tags."
  type        = map(string)
  default     = {}
}

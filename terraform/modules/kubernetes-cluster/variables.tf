# Example module contract (PLANNED). Illustrates the input shape a cluster module
# exposes. No resources are defined here yet.

variable "name" {
  description = "Cluster name."
  type        = string
}

variable "region" {
  description = "Cloud region/location for the cluster."
  type        = string
}

variable "node_count" {
  description = "Initial node count. Keep small for cost control."
  type        = number
  default     = 1
}

variable "tags" {
  description = "Common tags/labels applied to created resources."
  type        = map(string)
  default     = {}
}

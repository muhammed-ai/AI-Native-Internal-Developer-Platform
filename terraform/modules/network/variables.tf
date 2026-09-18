variable "name" {
  description = "Base name for network resources."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group in which to create the virtual network."
  type        = string
}

variable "location" {
  description = "Azure region/location."
  type        = string
}

variable "vnet_address_space" {
  description = "Address space for the virtual network."
  type        = list(string)
  default     = ["10.20.0.0/16"]
}

variable "aks_subnet_prefixes" {
  description = "Address prefixes for the AKS node subnet."
  type        = list(string)
  default     = ["10.20.1.0/24"]
}

variable "tags" {
  description = "Tags applied to all created resources."
  type        = map(string)
  default     = {}
}

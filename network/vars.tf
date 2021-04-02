variable "vnet_name" {
  type        = string
  default     = "Test"
  description = "The name of the VNet to be used in VM Scale Set"
}

variable "Subnet_name" {
  type        = string
  default     = "Test"
  description = "The name of the Subnet to be used in VM Scale Set"
}

variable "nsg_name" {
  type        = string
  default     = "Test"
  description = "The name of the Network Sexcurity Group to be used to InBound and OutBound Traffic"
}

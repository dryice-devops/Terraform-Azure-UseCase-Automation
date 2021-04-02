variable "rg_name" {
  type        = string
  default     = "Test"
  description = "The name of the Resource Group where the Resource will be Created"
}

variable "vnet_name" {
  type        = string
  default     = "Test"
  description = "The name of the Subnet to be used in VM Scale Set"
}


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

variable "pip_name" {
  type        = string
  default     = "Test"
  description = "The name of the Network Sexcurity Group to be used to InBound and OutBound Traffic"
}

variable "network_int_name" {
  type        = string
  default     = "Test"
  description = "The name of the Network Sexcurity Group to be used to InBound and OutBound Traffic"
}

variable "node_size" {
  type        = string
  default     = "Standard_DS1_v2"
  description = "The name of the Network Sexcurity Group to be used to InBound and OutBound Traffic"
}

variable "username" {
  type        = string
  default     = "Test"
  description = "The name of the Network Sexcurity Group to be used to InBound and OutBound Traffic"
}

variable "password" {
  type        = string
  default     = "Test"
  description = "The name of the Network Sexcurity Group to be used to InBound and OutBound Traffic"
}


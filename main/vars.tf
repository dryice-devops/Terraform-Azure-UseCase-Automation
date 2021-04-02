variable "vnet_name" {
  type        = string
  default     = "Test"
  description = "The name of the Vnet to be used in VM Scale Set"
}

variable "subnet_name" {
  type        = string
  default     = "Test"
  description = "The name of the Subnet to be used in VM Scale Set"
}

variable "nsg_name" {
  type        = string
  default     = "Test"
  description = "The name of the Network Security Group to be used to InBound and OutBound Traffic"
}

variable "pip_name" {
  type        = string
  default     = "Test"
  description = "The name of the Public Ip for accessing VM"
}

variable "network_int_name" {
  type        = string
  default     = "Test"
  description = "The name of the Network interface"
}

variable "node_size" {
  type        = string
  default     = "Standard_DS1_v2"
  description = "The size of the Azure VM Node"
}

variable "username" {
  type        = string
  default     = "SU-user"
  description = "The name of the user for VM Login"
}

variable "password" {
  type        = string
  default     = "#YLPRgg89"
  description = "The password of the user for VM Login"
}


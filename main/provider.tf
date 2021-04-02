variable "subscription_id" {
  type        = string
  default     = "Enter Subscription ID"
  description = "Specifies the ID of the Subscription"
}

variable "client_id" {
  type        = string
  default     = "Enter Client ID"
  description = "Specifies the ID of the Azure Client"
}

variable "client_secret" {
  type        = string
  default     = "Enter client_secret"
  description = "Specifies the Client Secret"
}

variable "tenant_id" {
  type        = string
  default     = "Enter Tenant ID"
  description = "Specifies the ID of the Tenant"
}

variable "location" {
  type        = string
  default     = "West US"
  description = "The Location/Region where the Virtual network is created"
}

variable "rg_name" {
  type        = string
  default     = "Test"
  description = "The name of the Resource Group where the Resource will be Created"
}

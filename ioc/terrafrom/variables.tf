# az setup
variable "az_subscription_id" {
  type        = string
  description = "Azure subscription id."
}
variable "az_tenant_id" {
  type        = string
  description = "Azure tenant id"
}
variable "az_client_id" {
  type        = string
  description = "Azure client id"
}
variable "az_client_secret" {
  type        = string
  description = "Azure client secret"
  sensitive   = true
}


variable "resource_group_location" {
  default     = "eastus"
  description = "Location of the resource group."
}

variable "resource_group_name_prefix" {
  default     = "rg"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}

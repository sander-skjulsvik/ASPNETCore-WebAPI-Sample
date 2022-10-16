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

variable "web_api_name" {
  type        = string
  description = "Name"
}


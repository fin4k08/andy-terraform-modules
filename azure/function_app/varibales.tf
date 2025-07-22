variable "app_service_plan_id" {
  type        = string
  description = "ID of the App Service Plan"
}

variable "cosmos_connection_string" {
  type        = string
  description = "Connection string for Cosmos DB"
}

variable "function_app_name" {
  type        = string
  description = "Name of the Function App"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group where Function App is deployed"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags to apply to resources"
}

variable "storage_account_prefix" {
  type        = string
  description = "Prefix for the storage account name"
}

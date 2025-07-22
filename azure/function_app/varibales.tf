variable "app_service_plan_id" {
  type        = string
  description = "ID of the App Service Plan"
}

variable "cosmos_connection_string" {
  type        = string
  description = "Connection string for Cosmos DB"
}

variable "storage_account_access_key" {
  type        = string
  description = "Access key for the Function App's storage account"
}

variable "storage_account_name" {
  type        = string
  description = "Name of the storage account used by the Function App"
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

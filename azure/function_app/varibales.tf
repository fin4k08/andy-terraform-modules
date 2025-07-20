variable "name" {
  description = "Name of the Function App"
  type        = string
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "storage_account_name" {
  type        = string
  description = "Name of the storage account used for the Function App"
}

variable "storage_account_access_key" {
  type = string
}

variable "app_service_plan_id" {
  type        = string
  description = "App Service Plan ID"
}

variable "cosmos_connection_string" {
  type        = string
  description = "Cosmos DB connection string for the Function App"
}

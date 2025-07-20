variable "account_name" {
  description = "The name of the Cosmos DB account"
  type        = string
}

variable "database_name" {
  description = "The name of the Cosmos SQL database"
  type        = string
}

variable "container_name" {
  description = "The name of the Cosmos DB container"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}

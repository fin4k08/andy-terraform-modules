variable "account_name" {
  description = "The name of the Cosmos DB account"
  type        = string

  validation {
    condition     = length(var.account_name) <= 44 && can(regex("^[a-z0-9-]+$", var.account_name))
    error_message = "Cosmos account name must be lowercase, alphanumeric or hyphens only, max 44 characters."
  }
}

variable "database_name" {
  description = "The name of the Cosmos SQL database"
  type        = string

  validation {
    condition     = length(var.database_name) > 0
    error_message = "Database name must not be empty."
  }
}

variable "container_name" {
  description = "The name of the Cosmos DB container"
  type        = string

  validation {
    condition     = length(var.container_name) > 0
    error_message = "Container name must not be empty."
  }
}

variable "location" {
  description = "Azure region"
  type        = string

  validation {
    condition     = can(regex("^[a-zA-Z]+[a-zA-Z0-9-]*$", var.location))
    error_message = "Invalid Azure region format."
  }
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string

  validation {
    condition     = length(var.resource_group_name) > 0
    error_message = "Resource group name must not be empty."
  }
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}

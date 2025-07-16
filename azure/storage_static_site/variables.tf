variable "storage_account_prefix" {
  type        = string
  description = "Prefix for the storage account name (must be lowercase alphanumeric and ≤18 chars)"

  validation {
    condition     = length(var.storage_account_prefix) <= 18 && can(regex("^[a-z0-9]+$", var.storage_account_prefix))
    error_message = "Must be lowercase, alphanumeric, and ≤ 18 characters (for unique suffix compatibility)."
  }
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"

  validation {
    condition     = can(regex("^[a-zA-Z0-9-_\\.]{1,90}$", var.resource_group_name))
    error_message = "Invalid resource group name. Must be 1–90 characters and contain only alphanumerics, hyphens, underscores, or periods."
  }
}

variable "location" {
  type        = string
  description = "Azure region"

  validation {
    condition     = contains(["uksouth", "westeurope", "ukwest"], lower(var.location))
    error_message = "Invalid location. Must be one of; uksouth, westeurope, ukwest."
  }
}

variable "index_document" {
  type        = string
  default     = "index.html"
  description = "Index page for the static website"

  validation {
    condition     = can(regex("\\.html$", var.index_document))
    error_message = "index_document must end with '.html'"
  }
}

variable "error_404_document" {
  type        = string
  default     = "404.html"
  description = "404 page for the static website"

  validation {
    condition     = can(regex("\\.html$", var.index_document))
    error_message = "index_document must end with '.html'"
  }
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags for the storage account"

  validation {
    condition     = length(keys(var.tags)) > 0
    error_message = "You must provide at least one tag."
  }
}

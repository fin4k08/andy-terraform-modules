variable "storage_account_prefix" {
  type        = string
  description = "Prefix for the storage account name (must be lowercase alphanumeric, <= 18 characters)"


  validation {
    condition     = length(var.storage_account_prefix) <= 18 && can(regex("^[a-z0-9]+$", var.storage_account_prefix))
    error_message = "Prefix must be ≤18 characters, lowercase, and alphanumeric (to allow for a random suffix)."
  }
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"

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

variable "account_kind" {
  type        = string
  default     = "StorageV2"
  description = <<EOT
The kind of the storage account. Must be 'StorageV2' to support features like static websites.
Other options: 'BlobStorage', 'FileStorage', 'BlockBlobStorage', 'Storage', etc.
EOT

  validation {
    condition = contains(
      ["Storage", "StorageV2", "BlobStorage", "FileStorage", "BlockBlobStorage"],
      var.account_kind
    )
    error_message = "account_kind must be one of: Storage, StorageV2, BlobStorage, FileStorage, BlockBlobStorage."
  }
}

variable "account_tier" {
  type    = string
  default = "Standard"

  validation {
    condition     = contains(["Standard", "Premium"], var.account_tier)
    error_message = "account_tier must be either 'Standard' or 'Premium'."
  }
}

variable "account_replication_type" {
  type    = string
  default = "LRS"

  validation {
    condition     = contains(["LRS", "GRS", "RAGRS", "ZRS", "GZRS", "RAGZRS"], var.account_replication_type)
    error_message = "account_replication_type must be one of : LRS, GRS, RAGRS, ZRS, GZRS, RAGZRS."
  }
}

variable "access_tier" {
  type    = string
  default = "Hot"
}

variable "enable_static_website" {
  type        = bool
  default     = false
  description = "Enable static website hosting (only valid if account_kind is 'StorageV2')"

  validation {
    condition     = var.enable_static_website ? var.account_kind == "StorageV2" : true
    error_message = "Static website hosting requires account_kind to be 'StorageV2'."
  }
}

variable "index_document" {
  type    = string
  default = "index.html"

  validation {
    condition     = can(regex("\\.html$", var.index_document))
    error_message = "index_document must end with '.html'"
  }
}

variable "error_404_document" {
  type    = string
  default = "404.html"

  validation {
    condition     = can(regex("\\.html$", var.index_document))
    error_message = "index_document must end with '.html'"
  }
}

variable "tags" {
  type    = map(string)
  default = {}

  validation {
    condition     = length(keys(var.tags)) > 0
    error_message = "You must provide at least one tag."
  }
}

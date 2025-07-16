variable "storage_account_prefix" {
  type        = string
  description = "Prefix for the storage account name (must be lowercase alphanumeric and ≤18 chars)"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "index_document" {
  type        = string
  default     = "index.html"
  description = "Index page for the static website"
}

variable "error_404_document" {
  type        = string
  default     = "404.html"
  description = "404 page for the static website"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags for the storage account"
}

variable "name" {
  description = "The name of the App Service Plan"
  type        = string

  validation {
    condition     = length(var.name) >= 1 && length(var.name) <= 60
    error_message = "Name must be between 1 and 60 characters."
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
  description = "The resource group name"
  type        = string

  validation {
    condition     = length(var.resource_group_name) > 0
    error_message = "Resource group name must not be empty."
  }
}

variable "os_type" {
  description = "The OS type for the plan (Linux or Windows)"
  type        = string
  default     = "Linux"

  validation {
    condition     = var.os_type == "Linux" || var.os_type == "Windows"
    error_message = "os_type must be either 'Linux' or 'Windows'."
  }
}

variable "sku_name" {
  description = "The SKU for the App Service Plan"
  type        = string
  default     = "Y1"

  validation {
    condition     = contains(["Y1", "B1", "P1v2"], var.sku_name)
    error_message = "sku_name must be one of: 'Y1', 'B1', 'P1v2'."
  }
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}

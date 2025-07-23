variable "key_vault_name" {
  description = "Name of the Azure Key Vault"
  type        = string

  validation {
    condition     = can(regex("^[a-zA-Z0-9-]{3,24}$", var.key_vault_name))
    error_message = "Key Vault name must be 3–24 characters, alphanumeric and hyphens only."
  }
}

variable "location" {
  description = "Azure region for the Key Vault"
  type        = string

  validation {
    condition     = length(var.location) > 0
    error_message = "Location must not be empty."
  }
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string

  validation {
    condition     = can(regex("^[a-zA-Z0-9-_().]{1,90}$", var.resource_group_name))
    error_message = "Resource group name must be 1–90 characters and include only valid characters."
  }
}

variable "enable_rbac_authorization" {
  description = "Enable RBAC authorization on the Key Vault"
  type        = bool
  default     = true
}

variable "purge_protection_enabled" {
  description = "Enable purge protection"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags to apply to the Key Vault"
  type        = map(string)
  default     = {}
}

variable "assign_function_access" {
  description = "Whether to assign access to the Function App"
  type        = bool
  default     = false
}

variable "function_app_identity" {
  description = "The managed identity object ID for the Function App"
  type        = string
  default     = ""

  validation {
    condition     = var.assign_function_access == false || length(trim(var.function_app_identity)) > 0
    error_message = "If assign_function_access is true, function_app_identity must not be empty."
  }
}

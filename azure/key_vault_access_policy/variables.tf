variable "key_vault_id" {
  description = "The ID of the Azure Key Vault"
  type        = string

  validation {
    condition     = can(regex("^/subscriptions/.*/resourceGroups/.*/providers/Microsoft.KeyVault/vaults/.*$", var.key_vault_id))
    error_message = "The key_vault_id must be a valid Azure Key Vault resource ID."
  }
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string

  validation {
    condition     = can(regex("^[-0-9a-fA-F]{36}$", var.tenant_id))
    error_message = "Tenant ID must be a valid GUID."
  }
}

variable "object_id" {
  description = "The object ID of the user, app, or identity to grant access"
  type        = string
}

variable "secret_permissions" {
  description = "List of secret permissions to assign"
  type        = list(string)
  default     = ["Get", "List"]

  validation {
    condition = alltrue([
      for p in var.secret_permissions :
      contains(["Get", "List", "Set", "Delete", "Backup", "Restore", "Recover", "Purge"], p)
    ])
    error_message = "Invalid value in secret_permissions. Must be one of: get, list, set, delete, backup, restore, recover, purge."
  }
}

variable "key_permissions" {
  description = "List of key permissions to assign"
  type        = list(string)
  default     = []

  validation {
    condition = alltrue([
      for p in var.key_permissions :
      contains([
        "Backup", "Create", "Decrypt", "Delete", "Encrypt", "Get", "Import", "List", "Purge", "Recover",
        "Restore", "Sign", "UnwrapKey", "Update", "Verify", "WrapKey"
      ], p)
    ])
    error_message = "Invalid key_permissions value. See Azure docs for valid key operations."
  }
}

variable "certificate_permissions" {
  description = "List of certificate permissions to assign"
  type        = list(string)
  default     = []

  validation {
    condition = alltrue([
      for p in var.certificate_permissions :
      contains([
        "Backup", "Create", "Delete", "Get", "Import", "List", "Managecontacts", "Getissuers",
        "Listissuers", "Manageissuers", "Purge", "Recover", "Restore", "Setissuers", "Update"
      ], p)
    ])
    error_message = "Invalid certificate_permissions value. Must match Azure certificate permission list."
  }
}

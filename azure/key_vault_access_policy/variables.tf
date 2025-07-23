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

  validation {
    condition     = can(regex("^[-0-9a-fA-F]{36}$", var.object_id))
    error_message = "Object ID must be a valid GUID."
  }
}

variable "secret_permissions" {
  description = "List of secret permissions to assign"
  type        = list(string)
  default     = ["get", "list"]

  validation {
    condition = alltrue([
      for p in var.secret_permissions :
      contains(["get", "list", "set", "delete", "backup", "restore", "recover", "purge"], p)
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
        "backup", "create", "decrypt", "delete", "encrypt", "get", "import", "list", "purge", "recover",
        "restore", "sign", "unwrapKey", "update", "verify", "wrapKey"
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
        "backup", "create", "delete", "get", "import", "list", "managecontacts", "getissuers",
        "listissuers", "manageissuers", "purge", "recover", "restore", "setissuers", "update"
      ], p)
    ])
    error_message = "Invalid certificate_permissions value. Must match Azure certificate permission list."
  }
}

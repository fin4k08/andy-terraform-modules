variable "key_vault_id" {
  description = "ID of the Azure Key Vault"
  type        = string
}

variable "principal_id" {
  description = "The principal ID (object ID) of the identity"
  type        = string
}

variable "role_definition_name" {
  description = "Role name to assign to the identity (e.g. Key Vault Secrets User)"
  type        = string

  validation {
    condition     = contains(["Key Vault Secrets User", "Key Vault Administrator"], var.role_definition_name)
    error_message = "role_definition_name must be a valid Key Vault role like 'Key Vault Secrets User' or 'Key Vault Administrator'."
  }
}

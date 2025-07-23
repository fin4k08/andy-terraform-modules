variable "key_vault_id" {
  description = "ID of the target Azure Key Vault"
  type        = string

  validation {
    condition     = length(var.key_vault_id) > 0
    error_message = "Key Vault ID must not be empty."
  }
}

variable "secrets" {
  description = "Map of secrets to create (name = value)"
  type        = map(string)

  validation {
    condition     = length(var.secrets) > 0
    error_message = "You must provide at least one secret."
  }

  validation {
    condition = alltrue([
      for k, v in var.secrets : length(trim(k, " ")) > 0 && length(trim(v, " ")) > 0
    ])
    error_message = "All secret keys and values must be non-empty strings."
  }

}

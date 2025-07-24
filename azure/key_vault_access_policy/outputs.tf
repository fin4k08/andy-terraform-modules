output "access_policy_id" {
  description = "The ID of the Key Vault Access Policy"
  value       = length(azurerm_key_vault_access_policy.this) > 0 ? azurerm_key_vault_access_policy.this[0].id : null
}

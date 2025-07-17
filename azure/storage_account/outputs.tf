output "storage_account_name" {
  value = azurerm_storage_account.this.name
}

output "primary_web_endpoint" {
  value       = var.enable_static_website ? azurerm_storage_account.this.primary_web_endpoint : null
  description = "Static website endpoint (if enabled)"
}



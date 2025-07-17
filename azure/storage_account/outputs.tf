output "storage_account_name" {
  value = azurerm_storage_account.this.name
}

output "primary_web_host" {
  value       = var.enable_static_website ? replace(azurerm_storage_account.this.primary_web_endpoint, "https://", "") : null
  description = "Static website endpoint (if enabled)"
}



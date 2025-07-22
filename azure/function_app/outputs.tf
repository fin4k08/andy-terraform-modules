output "function_app_name" {
  value = azurerm_linux_function_app.this.name
}

output "function_app_id" {
  value = azurerm_linux_function_app.this.id
}

output "function_app_url" {
  value = azurerm_linux_function_app.this.default_hostname
}

output "storage_account_name" {
  value = module.storage.storage_account_name
}

output "storage_account_access_key" {
  value = module.storage.primary_access_key
}

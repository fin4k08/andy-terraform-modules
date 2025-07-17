output "storage_account_name" {
  description = "The name of the created storage account"
  value       = module.storage.storage_account_name
}

output "primary_web_host" {
  description = "The static website endpoint"
  value       = module.storage.primary_web_host
}

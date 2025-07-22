output "id" {
  description = "ID of the TXT record"
  value       = azurerm_dns_txt_record.this.id
}

output "fqdn" {
  description = "FQDN of the TXT record"
  value       = azurerm_dns_txt_record.this.fqdn
}

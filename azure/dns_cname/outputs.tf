output "fqdn" {
  value = azurerm_dns_cname_record.this.fqdn
}

output "name" {
  value = azurerm_dns_cname_record.this.name
}

output "zone_name" {
  value = azurerm_dns_cname_record.this.zone_name
}

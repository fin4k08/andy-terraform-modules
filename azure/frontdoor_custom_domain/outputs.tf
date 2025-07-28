output "custom_domain_id" {
  value = azurerm_cdn_frontdoor_custom_domain.this.id
}

output "route_id" {
  value = azurerm_cdn_frontdoor_route.this.id
}

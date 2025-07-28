output "endpoint_hostname" {
  description = "Default hostname of the Front Door endpoint"
  value       = azurerm_cdn_frontdoor_endpoint.this.host_name
}

output "endpoint_id" {
  description = "The ID of the Front Door endpoint"
  value       = azurerm_cdn_frontdoor_endpoint.this.id
}

output "profile_id" {
  description = "Front Door profile ID"
  value       = azurerm_cdn_frontdoor_profile.this.id
}

output "origin_group_id" {
  description = "Origin group ID"
  value       = azurerm_cdn_frontdoor_origin_group.this.id
}

output "origin_ids" {
  value = [for o in azurerm_cdn_frontdoor_origin.this : o.id]
}

resource "azurerm_cdn_frontdoor_custom_domain" "this" {
  name                     = var.name
  cdn_frontdoor_profile_id = var.profile_id
  host_name                = var.host_name

  tls {
    certificate_type = var.certificate_type
  }
}
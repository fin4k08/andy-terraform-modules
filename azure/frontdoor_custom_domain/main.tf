resource "azurerm_cdn_frontdoor_custom_domain" "this" {
  name                     = var.name
  cdn_frontdoor_profile_id = var.profile_id
  host_name                = var.host_name

  tls {
    certificate_type = var.certificate_type
  }
}

resource "azurerm_cdn_frontdoor_route" "this" {
  name                          = "${var.endpoint_name}-route"
  cdn_frontdoor_endpoint_id     = var.endpoint_id
  cdn_frontdoor_origin_group_id = var.origin_group_id
  cdn_frontdoor_origin_ids      = var.origin_ids

  supported_protocols    = ["Http", "Https"]
  https_redirect_enabled = "true"
  forwarding_protocol    = "HttpsOnly"
  patterns_to_match      = ["/*"]
  link_to_default_domain = true

  cdn_frontdoor_custom_domain_ids = [ azurerm_cdn_frontdoor_custom_domain.this.id ]
}
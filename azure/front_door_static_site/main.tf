resource "azurerm_cdn_frontdoor_profile" "this" {
  name                = var.frontdoor_profile_name
  resource_group_name = var.resource_group_name
  sku_name            = "Standard_AzureFrontDoor"
}

resource "azurerm_cdn_frontdoor_endpoint" "this" {
  name                     = var.endpoint_name
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.this.id
}

resource "azurerm_cdn_frontdoor_origin_group" "this" {
  name                     = "${var.endpoint_name}-origin-group"
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.this.id
  session_affinity_enabled = false

  dynamic "health_probe" {
    for_each = length(var.origins) > 1 ? [1] : []
    content {
      interval_in_seconds = var.health_probe.interval_in_seconds
      path                = var.health_probe.path
      protocol            = var.health_probe.protocol
      request_type        = var.health_probe.request_type
    }
  }

  load_balancing {
    sample_size                        = var.load_balancing.sample_size
    successful_samples_required        = var.load_balancing.successful_samples_required
    additional_latency_in_milliseconds = var.load_balancing.additional_latency_in_milliseconds
  }
}

resource "azurerm_cdn_frontdoor_origin" "this" {
  for_each = {
    for origin in var.origins : origin.name => origin
  }

  name                           = each.value.name
  cdn_frontdoor_origin_group_id  = azurerm_cdn_frontdoor_origin_group.this.id
  host_name                      = each.value.host_name
  origin_host_header             = coalesce(each.value.origin_host_header, each.value.host_name)
  https_port                     = lookup(each.value, "https_port", 443)
  http_port                      = lookup(each.value, "http_port", null)
  enabled                        = lookup(each.value, "enabled", true)
  priority                       = lookup(each.value, "priority", 1)
  weight                         = lookup(each.value, "weight", 1000)
  certificate_name_check_enabled = lookup(each.value, "certificate_name_check_enabled", false)
}

resource "azurerm_cdn_frontdoor_route" "this" {
  name                          = "${var.endpoint_name}-route"
  cdn_frontdoor_endpoint_id     = azurerm_cdn_frontdoor_endpoint.this.id
  cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.this.id
  cdn_frontdoor_origin_ids      = [for o in azurerm_cdn_frontdoor_origin.this : o.value.id]

  supported_protocols    = ["Https"]
  https_redirect_enabled = "true"
  forwarding_protocol    = "HttpsOnly"
  patterns_to_match      = ["/*"]
  link_to_default_domain = true
}

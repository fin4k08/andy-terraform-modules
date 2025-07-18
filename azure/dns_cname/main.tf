resource "azurerm_dns_cname_record" "this" {
  name = var.record_name
  zone_name = var.zone_name
  resource_group_name = var.resource_group_name
  ttl = var.ttl
  target_resource_id = var.target_resource_id
}
resource "azurerm_dns_txt_record" "this" {
  name                = var.name
  zone_name           = var.zone_name
  resource_group_name = var.resource_group_name
  ttl                 = var.ttl

  dynamic "record" {
    for_each = slice(var.records, 1, length(var.records))
    content {
      value = record.value
    }
  }
}

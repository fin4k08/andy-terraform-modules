resource "random_string" "suffix" {
  length  = 6
  upper   = false
  special = false
}

resource "azurerm_storage_account" "this" {
  name                     = "${var.storage_account_prefix}${random_string.suffix.result}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  access_tier              = var.access_tier
  account_kind             = var.account_kind

  tags = var.tags
}

resource "azurerm_storage_account_static_website" "static" {
  count              = var.enable_static_website ? 1 : 0
  storage_account_id = azurerm_storage_account.this.id
  index_document     = var.index_document
  error_404_document = var.error_404_document
}
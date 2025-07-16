module "storage" {
  source = "../storage_account"

  storage_account_prefix = var.storage_account_prefix
  resource_group_name    = var.resource_group_name
  location               = var.location

  account_kind          = "StorageV2" #Hard coded as required for statis sites
  enable_static_website = true

  index_document     = var.index_document
  error_404_document = var.error_404_document
  tags               = var.tags
}
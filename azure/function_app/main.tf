module "storage" {
  source = "../storage_account"

  storage_account_prefix = var.storage_account_prefix
  location               = var.location
  resource_group_name    = var.resource_group_name
  tags                   = var.tags
}

resource "azurerm_linux_function_app" "this" {
  name                       = var.function_app_name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  service_plan_id            = var.app_service_plan_id
  storage_account_name       = module.storage.storage_account_name
  storage_account_access_key = module.storage.primary_access_key

  identity {
    type = "SystemAssigned"
  }

  site_config {
    application_stack {
      node_version = "20"
    }
  }

  app_settings = merge(
    {
      FUNCTIONS_WORKER_RUNTIME = "node"
      WEBSITE_RUN_FROM_PACKAGE = "1"
    },
    {
      for key, secret in var.app_settings_secrets :
      key => "@Microsoft.KeyVault(SecretUri=${trim(var.kv_uri, "/")}/secrets/${secret})"
    }
  )

  tags = var.tags
}

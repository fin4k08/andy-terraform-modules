data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "this" {
  name                      = var.key_vault_name
  location                  = var.location
  resource_group_name       = var.resource_group_name
  tenant_id                 = data.azurerm_client_config.current.tenant_id
  sku_name                  = "standard"
  enable_rbac_authorization = var.enable_rbac_authorization
  purge_protection_enabled  = var.purge_protection_enabled

  tags = var.tags
}

resource "azurerm_role_assignment" "admin" {
  for_each = toset(var.rbac_admin_principal_ids)

  scope                = azurerm_key_vault.this.id
  role_definition_name = "Key Vault Administrator"
  principal_id         = each.value
}

resource "azurerm_role_assignment" "secrets_officer" {
  for_each = toset(var.rbac_secrets_officer_principal_ids)

  scope                = azurerm_key_vault.this.id
  role_definition_name = "Key Vault Secrets Officer"
  principal_id         = each.value
}

output "account_name" {
  value = azurerm_cosmosdb_account.this.name
}

output "database_name" {
  value = azurerm_cosmosdb_sql_database.this.name
}

output "container_name" {
  value = azurerm_cosmosdb_sql_container.this.name
}

output "connection_string" {
  value = azurerm_cosmosdb_account.this.primary_sql_connection_string
}

output "endpoint" {
  value = azurerm_cosmosdb_account.this.endpoint
}

output "primary_key" {
  value = azurerm_cosmosdb_account.this.primary_key
}

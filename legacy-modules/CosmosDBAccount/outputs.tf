output "name" {
  description = "The name of the resoruce created."
  value       = azurerm_cosmosdb_account.cosmosdbaccount.name
}

output "id" {
  description = "The id of the resource created."
  value       = azurerm_cosmosdb_account.cosmosdbaccount.id
}

output "endpoint" {
  description = "The primary key of the resource created."
  value       = azurerm_cosmosdb_account.cosmosdbaccount.endpoint
}

output "primary_key" {
  description = "The primary key of the resource created."
  value       = azurerm_cosmosdb_account.cosmosdbaccount.primary_key
}

output "secondary_key" {
  description = "The secondary key of the resource created."
  value       = azurerm_cosmosdb_account.cosmosdbaccount.secondary_key
}
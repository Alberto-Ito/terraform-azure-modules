output "name" {
  description = "The name of the resoruce created."
  value       = azurerm_storage_account.storageaccount.name
}

output "id" {
  description = "The id of the resource created."
  value       = azurerm_storage_account.storageaccount.id
  sensitive   = true
}

output "primary_connection_string" {
  description = "The primary connection string of the storage account created."
  value       = azurerm_storage_account.storageaccount.primary_connection_string
  sensitive   = true
}

output "secondary_connection_string" {
  description = "The secondary connection string of the storage account created."
  value       = azurerm_storage_account.storageaccount.secondary_connection_string
  sensitive   = true
}

output "primary_access_key" {
  description = "The primary access key of the storage account created."
  value       = azurerm_storage_account.storageaccount.primary_access_key
  sensitive   = true
}

output "secondary_access_key" {
  description = "The secondary access key of the storage account created."
  value       = azurerm_storage_account.storageaccount.secondary_access_key
  sensitive   = true
}

output "principal_id" {
  description = "The Principal ID of the Identity used by the storage account."
  value       = azurerm_storage_account.storageaccount.identity[*].principal_id
  sensitive   = true
}

output "primary_location" {
  description = "The primary location of the storage account."
  value       = azurerm_storage_account.storageaccount.primary_location
  sensitive   = false
}

output "secondary_location" {
  description = "The secondary location of the storage account."
  value       = azurerm_storage_account.storageaccount.secondary_location
  sensitive   = false
}

output "primary_web_endpoint" {
  description = "The primary endpoint of the storage account."
  value       = azurerm_storage_account.storageaccount.primary_web_endpoint
  sensitive   = false
}

output "secondary_web_endpoint" {
  description = "The secondary endpoint of the storage account."
  value       = azurerm_storage_account.storageaccount.secondary_web_endpoint
  sensitive   = false
}
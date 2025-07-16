output "name" {
  description = "The name of the resoruce created."
  value       = azurerm_storage_account.storageaccount.name
}

output "id" {
  description = "The id of the resource created."
  value       = azurerm_storage_account.storageaccount.id
}

output "primary_connection_string" {
  description = "The primary connection string of the storage account created."
  value       = azurerm_storage_account.storageaccount.primary_connection_string
}

output "secondary_connection_string" {
  description = "The secondary connection string of the storage account created."
  value       = azurerm_storage_account.storageaccount.secondary_connection_string
}

output "primary_access_key" {
  description = "The primary access key of the storage account created."
  value       = azurerm_storage_account.storageaccount.primary_access_key
}

output "secondary_access_key" {
  description = "The secondary access key of the storage account created."
  value       = azurerm_storage_account.storageaccount.secondary_access_key
}

output "storage_identity_principal_id" {
  description = "The Principal ID for the Service Principal associated with the Identity of this Storage Account"
  value       = azurerm_storage_account.storageaccount.identity[*].principal_id
  depends_on  = [azurerm_storage_account.storageaccount]
}

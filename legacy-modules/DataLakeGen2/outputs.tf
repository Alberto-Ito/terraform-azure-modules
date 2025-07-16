output "name" {
  description = "The name of the created resource group."
  value       = azurerm_storage_account.datalake.name
}

output "id" {
  description = "The id of the resource created."
  value       = azurerm_storage_account.datalake.id
}

# output "dlgsfsid" {
#   value = azurerm_storage_data_lake_gen2_filesystem.dfg2fs.id
# }

output "primary_connection_string" {
  description = "The primary connection string of the storage account."
  value       = azurerm_storage_account.datalake.primary_connection_string
}

output "secondary_connection_string" {
  description = "The secondary connection string of the storage account created."
  value       = azurerm_storage_account.datalake.secondary_connection_string
}

output "primary_access_key"{
  description = "The primary access key of the storage account created."
  value       = azurerm_storage_account.datalake.primary_access_key
}

output "secondary_access_key"{
  description = "The secondary access key of the storage account created."
  value       = azurerm_storage_account.datalake.secondary_access_key
}
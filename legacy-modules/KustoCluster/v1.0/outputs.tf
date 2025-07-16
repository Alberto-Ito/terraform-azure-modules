output "id" {
  description = "The Kusto Cluster ID."
  value       = azurerm_kusto_cluster.kusto_cluster.id
}

output "name" {
  description = "The name of the Kusto Cluster to create. Changing this forces a new resource to be created."
  value       = azurerm_kusto_cluster.kusto_cluster.name
}

output "uri" {
  description = "The FQDN of the Azure Kusto Cluster."
  value       = azurerm_kusto_cluster.kusto_cluster.uri
}

output "data_ingestion_uri" {
  description = "The Kusto Cluster URI to be used for data ingestion."
  value       = azurerm_kusto_cluster.kusto_cluster.data_ingestion_uri
}

output "principal_id" {
  description = "The Principal ID associated with this System Assigned Managed Service Identity."
  value       = azurerm_kusto_cluster.kusto_cluster.identity[*].principal_id
}

output "database_name" {
  description = "The name of the Kusto Database to create. Changing this forces a new resource to be created."
  value       = azurerm_kusto_database.kusto_database.name
}

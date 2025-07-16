output "sql_server_name" {
  description = "The name of the resoruce created."
  value       = azurerm_sql_server.sqlserver.name
}

output "sql_server_id" {
  description = "The id of the resource created."
  value       = azurerm_sql_server.sqlserver.id
}

output "sql_database_name" {
  description = "The name of the resoruce created."
  value       = azurerm_sql_database.sqldatawarehouse.name
}

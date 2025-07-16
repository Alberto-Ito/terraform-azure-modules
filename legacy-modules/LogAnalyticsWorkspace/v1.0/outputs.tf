output "name" {
  description = "The name of the created Log Analytics Workspace"
  value       = azurerm_log_analytics_workspace.loganalytics.name
}

output "id" {
  description = "The id of the created Log Analytics Workspace"
  value       = azurerm_log_analytics_workspace.loganalytics.id
}

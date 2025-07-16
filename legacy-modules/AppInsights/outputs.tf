output "instrumentation_key" {
  value = azurerm_application_insights.appinsights.instrumentation_key
}

output "app_id" {
  value = azurerm_application_insights.appinsights.app_id
}

output "id" {
  value = azurerm_application_insights.appinsights.id
}

output "appinsights_connection_string" {
  value     = azurerm_application_insights.appinsights.connection_string
  sensitive = true
}

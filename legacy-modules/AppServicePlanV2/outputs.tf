output "name" {
  description = "Specifies the name of the App Service Plan"
  value       = azurerm_app_service_plan.appserviceplan.name
}

output "id" {
  description = "Specifies the id of the App Service Plan"
  value       = azurerm_app_service_plan.appserviceplan.id
}
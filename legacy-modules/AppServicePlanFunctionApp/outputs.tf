output "name" {
  description = "Specifies the name of the App Service Plan"
  value       = azurerm_app_service_plan.appserviceplan.name
}

output "id" {
  description = "Specifies the id of the App Service Plan"
  value       = azurerm_app_service_plan.appserviceplan.id
}

output "os_type" {
  description = "The operating system declared for this plan."
  value = azurerm_app_service_plan.appserviceplan.reserved ? "linux" : "" # Empty string for windows 
}
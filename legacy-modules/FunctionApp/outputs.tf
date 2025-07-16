output "name" {
  description = "Specifies the name of the App Service"
  value       = azurerm_function_app.functionapp.name
}

output "id" {
  description = "Specifies the id of the App Service"
  value       = azurerm_function_app.functionapp.id
}
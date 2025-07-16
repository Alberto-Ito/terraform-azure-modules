output "name" {
  description = "Specifies the name of the App Service"
  value       = azurerm_function_app.functionapp.name
}

output "id" {
  description = "Specifies the id of the App Service"
  value       = azurerm_function_app.functionapp.id
}

output "principal_id" {
  description = "The Principal ID for the Service Principal associated with the Managed Service Identity of this App Service."
  value       = azurerm_function_app.functionapp.identity[*].principal_id
}

output "hostname" {
  description = "The default hostname associated with the Function App"
  value       = azurerm_function_app.functionapp.default_hostname
}
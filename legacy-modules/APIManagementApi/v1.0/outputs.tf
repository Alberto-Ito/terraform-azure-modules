output "name" {
  description = "Specifies the name of the API Management API"
  value       = azurerm_api_management_api.api.name
}

output "api_management_name" {
  description = "Specifies the name of the API Management"
  value       = azurerm_api_management_api.api.api_management_name
}
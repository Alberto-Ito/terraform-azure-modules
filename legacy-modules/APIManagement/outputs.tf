output "name" {
  description = "Specifies the name of the API Management"
  value       = azurerm_api_management.apim0.name
}

output "id" {
  description = "Specifies the id of the API Management"
  value       = azurerm_api_management.apim0.id
}

output "url" {
  description = "Specifies the url of the API Management"
  value       = azurerm_api_management.apim0.gateway_url
}

output "identity" {
  description = "Specifies the identity of the API Management"
  value       = azurerm_api_management.apim0.identity[*].principal_id
}

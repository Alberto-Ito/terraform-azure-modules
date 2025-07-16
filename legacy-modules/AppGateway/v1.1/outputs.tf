output "name" {
  description = "Specifies the name of the App Gateway"
  value       = azurerm_application_gateway.appgateway.name
}

output "id" {
  description = "Specifies the id of the App Gateway"
  value       = azurerm_application_gateway.appgateway.id
}

output "name" {
  description = "The name of the private endpoint created."
  value       = azurerm_private_endpoint.privateendpoint.name
}

output "id" {
  description = "The name of the private endpoint created."
  value       = azurerm_private_endpoint.privateendpoint.id
}

output "private_service_connection" {
  description = "The private IP address associated with the private endpoint"
  value       = azurerm_private_endpoint.privateendpoint.private_service_connection 
}
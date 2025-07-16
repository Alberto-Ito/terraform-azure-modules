output "name" {
  description = "Specifies the name of the API Management"
  value       = azurerm_signalr_service.signalr.name
}

output "id" {
  description = "Specifies the id of the API Management"
  value       = azurerm_signalr_service.signalr.id
}

output "primary_connection_string" {
  description = "The primary connection string for the SignalR service."
  value       = azurerm_signalr_service.signalr.primary_connection_string
  sensitive   = true
}

output "hostname" {
  description = "The FQDN of the SignalR service."
  value       = azurerm_signalr_service.signalr.hostname
  sensitive   = true
}
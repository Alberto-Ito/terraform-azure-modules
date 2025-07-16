output "id" {
  description = "Specifies the id of servicebus"
  value       = azurerm_servicebus_namespace.servicebus.id
}

output "servicebus_primary_key" {
  description = "Specifies the endpoint of event grid"
  value       = azurerm_servicebus_namespace.servicebus.default_primary_connection_string
}

output "name" {
  value = azurerm_servicebus_namespace.servicebus.name
}
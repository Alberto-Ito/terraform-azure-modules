output "primary_connection_string" {
  description = "The Primary Connection String for the ServiceBus Namespace authorization Rule."
  value       = azurerm_servicebus_namespace_authorization_rule.authorization_rule.primary_connection_string
  sensitive   = true
}

output "secondary_connection_string" {
  description = "The Secondary Connection String for the ServiceBus Namespace authorization Rule."
  value       = azurerm_servicebus_namespace_authorization_rule.authorization_rule.secondary_connection_string
  sensitive   = true
}

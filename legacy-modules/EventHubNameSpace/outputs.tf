output "name" {
  description = "The name of the event hub namesapce created."
  value       = azurerm_eventhub_namespace.eventhubnamespace.name
}

output "identity_principal_id" {
  description = "The Client ID of the Service Principal assigned to this EventHub Namespace"
  value       = length(azurerm_eventhub_namespace.eventhubnamespace.identity) > 0 ? azurerm_eventhub_namespace.eventhubnamespace.identity[0].principal_id : null
}

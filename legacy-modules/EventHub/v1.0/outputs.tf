output "id" {
  description = "The ID of the EventHub."
  value       = azurerm_eventhub.eventhub1.id
}
output "name" {
  description = "The name of the event hub created."
  value       = azurerm_eventhub.eventhub1.name
}

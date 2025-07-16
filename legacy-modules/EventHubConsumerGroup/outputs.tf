output "id" {
  description = "The ID of the EventHub Consumer Group."
  value       = azurerm_eventhub_consumer_group.eventhubconsumers.id
}

output "name" {
  description = "Specifies the name of the EventHub Consumer Group resource. Changing this forces a new resource to be created."
  value       = azurerm_eventhub_consumer_group.eventhubconsumers.name
}

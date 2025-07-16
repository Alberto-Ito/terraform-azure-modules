resource "azurerm_eventhub_consumer_group" "eventhubconsumers" {
  name                = var.eventhub_consumer_group_name
  namespace_name      = var.namespace_name
  eventhub_name       = var.eventhub_name
  resource_group_name = var.resource_group_name
}
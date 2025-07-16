resource "azurerm_servicebus_queue" "servicebusqueue" {
  name                = var.queueName
  resource_group_name = var.resource_group_name
  namespace_name      = var.namespace_name

  enable_partitioning = var.enable_partitioning
  requires_session    = var.requires_session
}

output "name" {
  value = azurerm_servicebus_queue.servicebusqueue.name
}
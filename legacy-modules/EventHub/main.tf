resource "azurerm_eventhub" "eventhub1" {
  name                = var.azurerm_eventhub_name
  namespace_name      = var.azurerm_namespace_name
  resource_group_name = var.resource_group_name
  partition_count     = var.partition_count
  message_retention   = var.message_retention
}
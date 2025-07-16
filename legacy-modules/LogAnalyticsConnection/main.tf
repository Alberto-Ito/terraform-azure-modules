resource "azurerm_log_analytics_linked_service" "la" {
  resource_group_name = var.azurerm_log_analytics_linked_service_resource_group_name
  workspace_id        = var.azurerm_log_analytics_linked_service_workspace_id
  read_access_id      = var.azurerm_log_analytics_linked_service_read_access_id
}
variable "azurerm_log_analytics_linked_service_resource_group_name" {
  description = "The name of the resource group in which the Log Analytics Linked Service is created."
}

variable "azurerm_log_analytics_linked_service_workspace_id" {
  description = "The ID of the Log Analytics Workspace that will contain the Log Analytics Linked Service resource"
}

variable "azurerm_log_analytics_linked_service_read_access_id" {
  description = "he ID of the readable Resource that will be linked to the workspace."
}

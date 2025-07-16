resource "azurerm_log_analytics_workspace" "loganalytics" {
  name                       = var.azurerm_log_analytics_workspace_name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  sku                        = "PerGB2018"
  retention_in_days          = var.retention_in_days < 90 ? 90 : var.retention_in_days
  tags                       = var.tags
  internet_ingestion_enabled = false
  internet_query_enabled     = false

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

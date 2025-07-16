resource "azurerm_network_watcher_flow_log" "flow_log" {
  network_watcher_name      = var.network_watcher_name
  resource_group_name       = var.resource_group_name
  network_security_group_id = var.network_security_group_id
  storage_account_id        = var.storage_account_id
  version                   = var.flow_log_version
  enabled                   = true

  retention_policy {
    enabled = true
    days    = var.retention_days
  }

  traffic_analytics {
    enabled               = true
    workspace_id          = var.workspace_id
    workspace_region      = var.workspace_region
    workspace_resource_id = var.workspace_resource_id
    interval_in_minutes   = var.interval_in_minutes
  }

  tags = var.tags

}

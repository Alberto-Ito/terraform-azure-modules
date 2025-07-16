data "azurerm_monitor_diagnostic_categories" "target" {
  count       = var.logs == null || var.metrics == null ? 1 : 0
  resource_id = var.target_resource_id
}

locals {
  logs    = var.logs == null ? data.azurerm_monitor_diagnostic_categories.target[0].logs : var.logs
  metrics = var.metrics == null ? data.azurerm_monitor_diagnostic_categories.target[0].metrics : var.metrics
}

resource "azurerm_monitor_diagnostic_setting" "diagnostic_setting" {
  name                       = var.name
  target_resource_id         = var.target_resource_id
  storage_account_id         = var.storage_account_id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  dynamic "log" {
    for_each = local.logs
    content {
      category = log.value

      retention_policy {
        enabled = true
        days    = 365
      }
    }
  }

  dynamic "metric" {
    for_each = local.metrics
    content {
      category = metric.value
      enabled  = true

      retention_policy {
        enabled = true
        days    = 365
      }
    }
  }
}

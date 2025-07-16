resource "azurerm_servicebus_namespace" "servicebus" {
  name                = var.service_bus_namespace_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku
  capacity            = var.capacity
  tags                = var.tags

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

module "servicebus_diagnostic_logs" {
  count                      = var.add_diagnostic_logs ? 1 : 0
  source                     = "../../DiagnosticLogs/v1.0/"
  name                       = "diag-${azurerm_servicebus_namespace.servicebus.name}"
  target_resource_id         = azurerm_servicebus_namespace.servicebus.id
  storage_account_id         = var.storage_account_id
  log_analytics_workspace_id = var.log_analytics_workspace_id
  logs                       = ["OperationalLogs", "VNetAndIPFilteringLogs"]
  metrics                    = ["AllMetrics"]
}

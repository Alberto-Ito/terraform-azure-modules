resource "azurerm_servicebus_namespace" "servicebus" {
  name                = var.service_bus_namespace_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku
  capacity            = 1
  tags                = var.tags

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

module "naming" {
  source = "../Naming"
}

module "servicebus_diagnostic_logs" {
  source             = "../DiagnosticLogs/"
  name               = "${module.naming.diagnostic_logs_name}-${azurerm_servicebus_namespace.servicebus.name}"
  target_resource_id = azurerm_servicebus_namespace.servicebus.id
  storage_account_id = var.storage_account_id
}
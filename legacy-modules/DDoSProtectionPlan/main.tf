resource "azurerm_network_ddos_protection_plan" "ddos" {
  name                = var.azurerm_network_ddos_protection_plan_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
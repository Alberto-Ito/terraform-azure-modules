resource "azurerm_virtual_network" "vnet" {
  name                = var.azurerm_virtual_network_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = flatten([var.address_space])
  dns_servers         = flatten([var.dns_servers])
  tags                = var.tags

  dynamic "ddos_protection_plan" {
    for_each = var.azurerm_network_ddos_protection_plan_ddos_id == null ? [] : var.azurerm_network_ddos_protection_plan_ddos_id
    content {
      id     = var.azurerm_network_ddos_protection_plan_ddos_id
      enable = true
    }
  }

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

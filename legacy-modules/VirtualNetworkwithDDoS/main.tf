resource "azurerm_virtual_network" "vnet" {
  name                = var.azurerm_virtual_network_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = [var.address_space]
  dns_servers         = [var.dns_servers]
  tags                = var.tags

  ddos_protection_plan {
    id     = var.azurerm_network_ddos_protection_plan_ddos_id
    enable = true
  }

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
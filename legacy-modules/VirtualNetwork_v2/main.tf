resource "azurerm_virtual_network" "vnet" {
  name                = var.azurerm_virtual_network_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = flatten([var.address_space]) # address_space could be a string or a list of strings
  dns_servers         = var.dns_servers
  tags                = var.tags

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

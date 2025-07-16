resource "azurerm_subnet" "snet" {
  name                 = var.azurerm_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.azurerm_virtual_network_name
  address_prefixes     = [var.address_prefixes]
  service_endpoints    = [var.service_endpoints]
}
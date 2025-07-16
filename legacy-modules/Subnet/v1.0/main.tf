resource "azurerm_subnet" "snet" {
  name                                           = var.azurerm_subnet_name
  resource_group_name                            = var.resource_group_name
  virtual_network_name                           = var.azurerm_virtual_network_name
  address_prefixes                               = [var.address_prefixes]
  service_endpoints                              = var.service_endpoints == null ? [] : var.service_endpoints
  enforce_private_link_endpoint_network_policies = var.enforce_private_link_endpoint_network_policies
  enforce_private_link_service_network_policies  = var.enforce_private_link_service_network_policies


  dynamic "delegation" {
    for_each = var.delegation_name == null ? [] : [var.delegation_name]
    content {
      name = var.delegation_name
      service_delegation {
        name    = var.service_delegation_type
        actions = var.service_delegation_actions
      }
    }
  }
}

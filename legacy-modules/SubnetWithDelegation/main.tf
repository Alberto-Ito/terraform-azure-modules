resource "azurerm_subnet" "snet" {
  name                 = var.azurerm_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.azurerm_virtual_network_name
  address_prefixes     = [var.address_prefixes]
  enforce_private_link_endpoint_network_policies = var.enforce_private_link_endpoint_network_policies

  delegation {
      name = var.delegation_name
      service_delegation {
        name     = var.service_delegation_type
        # actions  = [
        #   "Microsoft.Network/virtualNetworks/subnets/join/action",
        #   "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
        #   "Microsoft.Network/virtualNetworks/subnets/action"
        # ]
      }
  }

  # service_delegation {
  # name                 = var.delegation_name
  # service_delegation   = var.service_delegation_type
# }
}
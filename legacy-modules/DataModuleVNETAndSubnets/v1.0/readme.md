# VNET and Subnets Data Module

**WARNING:** Add the 'provider' attribute to this module.

- It should be an azurerm provider for the network subscription (e.g. the environment-specific subscription, or the network hub subscription):
- `provider = azurerm[.provider-alias]`

## Example

```terraform
provider "azurerm" {
  features {}
}

module "vnet_and_subnets" {
  source               = "<path/to/DataModuleVNETAndSubnets/v1.0>"
  resource_group_name  = "<vnet-resource-group-name>"
  virtual_network_name = "<vnet-name>"
  name_suffixes        = ["endpoint", "ws4func"] # Optional, to filter by name suffix
  providers            = {
    azurerm = azurerm
  }
}

locals {
  my_vnet             = module.vnet_and_subnets.vnet
  my_relevant_subnets = module.vnet_and_subnets.subnets
  my_endpoint_subnet  = module.vnet_and_subnets.subnets_by_suffix.endpoint[0]
  my_endpoint_subnet  = module.vnet_and_subnets.subnets_by_suffix.ws4func[0]
}

```

**WARNING:** On Destroy mode, this module is returning an error; However, the resources are being destroyed successfully.
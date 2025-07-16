# Private DNS Zone Data Module

**WARNING:** Add the 'provider' attribute to this module.

- It should be an azurerm provider for the network hub subscription:
- `provider = azurerm.networkhub`

## Example

```terraform
provider "azurerm" {
  alias           = "networkhub"
  subscription_id = "<network-hub-subscription-id>"
  features {}
}

module "dns_zones" {
  source              = "<path/to/DataModulePrivateDNSZones/v1.0>"
  resource_group_name = "<network-hub-resource-group-name>"
  providers           = {
      azurerm = azurerm.networkhub
  }
}

locals {
  keyvault_dns_zone_id = module.dns_zones.vaultcore.id
}

```

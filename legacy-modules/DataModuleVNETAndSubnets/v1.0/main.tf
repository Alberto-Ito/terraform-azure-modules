# VNET and Subnets Data Module

locals {
  all_subnet_names = data.azurerm_virtual_network.vnet.subnets

  subnet_names = (
    var.name_suffixes != null ?
    [for
      name in local.all_subnet_names : name
      if length(
        [for
          suffix in var.name_suffixes : suffix
          if name != trimsuffix(name, suffix)
        ]
      ) > 0
    ]
    : local.all_subnet_names
  )
}

data "azurerm_virtual_network" "vnet" {
  name                = var.virtual_network_name
  resource_group_name = var.resource_group_name
}

data "azurerm_subnet" "subnets" {
  for_each             = toset(local.subnet_names)
  name                 = each.value
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  resource_group_name  = data.azurerm_virtual_network.vnet.resource_group_name
  depends_on = [
    data.azurerm_virtual_network.vnet
  ]
}

# After read the subnets, a map is created using the suffix as key.
locals {
  subnets_by_suffix = (
    var.name_suffixes != null ?
    { for
      suffix in var.name_suffixes : suffix =>
      [for
        subnet in data.azurerm_subnet.subnets : subnet
        if subnet.name != trimsuffix(subnet.name, suffix)
      ]
    }
    : {}
  )
}

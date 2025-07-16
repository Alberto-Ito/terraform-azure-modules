resource "azurerm_app_configuration" "appconf" {
  name                = var.app_configuration_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
  tags                = var.tags

  identity {
    type = var.identity_type
  }

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

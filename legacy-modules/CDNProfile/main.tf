resource "azurerm_cdn_profile" "cdnprofile" {
  name                = var.azurerm_cdn_profile_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku
  tags                = var.tags

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
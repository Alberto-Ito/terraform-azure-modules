resource "azurerm_public_ip_prefix" "publicipprefix" {
  name                = var.azurerm_public_ip_prefix_name
  location            = var.location
  resource_group_name = var.resource_group_name
  zones = [var.zones]
  prefix_length = var.prefix_length
  tags          = var.tags

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
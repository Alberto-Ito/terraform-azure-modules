resource "azurerm_network_watcher" "networkwatcher0000" {
  name                = var.azurerm_network_watcher_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
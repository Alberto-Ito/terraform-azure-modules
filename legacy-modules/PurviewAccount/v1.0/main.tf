resource "azurerm_purview_account" "purview" {
  name                   = var.purview_account_name
  resource_group_name    = var.resource_group_name
  location               = var.location
  sku_name               = var.sku_name
  public_network_enabled = var.public_network_enabled
  tags                   = var.tags
}

data "azurerm_public_ip" "publicipdata" {
  name                = var.azurerm_public_ip_name
  resource_group_name = var.public_ip_resource_group_name
}

data "azurerm_public_ip_prefix" "publicipprefixdata" {
  name                = var.azurerm_public_ip_prefix_name
  resource_group_name = var.public_ip_prefix_resource_group
}

resource "azurerm_nat_gateway" "natgateway" {
  name                = var.azurerm_nat_gateway_name
  location            = var.location
  resource_group_name = var.resource_group_name
  # public_ip_address_ids   = [data.azurerm_public_ip.publicipdata.id]
  public_ip_prefix_ids    = [data.azurerm_public_ip_prefix.publicipprefixdata.id]
  sku_name                = "Standard"
  idle_timeout_in_minutes = var.idle_timeout_in_minutes
  zones                   = [var.zones]
  tags                    = var.tags

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

resource "azurerm_nat_gateway_public_ip_association" "natgatewaypublicipassociation" {
  nat_gateway_id       = azurerm_nat_gateway.natgateway.id
  public_ip_address_id = data.azurerm_public_ip.publicipdata.id
}
data "azurerm_public_ip" "publiciplb0" {
  name                = var.public_ip_address_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_lb" "lb0" {
  name                = var.azurerm_lb_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"
  tags                = var.tags

  frontend_ip_configuration {
    name                 = var.public_ip_address_name
    public_ip_address_id = data.azurerm_public_ip.publiciplb0.id
  }
  
  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
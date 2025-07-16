resource "azurerm_lb" "lb0" {
  name                = var.azurerm_lb_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"
  tags                = var.tags

  frontend_ip_configuration {
    name                 = var.public_ip_address_name
    public_ip_address_id = var.public_ip_address_id
  }

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

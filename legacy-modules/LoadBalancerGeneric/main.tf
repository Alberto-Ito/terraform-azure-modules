resource "azurerm_lb" "lb0" {
  name                = var.azurerm_lb_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"
  tags = var.tags

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
  # frontend_ip_configuration {
  #   name                 = var.frontend_ip_configuration_name
  #   subnet_id           = var.subnet_id
  # }
}
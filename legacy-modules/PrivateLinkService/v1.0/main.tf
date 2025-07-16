resource "azurerm_private_link_service" "privatelinkservice" {
  name                = var.azurerm_private_link_service_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

  nat_ip_configuration {
    name      = var.azurerm_public_ip_name
    primary   = true
    subnet_id = var.subnet_id
  }

  load_balancer_frontend_ip_configuration_ids = [
    var.frontend_ip_configuration_id,
  ]
}

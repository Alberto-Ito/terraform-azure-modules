resource "azurerm_bastion_host" "bastion" {
  name                = var.bastion_host_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

  ip_configuration {
    name                 = var.ip_configuration_name
    subnet_id            = var.subnet_id
    public_ip_address_id = var.public_ip_address_id
  }

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
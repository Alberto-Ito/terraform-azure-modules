resource "azurerm_container_registry" "containerregistry" {
  name                     = var.container_registry_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  sku                      = var.sku                      #"Premium"
  admin_enabled            = var.admin_enabled            #false
  georeplication_locations = var.georeplication_locations #["East US", "West Europe"]
  tags                     = var.tags

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
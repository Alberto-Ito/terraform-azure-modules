resource "azurerm_data_factory" "datafactory" {
  name                = var.azurerm_data_factory_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
  
  identity {
    type               = "SystemAssigned"
  }

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
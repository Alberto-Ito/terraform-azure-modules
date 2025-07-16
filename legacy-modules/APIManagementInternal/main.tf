resource "azurerm_api_management" "apim0" {
  name                 = var.azurerm_api_management_name
  location             = var.location
  resource_group_name  = var.resource_group_name
  publisher_name       = var.publisher_name
  publisher_email      = var.publisher_email
  virtual_network_type = var.virtual_network_type
  sku_name             = var.sku_name
  tags                 = var.tags

  virtual_network_configuration {
    subnet_id = var.subnet_id
  }

  identity {
    type = "SystemAssigned"
  }

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
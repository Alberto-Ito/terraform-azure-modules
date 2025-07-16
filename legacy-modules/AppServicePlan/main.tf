resource "azurerm_app_service_plan" "appserviceplan" {
  name                = var.azurerm_app_service_plan_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

  sku {
    tier = var.tier
    size = var.size
  }

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
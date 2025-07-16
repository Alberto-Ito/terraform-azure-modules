resource "azurerm_app_service_plan" "appserviceplan" {
  name                = var.azurerm_app_service_plan_name
  location            = var.location
  resource_group_name = var.resource_group_name
  kind                = var.tier == "ElasticPremium" ? "elastic" : var.kind
  reserved            = var.is_linux
  per_site_scaling    = var.per_site_scaling
  tags                = var.tags
  zone_redundant      = var.zone_redundant

  sku {
    tier = var.tier
    size = var.size
    capacity = var.capacity
  }

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

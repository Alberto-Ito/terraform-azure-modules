resource "azurerm_signalr_service" "signalr" {
  name                = var.signalr_service_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

  sku {
    name     = var.sku
    capacity = var.capacity
  }

  cors {
    allowed_origins = var.allowed_origins
  }
}
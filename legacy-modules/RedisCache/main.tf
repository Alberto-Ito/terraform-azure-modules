resource "azurerm_redis_cache" "rediscache0" {
  name                = var.redis_cache_name
  location            = var.location
  resource_group_name = var.resource_group_name
  capacity            = var.capacity
  family              = var.family
  sku_name            = var.sku_name
  enable_non_ssl_port = false
  minimum_tls_version = var.minimum_tls_version
  tags                = var.tags

  redis_configuration {
  }

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

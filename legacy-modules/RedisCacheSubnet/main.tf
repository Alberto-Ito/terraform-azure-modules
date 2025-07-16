# Subnet is only available for Premium SKU
resource "azurerm_redis_cache" "rediscache0" {
  name                = var.redis_cache_name
  location            = var.location
  resource_group_name = var.resource_group_name
  capacity            = var.capacity
  family              = "P"
  sku_name            = "Premium"
  enable_non_ssl_port = false
  minimum_tls_version = var.minimum_tls_version
  tags                = var.tags
  subnet_id           = var.subnet_id

  redis_configuration {
  }

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
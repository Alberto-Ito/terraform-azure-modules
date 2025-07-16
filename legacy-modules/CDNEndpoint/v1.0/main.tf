resource "azurerm_cdn_endpoint" "endpoint" {
  name                = var.azurerm_cdn_endpoint_name
  profile_name        = var.cdn_profile_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

  # The set of origins of the CDN endpoint. When multiple origins exist, the first origin will be used as primary and rest will be used as failover options. 
  # Each origin block supports fields documented below.

  origin {
    name      = var.orgin_name
    host_name = var.orgin_host_name
  }

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

resource "azurerm_eventgrid_topic" "eventgrid" {
  name                          = var.eventgrid_name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  tags                          = var.tags
  public_network_access_enabled = var.public_network_access_enabled
  
  dynamic "inbound_ip_rule" {
    for_each = var.allowed_ips == null ? [] : var.allowed_ips
    content {
      ip_mask = inbound_ip_rule.value
    }
  
  }

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
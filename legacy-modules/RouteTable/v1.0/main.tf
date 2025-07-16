resource "azurerm_route_table" "routetable" {
  name                          = var.azurerm_route_table_name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  disable_bgp_route_propagation = var.disable_bgp_route_propagation
  tags                          = var.tags

  dynamic "route" {
    for_each = var.route_name == null ? [] : [var.route_name]

    content {
      name                   = var.route_name
      address_prefix         = var.address_prefix
      next_hop_type          = var.next_hop_type
      next_hop_in_ip_address = var.next_hop_in_ip_address
    }
  }

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

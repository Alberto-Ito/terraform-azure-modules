resource "azurerm_private_dns_zone_virtual_network_link" "dnszonevnetlink" {
  name                  = var.private_dns_zone_virtual_network_link_name
  resource_group_name   = var.virtual_network_resource_group_name
  private_dns_zone_name = var.private_dns_zone_name
  virtual_network_id    = var.virtual_network_id
  tags                  = var.tags

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
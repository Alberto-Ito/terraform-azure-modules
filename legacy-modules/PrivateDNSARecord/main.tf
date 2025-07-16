resource "azurerm_private_dns_a_record" "privatednsarecord" {
  name                = var.azurerm_private_dns_a_record_name
  zone_name           = var.zone_name
  resource_group_name = var.resource_group_name
  ttl                 = var.ttl
  records             = [var.records]
  tags                = var.tags

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
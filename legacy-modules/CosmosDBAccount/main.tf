resource "azurerm_cosmosdb_account" "cosmosdbaccount" {
  name                                  = var.azurerm_cosmosdb_account_name
  resource_group_name                   = var.resource_group_name
  location                              = var.location
  offer_type                            = var.offer_type
  kind                                  = var.kind
  enable_automatic_failover             = var.enable_automatic_failover
  tags                                  = var.tags
  public_network_access_enabled         = var.public_network_access_enabled
  is_virtual_network_filter_enabled     = var.is_virtual_network_filter_enabled
  network_acl_bypass_for_azure_services = true
  network_acl_bypass_ids                = var.network_acl_bypass_ids
  ip_range_filter                       = var.ip_range_filter

  consistency_policy {
    consistency_level = var.consistency_level
  }
  geo_location {
    location          = var.location
    failover_priority = 0
  }
  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

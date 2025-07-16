locals {
  allowed_subnet_ids = (var.allowed_subnet_ids == null) ? null : [for sn in var.allowed_subnet_ids : {
  action  = "Allow",
  subnet_id = sn
 }]
 allowed_ip_ranges = (var.ip_ranges == null) ? null : [for ip in var.ip_ranges : {
  action  = "Allow",
  ip_range = ip
 }]
}

resource "azurerm_container_registry" "containerregistry" {
  name                     = var.container_registry_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  sku                      = var.sku                      #"Premium"
  admin_enabled            = var.admin_enabled            #false
  georeplication_locations = var.georeplication_locations #["East US", "West Europe"]
  tags                     = var.tags

network_rule_set {
    default_action  = (local.allowed_subnet_ids == null && local.allowed_ip_ranges == null) ? "Allow" : "Deny"
    ip_rule        = local.allowed_ip_ranges
    virtual_network = local. allowed_subnet_ids
 }
  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
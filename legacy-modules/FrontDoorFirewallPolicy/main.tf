resource "azurerm_frontdoor_firewall_policy" "frontdoor_firewall_policy" {
  name                = var.front_door_firewall_policy_name
  resource_group_name = var.resource_group_name
  enabled             = true
  mode                = "Detection"
  tags                = var.naming.tags
}

output "id" {
  description = "The ID of the FrontDoor Firewall Policy."
  value       = azurerm_frontdoor_firewall_policy.frontdoor_firewall_policy.id
}

output "name" {
  description = "The name of the FrontDoor Firewall Policy."
  value       = azurerm_frontdoor_firewall_policy.frontdoor_firewall_policy.name
}

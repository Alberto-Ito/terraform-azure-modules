output "name" {
  description = "The name of the resoruce created."
  value       = azurerm_subnet.snet.name
}

output "id" {
  description = "The id of the resource created."
  value       = azurerm_subnet.snet.id
}

output "address_prefixes" {
  description = "The address prefixes for the subnet"
  value = azurerm_subnet.snet.address_prefixes
}
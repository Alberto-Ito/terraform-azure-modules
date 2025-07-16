output "name" {
  description = "The name of the resoruce created."
  value       = azurerm_virtual_network.vnet.name
}

output "id" {
  description = "The id of the resource created."
  value       = azurerm_virtual_network.vnet.id
}
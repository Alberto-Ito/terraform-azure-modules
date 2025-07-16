output "name" {
  description = "The name of the created resource group."
  value       = azurerm_virtual_network.vnet.name
}

output "id" {
  description = "The id of the resource created."
  value       = azurerm_virtual_network.vnet.id
}
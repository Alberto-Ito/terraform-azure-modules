output "name" {
  description = "The name of the resoruce created."
  value       = azurerm_virtual_network.vnet.name
}

output "id" {
  description = "The id of the resource created."
  value       = azurerm_virtual_network.vnet.id
}

output "guid" {
  description = "The GUID of the virtual network."
  value       = azurerm_virtual_network.vnet.guid
}
output "name" {
  description = "The name of the created resource group."
  value       = azurerm_resource_group.rg.name
}

output "id" {
  description = "The ID of the Resource Group."
  value       = azurerm_resource_group.rg.id
}
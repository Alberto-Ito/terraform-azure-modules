output "name" {
  description = "The name of the management group created."
  value       = "azurerm_management_group.parent.display_name"
}

output "id" {
  description = "The name of the management group created."
  value       = "azurerm_management_group.parent.id"
}

output "childname" {
  description = "The name of the child management group created."
  value       = "azurerm_management_group.child_name"
}
output "name" {
  description = "VM Name"
  value       = azurerm_windows_virtual_machine.winvm0000.name
}

output "id" {
  description = "The id of the resource created."
  value       = azurerm_windows_virtual_machine.winvm0000.id
}

output "name" {
    description = "VM Name"
   value = azurerm_windows_virtual_machine.winvm0000.name
}

output "id" {
  description = "The id of the resource created."
  value       = azurerm_windows_virtual_machine.winvm0000.id
}

output "object_id" {
  description = "The object id of the resource created."
  value       =  var.use_managed_identity ? azurerm_windows_virtual_machine.winvm0000.identity[0].principal_id : null
}
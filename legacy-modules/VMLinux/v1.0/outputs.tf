output "name" {
    description = "VM Name"
   value = azurerm_linux_virtual_machine.linuxvm001.name
}

output "id" {
  description = "The id of the resource created."
  value       = azurerm_linux_virtual_machine.linuxvm001.id
}

output "object_id" {
  description = "The object id of the resource created."
  value       =  var.use_managed_identity ? azurerm_linux_virtual_machine.linuxvm001.identity[0].principal_id : null
}
# todo: delete this module once it's applied in IaC repo

output "name" {
    description = "VM Name"
    value       = azurerm_windows_virtual_machine.winvm0000.name
}
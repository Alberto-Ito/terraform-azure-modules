output "name" {
  description = "The name of the resoruce created."
  value       = azurerm_recovery_services_vault.vault.name
}

output "id" {
  description = "The id of the resource created."
  value       = azurerm_recovery_services_vault.vault.id
}
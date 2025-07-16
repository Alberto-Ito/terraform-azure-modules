output "id" {
  description = "The user assigned identity ID."
  value       = azurerm_user_assigned_identity.managedid0.id
}

output "principal_id" {
  description = "Service Principal ID associated with the user assigned identity."
  value       = azurerm_user_assigned_identity.managedid0.principal_id
}

output "client_id" {
  description = "Client ID associated with the user assigned identity."
  value       = azurerm_user_assigned_identity.managedid0.client_id
}

output "name" {
  description = "The name of the user assigned identity."
  value       = azurerm_user_assigned_identity.managedid0.name
}

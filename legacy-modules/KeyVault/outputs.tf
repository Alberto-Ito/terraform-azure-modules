output "name" {
  description = "The name of the key vault created."
  value       = azurerm_key_vault.keyvault.name
}

output "id" {
  description = "The id of the key vault created."
  value       = azurerm_key_vault.keyvault.id
}

output "url" {
  description   = "The url of the key vault created."
  value         = azurerm_key_vault.keyvault.vault_uri
  sensitive     = true
}
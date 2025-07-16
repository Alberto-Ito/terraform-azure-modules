output "id" {
  description = "The Key Vault Certificate ID."
  value       = azurerm_key_vault_certificate.certificate.id
}

output "name" {
  description = "The Key Vault Certificate Name."
  value       = azurerm_key_vault_certificate.certificate.name
}

output "secret_id" {
  description = "The ID of the associated Key Vault Secret."
  value       = azurerm_key_vault_certificate.certificate.secret_id
}
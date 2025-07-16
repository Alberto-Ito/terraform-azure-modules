output "name" {
  description = "Specifies the name of the certificate"
  value       = azurerm_key_vault_certificate.example.name
}

output "id" {
  description = "Specifies the id of the certificate"
  value       = azurerm_key_vault_certificate.example.id
}

output "thumbprint" {
  description = "Specifies the thumbprint of the certificate"
  value       = azurerm_key_vault_certificate.example.thumbprint
}

output "certificate_data" {
  description = "Specifies the value of the certificate"
  value       =  azurerm_key_vault_certificate.example.certificate_data
}


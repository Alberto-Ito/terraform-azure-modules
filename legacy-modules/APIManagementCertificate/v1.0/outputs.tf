output "id" {
  description = "The ID of the API Management Certificate."
  value       = azurerm_api_management_certificate.api_certificate.id
}

output "expiration" {
  description = "The Expiration Date of this Certificate, formatted as an RFC3339 string."
  value       = azurerm_api_management_certificate.api_certificate.expiration
}

output "subject" {
  description = "The Subject of this Certificate."
  value       = azurerm_api_management_certificate.api_certificate.subject
}

output "thumbprint" {
  description = "The Thumbprint of this Certificate."
  value       = azurerm_api_management_certificate.api_certificate.thumbprint
  sensitive   = true
}

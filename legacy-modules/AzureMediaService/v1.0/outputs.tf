output "name" {
  description = "Specifies the name of the azure media service account."
  value       = azurerm_media_services_account.ams_account.name
}

output "id" {
  description = "Specifies the id of the azure media service account."
  value       = azurerm_media_services_account.ams_account.id
}

output "principal_id" {
  description = "The Principal ID associated with this Managed Service Identity."
  value       = azurerm_media_services_account.ams_account.identity[*].principal_id
}
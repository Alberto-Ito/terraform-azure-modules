output "name" {
  description = "Specifies the name of the App Configuration"
  value       = azurerm_app_configuration.appconf.name
}

output "id" {
  description = "Specifies the id of the App Configuration"
  value       = azurerm_app_configuration.appconf.id
}

output "url" {
  description = "Specifies the url of the App Configuration"
  value       = azurerm_app_configuration.appconf.endpoint
}

output "principal_id" {
  description = "The ID of the Principal (Client) in Azure Active Directory."
  value       = azurerm_app_configuration.appconf.identity.0.principal_id
}

output "primary_read_key_connection_string" {
  description = "The Primary Read Key Connection String to App Configuration"
  value       = azurerm_app_configuration.appconf.primary_read_key.0.connection_string
  sensitive   = true
}
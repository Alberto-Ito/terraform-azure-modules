output "name" {
  description = "Specifies the name of the App Service"
  value       = azurerm_app_service.appservice.name
}

output "id" {
  description = "Specifies the id of the App Service"
  value       = azurerm_app_service.appservice.id
}

output "principal_id" {
  description = "The Principal ID for the Service Principal associated with the Managed Service Identity of this App Service."
  value       = azurerm_app_service.appservice.identity[*].principal_id
}

output "default_site_hostname" {
  description = "The Default Hostname associated with the App Service - such as mysite.azurewebsites.net"
  value       = azurerm_app_service.appservice.default_site_hostname
}

output "outbound_ip_addresses" {
  description = "A comma separated list of outbound IP addresses."
  value       = azurerm_app_service.appservice.outbound_ip_addresses
}

output "possible_outbound_ip_addresses" {
  description = "A comma separated list of outbound IP addresses - such as 52.23.25.3,52.143.43.12,52.143.43.17 - not all of which are necessarily in use. Superset of outbound_ip_addresses."
  value       = azurerm_app_service.appservice.possible_outbound_ip_addresses
}

output "app_settings" {
  description = "A key-value pair of App Settings."
  sensitive   = true
  value       = azurerm_app_service.appservice.app_settings
}

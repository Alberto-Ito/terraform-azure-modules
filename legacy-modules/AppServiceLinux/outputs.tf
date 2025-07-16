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
output "name" {
  description = "Specifies the name of the API Management"
  value       = azurerm_api_management.apim0.name
}

output "id" {
  description = "Specifies the id of the API Management"
  value       = azurerm_api_management.apim0.id
}

output "gateway_url" {
  value = azurerm_api_management.apim0.gateway_url
}

output "management_api_url" {
  value = azurerm_api_management.apim0.management_api_url
}

output "portal_url" {
  value = azurerm_api_management.apim0.portal_url
}

output "developer_portal_url" {
  value = azurerm_api_management.apim0.developer_portal_url
}

output "public_ip_addresses" {
  value = azurerm_api_management.apim0.public_ip_addresses
}

output "private_ip_addresses" {
  value = azurerm_api_management.apim0.private_ip_addresses
}

output "scm_url" {
  value = azurerm_api_management.apim0.scm_url
}

output "identity" {
  description = "Specifies the identity of the API Management"
  value       = azurerm_api_management.apim0.identity[0].principal_id
}

output "principal_id" {
  value = azurerm_api_management.apim0.identity[*].principal_id
}

output "primary_key" {
  value = azurerm_api_management.apim0.tenant_access[0].primary_key
}

output "secondary_key" {
  value = azurerm_api_management.apim0.tenant_access[0].secondary_key
}

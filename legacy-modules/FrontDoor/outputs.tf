output "name" {
  description = "Specifies the name of the Front Door service. Must be globally unique. Changing this forces a new resource to be created."
  value       = azurerm_frontdoor.frontdoor.name
}

output "host_names" {
  description = "Specifies the host names of the frontend_endpoint. Must be a domain name. In order to use a name.azurefd.net domain, the name value must match the Front Door name"
  value       = azurerm_frontdoor.frontdoor.frontend_endpoint[*].host_name
}

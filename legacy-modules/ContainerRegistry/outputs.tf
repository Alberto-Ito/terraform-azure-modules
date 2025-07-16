output "url" {
  value       = azurerm_container_registry.containerregistry.login_server
  description = "The URL that can be used to log into the container registry."
}

output "name" {
  value       = azurerm_container_registry.containerregistry.name
  description = "The Container registry name."
}


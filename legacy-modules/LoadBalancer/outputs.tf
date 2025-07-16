output "id" {
  description = "The Load Balancer ID."
  value       = azurerm_lb.lb0.id
}

output "frontend_ip_configuration_id" {
  description = "The id of the Frontend IP Configuration."
  value       = azurerm_lb.lb0.frontend_ip_configuration[0].id
}

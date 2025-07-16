output "name" {
  description = "The name of the created resource group."
  value       = azurerm_network_security_rule.nsgrule.name
}
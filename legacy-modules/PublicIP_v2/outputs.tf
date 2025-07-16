output "name" {
  description = "The name of the public ip created."
  value       = azurerm_public_ip.publicip.name
}

output "id" {
  description = "The id of the public ip created."
  value       = azurerm_public_ip.publicip.id
}

output "fqdn" {
  description = "The fqdn of the public ip created."
  value       = azurerm_public_ip.publicip.fqdn
}

output "ip_address" {
  description = "The address of the public ip created."
  value       = azurerm_public_ip.publicip.ip_address
}
output "name" {
  description = "The name of the private DNS zone created."
  value       = azurerm_private_dns_zone.privatednszone.name
}

output "id" {
  description = "The Private DNS Zone ID."
  value       = azurerm_private_dns_zone.privatednszone.id
}
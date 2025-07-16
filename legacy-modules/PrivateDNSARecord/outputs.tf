output "name" {
  description = "The name of the private DNS A record created."
  value       = azurerm_private_dns_a_record.privatednsarecord.name
}
output "vnet" {
  value       = data.azurerm_virtual_network.vnet
  description = "VNET object."
}

output "subnets" {
  value       = data.azurerm_subnet.subnets
  description = "Subnet object list (filtered by suffix if a suffix_names was used)."
}

output "subnets_by_suffix" {
  value       = local.subnets_by_suffix
  description = "A map of suffix to list of subnet objects."
}

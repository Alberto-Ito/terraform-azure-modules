output "id" {
  description   = "The ID of the Subnet."
  value         = azurerm_subnet_network_security_group_association.networksecuritygroupassociation.id
}

output "network_security_group_id" {
  description = "The ID of the Network Security Group which should be associated with the Subnet. Changing this forces a new resource to be created."
  value       = azurerm_subnet_network_security_group_association.networksecuritygroupassociation.network_security_group_id
}

output "subnet_id" {
  description = "The ID of the Subnet. Changing this forces a new resource to be created."
  value       = azurerm_subnet_network_security_group_association.networksecuritygroupassociation.subnet_id
}
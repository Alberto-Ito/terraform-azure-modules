variable "azurerm_private_dns_zone_name" {
  description = "The name of the DNS Zone. Must be a valid domain name."
}

variable "resource_group_name" {
  description = "pecifies the resource group where the resource exists. Changing this forces a new resource to be created."
}

variable "tags" {
}
variable "private_dns_zone_virtual_network_link_name" {
  description = "The name of the Private DNS Zone Virtual Network Link. Changing this forces a new resource to be created."
}

variable "virtual_network_resource_group_name" {
  description = "Specifies the resource group where the Private DNS Zone Virtual Network Link will be created exists. Changing this forces a new resource to be created."
}

variable "virtual_network_id" {
  description = "The ID of the Virtual Network that should be linked to the DNS Zone. Changing this forces a new resource to be created."
}

variable "private_dns_zone_name" {
  description = "The name of the Private DNS zone (without a terminating dot). Changing this forces a new resource to be created."
}

variable "tags" {
}

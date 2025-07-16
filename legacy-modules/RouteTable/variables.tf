variable "resource_group_name" {
  description = "The resource group name."
}

variable "location" {
  description = "The region were the resource will be deployed."
}

variable "azurerm_route_table_name" {
  description = "The name of the route table. Changing this forces a new resource to be created."
}

variable "disable_bgp_route_propagation" {
  description = "Boolean flag which controls propagation of routes learned by BGP on that route table. True means disable."
}

# variable "route_name" {
#   description = "he name of the route."
# }

# variable "address_prefix" {
#   description = "The destination CIDR to which the route applies, such as 10.1.0.0/16"
# }

# variable "next_hop_type" {
#   description = "The type of Azure hop the packet should be sent to. Possible values are VirtualNetworkGateway, VnetLocal, Internet, VirtualAppliance and None."
# }

# variable "next_hop_in_ip_address" {
#   description = " Contains the IP address packets should be forwarded to. Next hop values are only allowed in routes where the next hop type is VirtualAppliance."
# }

variable "tags" {
}
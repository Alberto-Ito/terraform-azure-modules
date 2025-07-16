variable "resource_group_name" {
  description = "The resource group name."
}

variable "route_table_name" {
  description = "The name of the route table. Changing this forces a new resource to be created."
}

variable "route_name" {
  description = "he name of the route."
  default = null
}

variable "address_prefix" {
  description = "The destination CIDR to which the route applies, such as 10.1.0.0/16"
  default = null
}

variable "next_hop_type" {
  description = "The type of Azure hop the packet should be sent to. Possible values are VirtualNetworkGateway, VnetLocal, Internet, VirtualAppliance and None."
  default = "None"
}

variable "next_hop_in_ip_address" {
  description = " Contains the IP address packets should be forwarded to. Next hop values are only allowed in routes where the next hop type is VirtualAppliance."
  default = null
}

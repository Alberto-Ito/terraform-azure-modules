variable "azurerm_private_link_service_name" {
  description = "Specifies the name of this Private Link Service. Changing this forces a new resource to be created."
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
  description = "The name of the Resource Group where the Private Link Service should exist. Changing this forces a new resource to be created."
}

variable "subnet_id" {
  description = "The ID of the Subnet from which Private IP Addresses will be allocated for this Private Endpoint. Changing this forces a new resource to be created."
}

variable "azurerm_public_ip_name" {
  description = "Specifies the name which should be used for the NAT IP Configuration. Changing this forces a new resource to be created."
}

variable "frontend_ip_configuration_id" {
  description = "A list of Frontend IP Configuration ID's from a Standard Load Balancer, where traffic from the Private Link Service should be routed. You can use Load Balancer Rules to direct this traffic to appropriate backend pools where your applications are running."
}

variable "tags" {
}

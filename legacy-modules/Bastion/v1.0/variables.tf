variable "bastion_host_name" {
    description = "Specifies the name of the Bastion Host. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
    description = "The name of the resource group in which to create the Bastion Host."
}

variable "location" {
    description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "ip_configuration_name" {
    description = "A ip_configuration block as defined below."
}

variable "subnet_id" {
    description = "Reference to a subnet in which this Bastion Host has been created."
}

variable "public_ip_address_id" {
    description = "Reference to a Public IP Address to associate with this Bastion Host."
}

variable "tags" {
}
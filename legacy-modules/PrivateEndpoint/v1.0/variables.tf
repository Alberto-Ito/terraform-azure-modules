# Target Private DNS Zone

# variable "azurerm_private_dns_zone_name" {
#     description = "The name of the Private DNS Zone."
# }

# variable "private_dns_zone_resource_group_name" {
#     description = "The Name of the Resource Group where the Private DNS Zone exists. If the Name of the Resource Group is not provided, the first Private DNS Zone from the list of Private DNS Zones in your subscription that matches name will be returned."
# }

variable "azurerm_private_endpoint_name" {
    description = "Specifies the Name of the Private Endpoint. Changing this forces a new resource to be created."
}

variable "location" {
    description =   "The supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
    description = "Specifies the Name of the Resource Group within which the Private Endpoint should exist. Changing this forces a new resource to be created."
}

variable "subnet_id" {
    description = "The ID of the Subnet from which Private IP Addresses will be allocated for this Private Endpoint. Changing this forces a new resource to be created."
}

#  private_service_connection block 

variable "private_service_connection_name" {
    description = "Specifies the Name of the Private Service Connection. Changing this forces a new resource to be created."
}

variable "private_connection_resource_id" {
    description = "The ID of the Private Link Enabled Remote Resource which this Private Endpoint should be connected to. Changing this forces a new resource to be created."
}

variable "subresource_names" {
    description = "A list of subresource names which the Private Endpoint is able to connect to. subresource_names corresponds to group_id. Changing this forces a new resource to be created."
    default = null
}

variable "private_dns_zone_group_name" {
    description = "Specifies the Name of the Private DNS Zone Group. Changing this forces a new private_dns_zone_group resource to be created."
}

variable "private_dns_zone_ids" {
    description = "Specifies the list of Private DNS Zones to include within the private_dns_zone_group."
}

variable "tags" {
}
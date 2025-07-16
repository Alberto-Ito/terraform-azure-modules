variable "azurerm_private_dns_a_record_name" {
    description =   "The name of the DNS A Record."
}

variable "zone_name" {
    description = "Specifies the Private DNS Zone where the resource exists. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
    description = ""
}

variable "ttl" {
    description = "The Time To Live (TTL) of the DNS record in seconds."
    default = "300"
}

variable "records" {
    description = "List of IPv4 Addresses."
}

variable "tags" {
}
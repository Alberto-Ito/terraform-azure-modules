variable "resource_group_name" {
  description = "The resource group name."
}

variable "location" {
  description = "The region were the resource will be deployed."
}

variable "azurerm_public_ip_prefix_name" {
  description = "Specifies the name of the Public IP Prefix resource. Changing this forces a new resource to be created."
}

variable "prefix_length" {
  description = "Specifies the number of bits of the prefix. The value can be set between 0 (4,294,967,296 addresses) and 31 (2 addresses). Defaults to 28(16 addresses). Changing this forces a new resource to be created."
}

variable "zones" {
   description =   "A collection containing the availability zone to allocate the Public IP Prefix in."
}

variable "tags" {
}

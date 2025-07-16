variable "azurerm_public_ip_name" {
  description = "Specifies the name of the public IP address."
}

variable "public_ip_resource_group_name" {
  description = "The resource group name where the public ip resides."
}

variable "azurerm_public_ip_prefix_name" {
  description = "Specifies the name of the Public IP Prefix resource."
}

variable "public_ip_prefix_resource_group" {
  description = "The resource group name where the public ip prefix resides."
}

variable "resource_group_name" {
  description = "The resource group name."
}
variable "location" {
  description = "The region were the resource will be deployed."
}
variable "azurerm_nat_gateway_name" {
  description = "Specifies the name of the NAT Gateway. Changing this forces a new resource to be created."
}

variable "idle_timeout_in_minutes" {
  description = "The idle timeout which should be used in minutes. Defaults to 4."
  default     = "4"
}
variable "zones" {
  description = "A list of availability zones where the NAT Gateway should be provisioned. Changing this forces a new resource to be created."
  default     = "1"
}

variable "tags" {
}

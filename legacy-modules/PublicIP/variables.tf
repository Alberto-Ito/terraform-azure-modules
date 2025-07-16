variable "resource_group_name" {
  description = "The resource group name."
}

variable "location" {
  description = "The region were the resource will be deployed."
}

variable "azurerm_public_ip_name" {
  description = "The public ip resource name."
}

variable "allocation_method" {
  description = "The allocation type, static or dynamic."
  default     = "Dynamic"
}

variable "sku" {
  description = "The public IP sku, Basic or Standard. "
}

variable "zones" {
  description = "A collection containing the availability zone to allocate the Public IP in."
  default     = "1"
}

variable "domain_name_label" {
  description = "Label for the Domain Name. Will be used to make up the FQDN. If a domain name label is specified, an A DNS record is created for the public IP in the Microsoft Azure DNS system."
  default = null
}

variable "tags" {
}
variable "resource_group_name" {
  description = "The resource group name."
}
variable "location" {
  description = "The region were the resource will be deployed."
}

variable "azurerm_api_management_name" {
  description = "The name of the API Management Service. Changing this forces a new resource to be created."
}

variable "publisher_name" {
  description = "The name of publisher/company."
}

variable "publisher_email" {
  description = "The email of publisher/company."
}

variable "sku_name" {
  description = "sku_name is a string consisting of two parts separated by an underscore(_). The fist part is the name, valid values include: Consumption, Developer, Basic, Standard and Premium. The second part is the capacity (e.g. the number of deployed units of the sku), which must be a positive integer (e.g. Developer_1)."
  default     = "Developer_1"
}

variable "virtual_network_type" {
  description = "The type of virtual network you want to use, valid values include: None, External, Internal."
  default     = "Internal"
}

variable "subnet_id" {
  description = "The id of the subnet that will be used for the API Management."
}

variable "tags" {
}
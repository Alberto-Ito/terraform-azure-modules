variable "resource_group_name" {
  description = "The resource group name."
}

variable "name" {
  description = "The name of the API Management Named Value. Changing this forces a new resource to be created. This is also the name of the secret in case the value is pulled from a key vault."
}

variable "azurerm_api_management_name" {
  description = "The name of the API Management Service. Changing this forces a new resource to be created."
}

variable "display_name" {
  description = "The display name of this API Management Named Value."
}

variable "value" {
  description = " The value of this API Management Named Value."
  default = ""
}

variable "key_vault_name" {
  description = "Specifies the name of the Key vault instance to pull the secret from."
  default     = ""
}

variable "tags" {
}
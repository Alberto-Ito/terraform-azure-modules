variable "resource_group_name" {
  description = "The resource group name."
}

variable "product_id" {
  description = "The ID of the API Management Product within the API Management Service. Changing this forces a new resource to be created."
}

variable "azurerm_api_management_name" {
  description = "The name of the API Management Service. Changing this forces a new resource to be created."
}

variable "display_name" {
  description = "The Display Name for this API Management Product."
}

variable "published" {
  description = "Is this Product Published? Defaults to false."
  default = false
}

variable "subscription_required" {
  description = "Deprecated."
  default = false
}

variable "approval_required" {
  description = "Do subscribers need to be approved prior to being able to use the Product? Defaults to false."
  default = false
}

variable "api_names" {
  type = list(string)
  description = "The list of name of the APIs to be imported in API Management Product."
}

variable "groups" {
  type = list(string)
  description = "The list of groups to be assigned in access policy in API Management Product. 'Administrators' group is assigned by default to all newly created products."
}
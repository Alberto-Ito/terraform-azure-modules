variable "resource_group_name" {
  description = "The resource group name."
}
variable "location" {
  description = "The region were the resource will be deployed."
}

variable "tags" {
}

variable "sku_name" {
  description = "The SKU's capacity for platform size and catalog capabilities. Accepted values are Standard_1, Standard_4 and Standard_16."
  default = "Standard_4"
}

variable "purview_account_name" {
  description = "The name which should be used for this Purview Account. Changing this forces a new Purview Account to be created."
}

variable "public_network_enabled" {
  description = "Should the Purview Account be visible to the public network? Defaults to true"
  default = true
}
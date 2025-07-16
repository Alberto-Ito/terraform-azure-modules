variable "azurerm_cdn_profile_name" {
  description = "Specifies the name of the CDN Profile. Changing this forces a new resource to be created."
}
variable "resource_group_name" {
  description = "The resource group name."
}
variable "location" {
  description = "The region were the resource will be deployed."
}
variable "sku" {
  description = "The pricing related information of current CDN profile. Accepted values are Standard_Akamai, Standard_ChinaCdn, Standard_Microsoft, Standard_Verizon or Premium_Verizon."
}
variable "tags" {
}

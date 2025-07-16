variable "azurerm_automation_account_name" {
  description = "Specifies the name of the Automation Account. Changing this forces a new resource to be created."
}
variable "resource_group_name" {
  description = "The resource group name."
}
variable "location" {
  description = "The region were the resource will be deployed."
}
variable "tags" {
}
variable "resource_group_name" {
  description = "The resource group name."
}
variable "location" {
  description = "The region were the resource will be deployed."
}

variable "azurerm_storage_account_name" {
  description = "The storage account name."
}

variable "storagergName" {
  description = "The resource group where the storage account resides."
}

variable "appserviceplanrgName" {
  description = "The resource group where the app service plan resides."
}

variable "azurerm_app_service_plan_name" {
  description = "The name of the app service plan."
}

variable "azurerm_function_app_name" {
    description = "The name of the function app."
}

variable "tags" {
}
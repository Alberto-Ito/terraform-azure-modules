variable "resource_group_name" {
  description = "The resource group name."
}

variable "azurerm_data_factory_name" {
  description = "The data factory name."
}

variable "azurerm_key_vault_name" {
    description = " The key vault name."
}

variable "key_vault_resource_group_name" {
  description = "The resource group name where the key vault lives."
}

variable "azurerm_key_vault_secret0" {
    description = " The first key vault secret."
}

variable "azurerm_data_factory_linked_service_azure_function_name" {
    description = "This is the function app linked service name."
}

variable "azurerm_function_app_name" {
    description = "The name of the function app."
}

variable "function_app_resource_group_name" {
    description = "This is the name of where the function app resides."
}
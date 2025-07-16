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

variable "data_factory_linked_service_key_vault_name" {
  description = "Specifies the name of the Data Factory Linked Service Key Vault. Changing this forces a new resource to be created. Must be globally unique. See the Microsoft documentation for all restrictions."
}
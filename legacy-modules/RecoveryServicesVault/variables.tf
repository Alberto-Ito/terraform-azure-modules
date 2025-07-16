variable "resource_group_name" {
  description = "The resource group name."
}

variable "location" {
  description = "The region were the resource will be deployed."
}

variable "azurerm_recovery_services_vault_name" {
  description = "The recvoery services vault name."
}

variable "sku" {
  description = "The sku, RS0 or Standard. "
  default     = "Standard"
}

variable "tags" {
}
variable "resource_group_name" {
  description = "The resource group name."
}
variable "location" {
  description = "The region were the resource will be deployed."
}

variable "storage_account_name" {
  description = "The storage account name."
}

variable "storage_account_primary_key" {
  description = "The storage account primary key."
}

variable "app_service_plan_id" {
  description = "The resource group where the app service plan resides."
}

variable "azurerm_function_app_name" {
    description = "The name of the function app."
}

variable "identity_type" {
    description = "(Required) Specifies the identity type of the App Service. Possible values are SystemAssigned (where Azure will generate a Service Principal for you), UserAssigned where you can specify the Service Principal IDs in the identity_ids field, and SystemAssigned, UserAssigned which assigns both a system managed identity as well as the specified user assigned identities."
    default = "SystemAssigned"
}

variable "tags" {
}
variable "azurerm_media_services_account_name" {
  description = "The name for the azure media service account."
}
variable "resource_group_name" {
  description = "The resource group name."
}
variable "location" {
  description = "The region were the resource will be deployed."
}
variable "storage_account_id" {
  description = "Specifies the ID of the Storage Account that will be associated with the Media Services instance."
}
variable "storage_account_is_primary" {
  description = "Specifies whether the storage account should be the primary account or not. Defaults to false."
}
variable "tags" {
}
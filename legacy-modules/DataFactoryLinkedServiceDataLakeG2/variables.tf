variable "azurerm_data_factory_linked_service_data_lake_storage_gen2_name" {
  description = "The data factory linked service data lake storage gen 2 name."
}

variable "resource_group_name" {
  description = "The resource group name."
}
# variable "location" {
#   description = "The region were the resource will be deployed."
# }

variable "azurerm_data_factory_name" {
  description = "The data factory name."
}

# variable "service_principal_key" {
#     description = "This is the service principal key"
# }

# variable "tenant" {
#     description = "The tenant information."
# }

# variable "url" {
#     description = "The data lake storage url."
# }
variable "data_lake_gen2_resource_group_name" {
  description = "The resource group name where the data lake gen 2 resides."
}

# variable "azurerm_key_vault_name" {
#   description = " The key vault name."
# }

# variable "key_vault_resource_group_name" {
#   description = "The resource group name where the key vault lives."
# }

variable "service_principal_id" {
  description = "The service principal id in which to authenticate against the Azure Data Lake Storage Gen2 account. Required if use_managed_identity is true."
}

variable "service_principal_key" {
  description = "The service principal key in which to authenticate against the Azure Data Lake Storage Gen2 account. Required if use_managed_identity is true."
}

variable "azurerm_storage_account_data_lake_name" {
  description = "The data lake storage account name."
}
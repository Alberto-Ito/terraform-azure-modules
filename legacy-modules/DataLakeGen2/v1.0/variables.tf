variable "resource_group_name" {
  description = "The resource group name."
}
variable "location" {
  description = "The region were the resource will be deployed."
}

variable "azurerm_storage_account_data_lake_name" {
  description = "The data lake storage account name."
}

variable "account_tier" {
  description = " The access tier for the storage account."
  default     = "Standard"
}

variable "account_replication_type" {
  default = "LRS"
}

# variable "azurerm_storage_dlfs2_container_name" {
#   description = "The name of the Data Lake Gen 2 FS container which should be created within the Storage Account."
# }

variable "min_tls_version" {
   default =   "TLS1_2"
}

variable "tags" {
}
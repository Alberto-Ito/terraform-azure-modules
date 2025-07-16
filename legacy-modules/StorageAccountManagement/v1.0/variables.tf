variable "azurerm_storage_account_name" {
  description = "The storage account name."
}

variable "storagergName" {
  description = "The resource group where the storage account resides."
}

variable "prefix_match1" {
  description = "An array of strings for prefixes to be matched. Example: container1/prefix1"
}

variable "rule1_name" {
  description = "The name of the rule number 1."
}

variable "prefix_match2" {
  description = "An array of strings for prefixes to be matched. Example: container1/prefix1"
}

variable "rule2_name" {
  description = "The name of the rule number 2."
}
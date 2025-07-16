variable "resource_group_name" {
  description = "The resource group name."
}
variable "location" {
  description = "The region were the resource will be deployed."
}

variable "azurerm_key_vault_name" {
  description = "The key vault name."
}

# Permissions object, list of permissions.
# PERMISSIONS OBJECT
# Name	        Type	Required	Value
# keys	        array	No	        Permissions to keys - encrypt, decrypt, wrapKey, unwrapKey, sign, verify, get, list, create, update, import, delete, backup, restore, recover, purge
# secrets	    array	No	        Permissions to secrets - get, list, set, delete, backup, restore, recover, purge
# certificates	array	No	        Permissions to certificates - get, list, delete, create, import, update, managecontacts, getissuers, listissuers, setissuers, deleteissuers, manageissuers, recover, purge, backup, restore
# storage	    array	No	        Permissions to storage accounts - get, list, delete, set, update, regeneratekey, recover, purge, backup, restore, setsas, listsas, getsas, deletesas

variable "key_permissions" {
  default = ["get", "list"]
}

variable "secret_permissions" {
  default = ["get", "list"]
}

variable "storage_permissions" {
  default = ["get", "listsas"]
}

variable "certificate_permissions" {
  default = ["get", "list"]
}

variable "default_action" {
  description = "The Default Action to use when no rules match from ip_rules / virtual_network_subnet_ids. Possible values are Allow and Deny."
  default     = "Deny"
}

variable "bypass" {
  description = "Specifies which traffic can bypass the network rules. Possible values are AzureServices and None."
  default     = "AzureServices"
}

variable "ip_rules" {
  description = "One or more IP Addresses, or CIDR Blocks which should be able to access the Key Vault."
}

variable "virtual_network_subnet_ids" {
  description = "One or more Subnet ID's which should be able to access this Key Vault."
}

variable "tags" {
}

variable "diagnostic_logs_name" {
  description = "The name for the diagnostic logs mandatory configuration."
}
variable "diagnostic_logs_storage_account_id" {
  description = "The storage account id to storage the dagnostic logs."
}

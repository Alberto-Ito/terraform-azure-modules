variable "resource_group_name" {
  description = "The resource group name."
}
variable "location" {
  description = "The region were the resource will be deployed."
}

# Pass tenant_id and object_id to avoid a terraform data module call
variable "tenant_id" {
  description = "The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault."
  default     = "e898ff4a-4b69-45ee-a3ae-1cd6f239feb2"
}

# Pass tenant_id and object_id to avoid a terraform data module call
variable "object_id" {
  description = "The object ID of a user, service principal or security group in the Azure Active Directory tenant for the vault. The object ID must be unique for the list of access policies."
  default     = null
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
  # Key Permissions for the underlying TF service principal
  # Default value for backwards compatibility
  default = [
    "Create", "Decrypt", "Delete", "Encrypt",
    "Get", "Import", "List", "Recover", "Restore",
    "Sign", "UnwrapKey", "Update", "Verify", "WrapKey"
  ]
}

variable "secret_permissions" {
  # Secret Permissions for the underlying TF service principal
  # Default value for backwards compatibility
  default = [
    "Delete", "get", "list", "recover", "restore", "set", "backup"
  ]
}

variable "storage_permissions" {
  # Storage Permissions for the underlying TF service principal
  # Default value for backwards compatibility
  default = [
    "Backup", "Delete", "DeleteSAS", "Get", "GetSAS",
    "List", "ListSAS", "Recover", "RegenerateKey", "Restore",
    "Set", "SetSAS", "Update"
  ]
}

variable "certificate_permissions" {
  # Certificate Permissions for the underlying TF service principal
  # Default value for backwards compatibility
  default = [
    "Create", "Delete", "DeleteIssuers", "Get", "GetIssuers",
    "Import", "List", "ListIssuers", "ManageContacts", "ManageIssuers",
    "Recover", "Restore", "SetIssuers", "Update"
  ]
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
  default     = null
}

variable "virtual_network_subnet_ids" {
  description = "One or more Subnet ID's which should be able to access this Key Vault."
  default     = null
}

variable "tags" {
}

variable "diagnostic_logs_name" {
  description = "The name for the diagnostic logs mandatory configuration."
}
variable "diagnostic_logs_storage_account_id" {
  description = "The storage account id to storage the dagnostic logs."
  type        = string
  default     = null
}
variable "diagnostic_logs_analytics_workspace_id" {
  description = "(Optional) The logs analytics workspace id to store the diagnostic logs. Required if 'diagnostic_logs_storage_account_id' is not provided."
  type        = string
  default     = null
}

variable "enabled_for_template_deployment" {
  description = "Boolean flag to specify whether Azure Resource Manager is permitted to retrieve secrets from the key vault. Defaults to false"
  default     = true
}

variable "enabled_for_deployment" {
  description = "(Optional) Boolean flag to specify whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault. Defaults to false"
  default     = true
}

variable "sku_name" {
  description = "he Name of the SKU used for this Key Vault. Possible values are standard and premium."
  default     = "standard"
}

# WARNING: Deprecated. v1.0 ignores it and v2.0 will delete this variable
variable "soft_delete_enabled" {
  default = true
}

variable "soft_delete_retention_days" {
  description = "The number of days that items should be retained for once soft-deleted. This value can be between 7 and 90"
  default     = 7
}

variable "purge_protection_enabled" {
  description = "Is Purge Protection enabled for this Key Vault?"
  default     = true
}

variable "enabled_for_disk_encryption" {
  description = "Boolean flag to specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys. "
  default     = true
}

variable "current_context_access_policy" {
  description = "Boolean flag to specify if the current context requires an access policy to the newly created keyvault"
  default     = true
}

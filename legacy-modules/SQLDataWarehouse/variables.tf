# Storage Account

variable "azurerm_storage_account_name" {
  description = "The storage account name."
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Microsoft SQL Server."
}


variable "location" {
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}


variable "account_tier" {
  description = " The access tier for the storage account."
  default     = "Standard"
}

variable "account_replication_type" {
  default = "LRS"
}

# SQL Server


variable "azurerm_sql_server_name" {
  description = "The name of the Microsoft SQL Server. This needs to be globally unique within Azure."
}

# variable "version" {
#   description = "The version for the new server. Valid values are: 2.0 (for v11 server) and 12.0 (for v12 server)."
#   default     = "12.0"

# }
variable "sqllogin" {
  description = "The administrator login name for the new server. Changing this forces a new resource to be created."
  default = "__sqllogin__"
}

variable "sqladminpassword" {
  description = "The password associated with the administrator_login user. Needs to comply with Azure's Password Policy https://docs.microsoft.com/en-us/sql/relational-databases/security/password-policy?redirectedfrom=MSDN&view=sql-server-ver15"
  default = "__sqladminpassword__"
}

variable "retention_in_days" {
  description = " Specifies the number of days to retain logs for in the storage account."
  default     = "90"
}

# SQL Database

variable "azurerm_sql_database_name" {
  description = "The name of the database."
}

# SQL Databse Auditing

variable "database_retention_in_days" {
  description = "The number of days to retain logs for in the storage account."
  default     = "90"
}

#  SQL Server Subnet

variable "azurerm_sql_virtual_network_rule_name" {
  description = "The name of the SQL virtual network rule. Changing this forces a new resource to be created. Cannot be empty and must only contain alphanumeric characters and hyphens. Cannot start with a number, and cannot start or end with a hyphen."
}

variable "azurerm_subnet_name" {
  description = "Specifies the name of the Subnet."
}

variable "virtual_network_name" {
  description = "Specifies the name of the Virtual Network this Subnet is located within."
}

variable "vnet_resource_group_name" {
  description = "Specifies the name of the resource group the Virtual Network is located in."
}

# Tags

variable "tags" {
}

# azurerm_sql_active_directory_administrator

variable "sql_ad_admin_login" {
  description = "The login name of the principal to set as the server administrator."
  default = "sqladmin"
}

variable "sql_ad_admin_object_id" {
  description = "The ID of the principal to set as the server administrator."
}

variable "sql_ad_admin_tenant_id" {
  description = "The Azure Tenant ID."
}
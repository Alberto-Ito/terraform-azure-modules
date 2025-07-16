
variable "mysql_server_name" {
    description = "Specifies the name of the MySQL Server. Changing this forces a new resource to be created. This needs to be globally unique within Azure."
}

variable "resource_group_name" {
    description = "The name of the resource group in which to create the MySQL Server. Changing this forces a new resource to be created."
}

variable "location" {
    description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "administrator_login" {
    description =   "The name of the Windows Virtual Machine. Changing this forces a new resource to be created."
    default = "__mysqladministratorlogin__"
}

variable "administrator_login_password" {
    description =   "The Password which should be used for the local-administrator on this Virtual Machine. Changing this forces a new resource to be created."
    default = "__mysqladministratorloginpassword__"
}

variable "sku_name" {
    description = "Specifies the SKU Name for this MySQL Server. The name of the SKU, follows the tier + family + cores pattern (e.g. B_Gen4_1, GP_Gen5_8). For more information see the product documentation. Sizes = [B_Gen4_1 B_Gen4_2 B_Gen5_1 B_Gen5_2 GP_Gen4_2 GP_Gen4_4 GP_Gen4_8 GP_Gen4_16 GP_Gen4_32 GP_Gen5_2 GP_Gen5_4 GP_Gen5_8 GP_Gen5_16 GP_Gen5_32 GP_Gen5_64 MO_Gen5_2 MO_Gen5_4 MO_Gen5_8 MO_Gen5_16 MO_Gen5_32]"
    default = "B_Gen5_2"
}

variable "storage_mb" {
    description = "Max storage allowed for a server. Possible values are between 5120 MB(5GB) and 1048576 MB(1TB) for the Basic SKU and between 5120 MB(5GB) and 4194304 MB(4TB) for General Purpose/Memory Optimized SKUs."
    default = 5120
}

variable "mysql_version" {
    description = "Specifies the version of MySQL to use. Valid values are 5.6, 5.7, and 8.0. Changing this forces a new resource to be created."
    default = "8.0"
}

variable "auto_grow_enabled" {
    description = "Enable/Disable auto-growing of the storage. Storage auto-grow prevents your server from running out of storage and becoming read-only. If storage auto grow is enabled, the storage automatically grows without impacting the workload. The default value if not explicitly specified is true."
    default = true
}

variable "backup_retention_days" {
    description = "Backup retention days for the server, supported values are between 7 and 35 days."
    default = 7
}

variable "geo_redundant_backup_enabled" {
    description = "Turn Geo-redundant server backups on/off. This allows you to choose between locally redundant or geo-redundant backup storage in the General Purpose and Memory Optimized tiers. When the backups are stored in geo-redundant backup storage, they are not only stored within the region in which your server is hosted, but are also replicated to a paired data center. This provides better protection and ability to restore your server in a different region in the event of a disaster. This is not supported for the Basic tier."
    default = true
}

variable "infrastructure_encryption_enabled" {
    description = "Whether or not infrastructure is encrypted for this server. Defaults to false. Changing this forces a new resource to be created."
    default = true
}

variable "public_network_access_enabled" {
    description = "Whether or not public network access is allowed for this server. Defaults to true."
    default = false
}

variable "ssl_enforcement_enabled" {
    description = "Specifies if SSL should be enforced on connections. Possible values are true and false."
    default = true
}

variable "ssl_minimal_tls_version_enforced" {
    description = "The minimum TLS version to support on the sever. Possible values are TLSEnforcementDisabled, TLS1_0, TLS1_1, and TLS1_2. Defaults to TLSEnforcementDisabled."
    default = "TLS1_2"
}

variable "tags" {
}

# azurerm_mysql_active_directory_administrator

variable "mysql_ad_admin_login" {
  description = "The login name of the principal to set as the server administrator."
  default = "sqladmin"
}

variable "mysql_ad_admin_object_id" {
  description = "The ID of the principal to set as the server administrator."
}

variable "mysql_ad_admin_tenant_id" {
  description = "The Azure Tenant ID."
}
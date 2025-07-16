variable "resource_group_name" {
  description = "Specifies the Resource Group where the Kusto Cluster should exist. Changing this forces a new resource to be created."
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "naming" {
  description = "The naming module outputs."
}

# TODO: OBSOLETE - Naming module should output FULL name and take suffix as an output
variable "name_suffix" {
  description = <<EOT
    Name suffix, usually a random string.
    - Cluster name will be "dec{var.naming.environment}{name_suffix}"
    - Database name will be "dedb-{var.naming.app_alias}-{var.naming.environment}-{name_suffix}"
    EOT
}

variable "sku" {
  description = "A sku block as defined below."
  type = object({
    name     = string,
    capacity = number
  })
  default = {
    name     = "Dev(No SLA)_Standard_D11_v2" # (Required) The name of the SKU. Valid values are: Dev(No SLA)_Standard_D11_v2, Dev(No SLA)_Standard_E2a_v4, Standard_D11_v2, Standard_D12_v2, Standard_D13_v2, Standard_D14_v2, Standard_DS13_v2+1TB_PS, Standard_DS13_v2+2TB_PS, Standard_DS14_v2+3TB_PS, Standard_DS14_v2+4TB_PS, Standard_E16as_v4+3TB_PS, Standard_E16as_v4+4TB_PS, Standard_E16a_v4, Standard_E2a_v4, Standard_E4a_v4, Standard_E64i_v3, Standard_E8as_v4+1TB_PS, Standard_E8as_v4+2TB_PS, Standard_E8a_v4, Standard_L16s, Standard_L4s and Standard_L8s.
    capacity = 1                             # (Optional) Specifies the node count for the cluster. Boundaries depend on the sku name.
  }
}

variable "double_encryption_enabled" {
  description = "Is the cluster's double encryption enabled? Defaults to false. Changing this forces a new resource to be created."
  type        = bool
  default     = false
}

variable "identity_ids" {
  description = "A list of IDs for User Assigned Managed Identity resources to be assigned."
  type        = list(string)
  default     = []
}

variable "enable_disk_encryption" {
  description = "Specifies if the cluster's disks are encrypted."
  type        = bool
  default     = true
}

variable "enable_streaming_ingest" {
  description = "Specifies if the streaming ingest is enabled."
  type        = bool
  default     = true
}

variable "enable_purge" {
  description = "Specifies if the purge operations are enabled."
  type        = bool
  default     = false
}

variable "database" {
  description = "ADX Database parameters"
  type = object({
    hot_cache_period   = string,
    soft_delete_period = string
  })
  default = {
    hot_cache_period   = "P7D"
    soft_delete_period = null
  }
}

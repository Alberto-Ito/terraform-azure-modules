variable "enabled_protocol" {
  description = "The protocol used for the share. Possible values are SMB and NFS. The SBM indicates the share can be accessed by SMBv3.0, SMBv2.1 and REST. The NFS indicates the share can be accessed by NFSv4.1. Changing this forces a new resource to be created."
  type        = string
  default     = null # -> 'SMB'
}
variable "quota" {
  description = "The maximum size of the share, in gigabytes. For Standard storage accounts, this must be greater than 0 and less than 5120 GB (5 TB). For Premium FileStorage storage accounts, this must be greater than 100 GB and less than 102400 GB (100 TB)."
  type        = number
  default     = null # -> '5120'
}

variable "metadata" {
  description = "A mapping of MetaData for this File Share."
  type        = map
  default     = null
}

variable "name" {
  description = "The name of the share. Must be unique within the storage account where the share is located."
  type        = string
}

variable "storage_account_name" {
  description = "Specifies the storage account in which to create the share. Changing this forces a new resource to be created."
  type        = string
}


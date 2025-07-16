variable "resource_group_name" {
  description = "The resource group name."
}

variable "location" {
  description = "The region were the resource will be deployed."
}

variable "service_bus_namespace_name" {
  description = "The service bus namespace name."
}

variable "sku" {
  description = "(Required) Defines which tier to use. Options are 'basic', 'standard' or 'premium'. Changing this forces a new resource to be created."
}

variable "capacity" {
  description = "(Optional) Specifies the capacity. When sku is Premium, capacity can be 1, 2, 4, 8 or 16. When sku is Basic or Standard, capacity can be 0 only."
  type        = number
  default     = 1
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resource."
}

variable "add_diagnostic_logs" {
  description = "Should be the diganostics logs configuration added?"
  type        = bool
  default     = true
}
variable "storage_account_id" {
  type        = string
  default     = null
  description = "The storage account id for the service bus diagnostic log."
}

variable "log_analytics_workspace_id" {
  description = "The analytics workspace id for the service bus diagnostic log."
  type        = string
  default     = null
}

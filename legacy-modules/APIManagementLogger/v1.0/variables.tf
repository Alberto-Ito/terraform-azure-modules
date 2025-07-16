variable "resource_group_name" {
  type        = string
  description = "The resource group name."
}

variable "application_insights_id" {
  type        = string
  description = "(Optional) The target resource id which will be linked in the API-Management portal page."
  default     = null
}

variable "application_insights_instrumentation_key" {
  type        = string
  description = "The instrumentation key used to push data to Application Insights."
}

variable "api_management_name" {
  description = "The name of the API Management Service."
  type        = string
}

variable "name" {
  description = "The name of this Logger, which must be unique within the API Management Service. Changing this forces a new resource to be created."
  type        = string
}

variable "description" {
  description = "(Optional) A description of this Logger."
  type        = string
  default     = null
}

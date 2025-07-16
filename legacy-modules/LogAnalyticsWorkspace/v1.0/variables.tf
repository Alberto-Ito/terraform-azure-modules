variable "azurerm_log_analytics_workspace_name" {
  description = "The name for the resource."
}
variable "resource_group_name" {
  description = "The resource group name."
}
variable "location" {
  description = "The region were the resource will be deployed."
}

variable "retention_in_days" {
    description = "This is the retention in days."
}

variable "internet_ingestion_enabled" {
  description = "Log Analytics Workflow support ingestion over the Public Internet?"
  default = false
}

variable "internet_query_enabled" {
  description = "Log Analytics Workflow support querying over the Public Internet?"
  default = false
}

variable "tags" {
}
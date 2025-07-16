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

variable "tags" {
}
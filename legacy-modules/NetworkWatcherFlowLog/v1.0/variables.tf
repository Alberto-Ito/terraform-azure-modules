variable "network_watcher_name" {
  description = "The name of the Network Watcher."
}

variable "resource_group_name" {
  description = "The name of the resource group in which the Network Watcher was deployed"
  default = "NetworkWatcherRG"
}

variable "network_security_group_id" {
  description = "The ID of the Network Security Group for which to enable flow logs for"
}

variable "storage_account_id" {
  description = "The ID of the Storage Account where flow logs are stored."
}

variable "retention_days" {
  description = "The number of days to retain flow log records."
  default = 7
}

variable "workspace_id" {
  description = "The resource guid of the attached workspace."
}

variable "workspace_region" {
  description = "The location of the attached workspace."
}

variable "workspace_resource_id" {
  description = "The resource ID of the attached workspace."
}

variable "interval_in_minutes" {
  description = " How frequently service should do flow analytics in minutes."
  default = 10
}

variable "flow_log_version" {
  description = "The version (revision) of the flow log. Possible values are 1 and 2"
  default = 2
}

variable "tags" {}
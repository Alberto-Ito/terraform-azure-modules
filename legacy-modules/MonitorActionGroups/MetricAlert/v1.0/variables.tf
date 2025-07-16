variable "azurerm_storage_account_name" {

}
variable "storage_account_resource_group_name" {

}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Metric Alert instance."
}

variable "azurerm_monitor_metric_alert_name" {
  description = "The name of the Metric Alert. Changing this forces a new resource to be created."
}

variable "target_action_group_resource_group_name" {

}
variable "azurerm_monitor_action_group_name" {

}

variable "metric_namespace" {
  description = "One of the metric namespaces to be monitored. Example: Microsoft.Storage/storageAccounts"
}

variable "metric_name" {
  description = "Example:Transactions"
  default     = "Transactions"
}

variable "aggregation" {
  description = "The statistic that runs over the metric values. Possible values are Average, Count, Minimum, Maximum and Total."
  default     = "Total"
}

variable "operator" {
  description = "The criteria operator. Possible values are Equals, NotEquals, GreaterThan, GreaterThanOrEqual, LessThan and LessThanOrEqual."
  default     = "GreaterThan"
}

variable "threshold" {
  description = "The criteria threshold value that activates the alert."
  default     = "50"
}

variable "tags" {
}
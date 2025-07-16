variable "azurerm_storage_account_name" {

}
variable "storage_account_resource_group_name" {

}

variable "resource_group_name" {
  description = "The resource group name."
}

variable "target_resource_group_name" {
  description = "The target resource group name."
}

variable "operation_name" {
  description = "The Resource Manager Role-Based Access Control operation name. Supported operation should be of the form: <resourceProvider>/<resourceType>/<operation>."
}

variable "azurerm_monitor_activity_log_alert_name" {
  description = "The name of the activity log alert. Changing this forces a new resource to be created."
}

variable "target_action_group_resource_group_name" {

}
variable "azurerm_monitor_action_group_name" {

}

variable "category" {
   description =   "The category of the operation. Possible values are Administrative, Autoscale, Policy, Recommendation, ResourceHealth, Security and ServiceHealth."
}

variable "tags" {
}
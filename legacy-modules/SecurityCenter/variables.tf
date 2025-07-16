variable "azurerm_log_analytics_workspace_name" {
  description = "This is the existing log analytics workspace that azure security center will use."
}

variable "log_analytics_resource_group_name" {
  description = "The resource group name where the log analytics is deployed."
}

variable "scope" {
  description = "The scope of VMs to send their security data to the desired workspace, unless overridden by a setting with more specific scope. (The Subscription, example /subscriptions/00000000-0000-0000-0000-000000000000)"
}

variable "email" {
  description = "The email of the Security Center Contact."
}

variable "phone" {
  description = "The phone number of the Security Center Contact. Example: 555-555-5555"
}
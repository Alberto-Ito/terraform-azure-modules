variable "azurerm_monitor_action_group_name" {
   description = "The name of the Action Group. Changing this forces a new resource to be created."
}  

variable "resource_group_name" {
  description = "The resource group name."
}

variable "short_name" {
   description = "The short name of the action group. This will be used in SMS messages."
}

variable "email_receiver_name" {
   description = "The name of the email receiver. Names must be unique (case-insensitive) across all receivers within an action group."
}

variable "email_address" {
   description =   "The email address of this receiver."
}
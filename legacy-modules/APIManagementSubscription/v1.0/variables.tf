variable "resource_group_name" {
  description = "The resource group name."
}

variable "azurerm_api_management_name" {
  description = "The name of the API Management Service. Changing this forces a new resource to be created."
}

variable "create_user" {
  description = "Should a new user be created for the subscription? Defaults to false."
  default = false
}

variable "first_name" {
  description = "The first name for this user."
  default = ""
}

variable "last_name" {
  description = "The last name for this user."
  default = ""
}

variable "user_email" {
  description = "The email address associated with this user."
  default = ""
}

variable "user_state" {
  description = "The state of this user. Possible values are active, blocked and pending. Defaults to active."
  default = "active"
}

variable "subscription_name" {
  description = "Is a Subscription required to access API's included in this Product? Defaults to false."
}

variable "product_id" {
  description = "The ID of the Product which should be assigned to this Subscription. Changing this forces a new resource to be created."
}

variable "user_id" {
  description = "The ID of the User which should be assigned to this Subscription. Changing this forces a new resource to be created. The value must be set when create_user is set to false."
  default = ""
}

variable "subscription_state" {
  description = "The state of this Subscription. Possible values are active, cancelled, expired, rejected, submitted and suspended. Defaults to submitted"
  default = "submitted"
}
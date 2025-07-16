variable "app_configuration_name" {
  description = "The name of the App Configuration. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
  description = "The name of the resource group in which to the App Configuration should exist. Changing this forces a new resource to be created."
}

variable "location" {
  description = "The Azure region where the App Configuration should exist. Changing this forces a new resource to be created."
}

variable "sku" {
  description = "The SKU name of the the App Configuration. Possible values are free and standard. It is not possible to downgrade from free to standard"
  default     = "free"
}

variable "identity_type" {
  description = "Specifies the identity type of the App Configuration. At this time the only allowed value is SystemAssigned."
  default     = "SystemAssigned"
}

variable "tags" {
}
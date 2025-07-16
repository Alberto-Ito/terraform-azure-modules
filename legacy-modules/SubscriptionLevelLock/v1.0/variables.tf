variable "scope" {
  description = "Specifies the scope at which the Management Lock should be created. Changing this forces a new resource to be created. Example: /subscriptions/0000-0000-0000-0000"
}

variable "azurerm_management_lock_name" {
  description = "Specifies the name of the Management Lock. Changing this forces a new resource to be created."
}
variable "lock_level" {
  description = "Specifies the Level to be used for this Lock. Possible values are CanNotDelete and ReadOnly. Changing this forces a new resource to be created."
  default     = "ReadOnly"
}

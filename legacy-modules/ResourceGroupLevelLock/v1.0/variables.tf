variable "target_resource_group_name" {
  description = "The target resource group that will be locked."
}

variable "azurerm_management_lock_name" {
  description = "Specifies the name of the Management Lock. Changing this forces a new resource to be created."
}
variable "lock_level" {
  description = "Specifies the Level to be used for this Lock. Possible values are CanNotDelete and ReadOnly. Changing this forces a new resource to be created."
  default     = "ReadOnly"
}

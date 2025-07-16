variable "name" {
  description = "(Required) Specifies the name of the ServiceBus Namespace Authorization Rule resource. Changing this forces a new resource to be created."
  type        = string
}

variable "namespace_name" {
  description = "(Required) Specifies the name of the ServiceBus Namespace. Changing this forces a new resource to be created."
  type        = string
}

variable "resource_group_name" {
  description = "(Required) The name of the resource group in which the ServiceBus Namespace exists. Changing this forces a new resource to be created."
  type        = string
}

variable "listen" {
  description = "(Optional) Grants listen access to this this Authorization Rule."
  type        = bool
  default     = false
}

variable "send" {
  description = "(Optional) Grants send access to this this Authorization Rule."
  type        = bool
  default     = false
}

variable "manage" {
  description = "(Optional) Grants manage access to this this Authorization Rule. When this property is true - both listen and send must be too."
  type        = bool
  default     = false
}

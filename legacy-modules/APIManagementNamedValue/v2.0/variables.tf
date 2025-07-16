variable "resource_group_name" {
  description = "(Required) The name of the Resource Group in which the API Management Named Value should exist. Changing this forces a new resource to be created."
  type        = string

}

variable "name" {
  description = "(Required) The name of the API Management Named Value. Changing this forces a new resource to be created."
  type        = string
}

variable "api_management_name" {
  description = "(Required) The name of the API Management Service in which the API Management Named Value should exist. Changing this forces a new resource to be created."
  type        = string
}

variable "display_name" {
  description = "The display name of this API Management Named Value."
  type        = string
}

variable "value" {
  description = "The value of this API Management Named Value."
  type        = string
  default     = null
}

variable "secret" {
  description = "(Optional) Specifies whether the API Management Named Value is secret. Valid values are true or false."
  type        = bool
  default     = false
}

# WARNING: This ARE NOT the tags from naming module.
variable "tags" {
  description = "(Optional) A list of tags to be applied to the API Management Named Value."
  type        = list(string)
  default     = null
}

# To use keyvault references...
variable "keyvault_secret_id" {
  description = "The resource ID of the Key Vault Secret."
  type        = string
  default     = null
}

variable "identity_client_id" {
  description = "(Optional) The client ID of User Assigned Identity, for the API Management Service, which will be used to access the key vault secret. The System Assigned Identity will be used in absence."
  type        = string
  default     = null
}

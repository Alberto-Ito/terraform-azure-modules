variable "name" {
  description = "(Required) The name of the API Management Certificate. Changing this forces a new resource to be created."
  type        = string
}

variable "api_management_name" {
  description = "(Required) The Name of the API Management Service where this Service should be created. Changing this forces a new resource to be created."
  type        = string
}

variable "resource_group_name" {
  description = "(Required) The Name of the Resource Group where the API Management Service exists. Changing this forces a new resource to be created."
  type        = string
}

variable "data" {
  description = "(Optional) The base-64 encoded certificate data, which must be a PFX file. Changing this forces a new resource to be created."
  default     = null
}

variable "password" {
  description = "(Optional) The password used for this certificate. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "key_vault_secret_id" {
  description = "(Optional) The ID of the Key Vault Secret containing the SSL Certificate, which must be of the type 'application/x-pkcs12'."
  type        = string
  default     = null
}

variable "key_vault_identity_client_id" {
  description = " (Optional) The Client ID of the User Assigned Managed Identity to use for retrieving certificate."
  type        = string
  default     = null
}

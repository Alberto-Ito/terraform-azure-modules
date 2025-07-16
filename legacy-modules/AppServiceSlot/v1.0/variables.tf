variable "allowed_origins" {
  description = "A list of origins which should be able to make cross-origin calls."
  type        = list(string)
  default     = null
}

variable always_on {
  description = "Should the Function App be loaded at all times?"
  type        = bool
  default     = false
}

variable "app_service_plan_id" {
  description = "The ID of the App Service Plan within which to create this Function App Slot."
  type        = string
}

variable "app_settings" {
  description = "A map of key-value pairs for App Settings and custom values."
  type        = map
  default     = null
}

variable "app_service_id" {
  description = "The ID of the App Service or Function App to associate to the VNet. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "app_service_name" {
  description = "The name of the Function App within which to create the Function App Slot. Changing this forces a new resource to be created."
  type        = string
}

variable "auto_swap_slot_name" {
  description = "The name of the slot to automatically swap to during deployment"
  type        = string
  default     = null
}

variable "client_affinity_enabled" {
  description = "Should the App Service send session affinity cookies, which route client requests in the same session to the same instance?"
  type        = bool
  default     = null
}

variable dotnet_framework_version {
  description = "he version of the .net framework's CLR used in this function app. Possible values are v4.0 (including .NET Core 2.1 and 3.1), v5.0 and v6.0"
  type        = string
  default     = "v4.0"
}

variable "enable_vnet_integration" {
  description = "Do you want to integrate with the subnet?"
  type        = bool
  default     = false
}

variable ftps_state {
  description = "State of FTP / FTPS service for this function app. Possible values include: AllAllowed, FtpsOnly and Disabled."
  type        = string
  default     = "Disabled"
}

variable health_check_path {
  description = "Path which will be checked for this function app health."
  type        = string
  default     = null
}

variable http2_enabled {
  description = "Specifies whether or not the http2 protocol should be enabled. "
  type        = bool
  default     = false
}

variable "https_only" {
  description = "Can the Function App only be accessed via HTTPS?"
  type        = bool
  default     = true
}

variable "ip_restriction" {
  description = "List of ip_restriction block."
  default     = []
}

variable "identity_ids" {
  description = "Specifies a list of user managed identity ids to be assigned. Required if type is UserAssigned."
  type        = list(string)
  default     = null
}

variable "identity_type" {
  description = "Specifies the identity type of the App Service. Possible values are 'SystemAssigned' and 'UserAssigned'."
  type        = string
  default     = null

  validation {
    condition = (
      var.identity_type == "SystemAssigned" ||
      var.identity_type == "UserAssigned" ||
      var.identity_type == null
    )
    error_message = "The identity_type value must be in ['UserAssigned', 'SystemAssigned', null]."
  }
}

variable linux_fx_version {
  description = "Linux App Framework and version for the AppService, e.g. DOCKER|(golang:latest)"
  type        = string
  default     = null
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
}

variable min_tls_version {
  description = "The minimum supported TLS version for the function app. Possible values are 1.0, 1.1, and 1.2."
  type        = string
  default     = "1.2"
}

variable "name" {
  description = "Specifies the name of the Function App. Changing this forces a new resource to be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Function App Slot."
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet the app service will be associated to (the subnet must have a service_delegation configured for Microsoft.Web/serverFarms."
  type        = string
  default     = null
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map
}

variable use_32_bit_worker_process {
  description = "Should the Function App run in 32 bit mode, rather than 64 bit mode?"
  type        = bool
  default     = true
}

variable vnet_route_all_enabled {
  description = "Should all outbound traffic to have Virtual Network Security Groups and User Defined Routes applied?"
  type        = bool
  default     = false
}

variable websockets_enabled {
  description = "Should WebSockets be enabled?"
  type        = bool
  default     = null
}

variable "windows_fx_version" {
  description = "The Windows Docker container image"
  type        = string
  default     = null
}

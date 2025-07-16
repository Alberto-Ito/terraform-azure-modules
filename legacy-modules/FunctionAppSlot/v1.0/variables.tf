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

variable app_scale_limit {
  description = "The number of workers this function app can scale out to. Only applicable to apps on the Consumption and Premium plan."
  type        = number
  default     = null
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

variable "auto_swap_slot_name" {
  description = "The name of the slot to automatically swap to during deployment"
  type        = string
  default     = null
}

variable "create_file_share" {
  description = "Indicates if the module should create by default the file share to be used by the slot."
  type        = bool
  default     = true
}

variable dotnet_framework_version {
  description = "he version of the .net framework's CLR used in this function app. Possible values are v4.0 (including .NET Core 2.1 and 3.1), v5.0 and v6.0"
  type        = string
  default     = "v4.0"
}

variable elastic_instance_minimum {
  description = "The number of minimum instances for this function app. Only affects apps on the Premium plan."
  type        = number
  default     = null
}

variable "enable_builtin_logging" {
  description = "Should the built-in logging of this Function App be enabled?"
  type        = bool
  default     = false
}

variable ftps_state {
  description = "State of FTP / FTPS service for this function app. Possible values include: AllAllowed, FtpsOnly and Disabled."
  type        = string
  default     = "Disabled"
}

variable "function_app_name" {
  description = "The name of the Function App within which to create the Function App Slot. Changing this forces a new resource to be created."
  type        = string
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

variable "identity_ids" {
  description = "Specifies a list of user managed identity ids to be assigned. Required if type is UserAssigned."
  type        = list(string)
  default     = null
}

variable "identity_type" {
  description = "Specifies the identity type of the Function App. Possible values are 'SystemAssigned' and 'UserAssigned'."
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

variable "os_type" {
  description = "A string indicating the Operating System type for this function app. ['linux', 'windows']"
  type        = string
  default     = null
}

variable pre_warmed_instance_count {
  description = "The number of pre-warmed instances for this function app. Only affects apps on the Premium plan."
  type        = number
  default     = null
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Function App Slot."
  type        = string
}

variable runtime_scale_monitoring_enabled {
  description = "Should Runtime Scale Monitoring be enabled?. Only applicable to apps on the Premium plan. "
  type        = bool
  default     = false
}

variable "runtime_version" {
  description = "The runtime version associated with the Function App."
  type        = string
  default     = "~3"

  validation {
    condition = (
      var.runtime_version == "~1" ||
      var.runtime_version == "~3"
    )
    error_message = "The runtime_version value must be in [~1, ~3]."
  }
}

variable "storage_account_access_key" {
  description = "The access key which will be used to access the backend storage account for the Function App."
  type        = string
}

variable "storage_account_name" {
  description = "The backend storage account name which will be used by the Function App (such as the dashboard, logs)."
  type        = string
}

variable "tags" {
  description = " A mapping of tags to assign to the resource."
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

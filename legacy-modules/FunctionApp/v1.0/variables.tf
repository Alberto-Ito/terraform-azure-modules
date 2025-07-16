variable "resource_group_name" {
  description = "(Required) The name of the resource group in which to create the Function App."
  type        = string
}

variable "app_service_plan_id" {
  description = "(Required) The ID of the App Service Plan within which to create this Function App."
  type        = string
}

variable "location" {
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
}

variable "identity_type" {
  description = "Specifies the identity type of the Function App. Possible values are 'SystemAssigned' and 'UserAssigned' (implementation pending)."
  default     = null
}

variable "storage_account_name" {
  description = "(Required) The backend storage account name which will be used by this Function App (such as the dashboard, logs)."
}

variable "storage_account_access_key" {
  description = "The access key which will be used to access the backend storage account for the Function App."
}

variable "azurerm_function_app_name" {
  description = "The name of the function app."
}

variable "tags" {
}

variable "runtime_version" {
  description = "Runtime version number."
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

variable "os_type" {
  description = "A string indicating the Operating System type for this function app. ['linux', 'windows']"
  type        = string
  default     = null
}

variable "enable_builtin_logging" {
  description = "Should the built-in logging of this Function App be enabled?"
  default     = false
}

variable "https_only" {
  description = "Can the Function App only be accessed via HTTPS?"
  default     = true
}

variable "app_settings" {
  description = "A map of key-value pairs for App Settings and custom values."
  type        = map
  default     = null
}

variable always_on {
  description = "Should the Function App be loaded at all times?"
  default     = false
}

variable app_scale_limit {
  description = "The number of workers this function app can scale out to. Only applicable to apps on the Consumption and Premium plan."
  default     = null
}

variable dotnet_framework_version {
  description = "he version of the .net framework's CLR used in this function app. Possible values are v4.0 (including .NET Core 2.1 and 3.1), v5.0 and v6.0"
  default     = "v4.0"
}

variable health_check_path {
  description = "Path which will be checked for this function app health."
  default     = null
}

variable ip_restriction {
  description = "A List of objects representing ip restrictions"
  default     = []
}

variable java_version {
  description = "Java version hosted by the function app in Azure. Possible values are 1.8, 11"
  default     = null
}

variable linux_fx_version {
  description = "Linux App Framework and version for the AppService, e.g. DOCKER|(golang:latest)"
  default     = null
}

variable min_tls_version {
  description = "The minimum supported TLS version for the function app. Possible values are 1.0, 1.1, and 1.2."
  default     = "1.2"
}

variable runtime_scale_monitoring_enabled {
  description = "Should Runtime Scale Monitoring be enabled?. Only applicable to apps on the Premium plan. "
  default     = false
}

variable scm_ip_restriction {
  description = "A List of objects representing ip restrictions"
  default     = []
}

variable scm_type {
  description = "The type of Source Control used by the Function App. Valid values include: BitBucketGit, BitBucketHg, CodePlexGit, CodePlexHg, Dropbox, ExternalGit, ExternalHg, GitHub, LocalGit, None (default), OneDrive, Tfs, VSO, and VSTSRM"
  default     = "None"
}

variable scm_use_main_ip_restriction {
  description = "IP security restrictions for scm to use main."
  default     = false
}

variable use_32_bit_worker_process {
  description = "Should the Function App run in 32 bit mode, rather than 64 bit mode?"
  default     = true
}

variable vnet_route_all_enabled {
  description = "Should all outbound traffic to have Virtual Network Security Groups and User Defined Routes applied?"
  default     = false
}

variable elastic_instance_minimum {
  description = "The number of minimum instances for this function app. Only affects apps on the Premium plan."
  default     = null
}

variable ftps_state {
  description = "State of FTP / FTPS service for this function app. Possible values include: AllAllowed, FtpsOnly and Disabled."
  default     = "Disabled"
}

variable http2_enabled {
  description = "Specifies whether or not the http2 protocol should be enabled. "
  default     = false
}

variable websockets_enabled {
  description = "Should WebSockets be enabled?"
  default     = null
}

variable pre_warmed_instance_count {
  description = "The number of pre-warmed instances for this function app. Only affects apps on the Premium plan."
  default     = null
}

variable "auth_setting_flag" {
  description = "This variable is used to turn the auth setting on or off on a azure function"
  default     = false
}

variable "token_refresh_extension_hours" {
  description = "The number of hours after session token expiration that a session token can be used to call the token refresh API."
  default     = 72
}

variable "allowed_origins" {
  default = null
}

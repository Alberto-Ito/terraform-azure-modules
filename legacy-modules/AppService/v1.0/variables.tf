variable "azurerm_app_service_name" {
  description = "Specifies the name of the App Service. Changing this forces a new resource to be created."
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the App Service."
}

variable "app_service_plan_id" {
  description = "The ID of the App Service Plan within which to create this App Service."
}

variable "dotnet_framework_version" {
  description = "The version of the .net framework's CLR used in this App Service. Possible values are v2.0 (which will use the latest version of the .net framework for the .net CLR v2 - currently .net 3.5), v4.0 (which corresponds to the latest version of the .net CLR v4 - which at the time of writing is .net 4.7.1) and v5.0. Defaults to .net Core 3.1."
  default     = null
}

variable "site_config_http2_enabled" {
  description = "Enables HTTP/2 on the App Service"
  default     = false
}

variable "app_settings" {
  description = "A key-value pair of App Settings."
  default = null
}

variable "linux_fx_version" {
  description = "The version of the .net core used in this App Service."
  default     = null
}

variable "windows_fx_version" {
  description = "The Windows Docker container image"
  default     = null
}

variable "ftps_state" {
  description = "State of FTP / FTPS service for this App Service. Possible values include: AllAllowed, FtpsOnly and Disabled"
  default     = "Disabled"
}

variable "http2_enabled" {
    description = "Is HTTP2 Enabled on this App Service"
    default = true
}

variable "health_check_path" {
    description = "The health check path to be pinged by App Service."
    default = null
}

variable "websockets_enabled" {
    description = "Should WebSockets be enabled"
    default = false
}

variable "ip_restriction" {
    description = "value"
    default = []
}

variable "tags" {
}

variable "client_affinity_enabled" {
  description = "Should the App Service send session affinity cookies, which route client requests in the same session to the same instance?"
  default     = null
}

variable "always_on" {
  description = "Should the app be loaded at all times?"
  default     = false
}

variable "use_32_bit_worker_process" {
  description = "Should the App Service run in 32 bit mode, rather than 64 bit mode?"
  default     = null
}

variable "subnet_id" {
  description = "The Subnet ID that you want to integrate with"
  default = null
}

variable "enable_vnet_integration" {
  description = "Do you want to integrate with the subnet? True or False"
  type        = bool
  default     = false
}

variable "number_of_workers" {
  description = "The scaled number of workers (for per site scaling) of this App Service. Requires that per_site_scaling is enabled on the azurerm_app_service_plan"
  default     = null  
  type        = number
}

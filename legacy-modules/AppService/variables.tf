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
  default     = "v4.0"
}

variable "site_config_http2_enabled" {
  description = "Enables HTTP/2 on the App Service"
  default     = false
}

variable "tags" {
}
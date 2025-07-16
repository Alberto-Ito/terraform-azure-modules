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

variable "site_config_http2_enabled" {
  description = "Enables HTTP/2 on the App Service"
  default     = false
}

variable "tags" {
}
variable "resource_group_name" {
  description = "The resource group name."
}

variable "location" {
  description = "The region were the resource will be deployed."
}

variable "azurerm_app_service_plan_name" {
  description = "The name of the app service plan."
}

# Choose the tier: Basic, Standard, PremiumV2, ElasticPremium # More info https://azure.microsoft.com/en-us/pricing/details/app-service/windows/
variable "tier" {
  default = "Standard"
}

# Choose the size" S1, S2, S3, EP1, EP2, EP3 # More info https://azure.microsoft.com/en-us/pricing/details/app-service/windows/
variable "size" {
  default = "S1"
}

variable "capacity" {
  description = "Specifies the number of workers associated with this App Service Plan."
  type        = number
  default     = null
}

variable "is_linux" {
  description = "'True' to have a linux plan (and 'false' will be windows)."
  type        = bool
  default     = true
}

variable "kind" {
  description = "The kind of the App Service Plan to create. Possible values are Windows (also available as App), Linux, elastic (for Premium Consumption) and FunctionApp (for a Consumption Plan). Defaults to Windows. Changing this forces a new resource to be created."
  default     = "Linux"
}

variable "per_site_scaling" {
  description = "Can Apps assigned to this App Service Plan be scaled independently? If set to false apps assigned to this plan will scale to all instances of the plan."
  type        = bool
  default     = false
}

variable "tags" {
}

variable "zone_redundant" {
  description = "Specifies if the App Service Plan should be Zone Redundant. Changing this forces a new resource to be created."
  type        = bool
  default     = false
}

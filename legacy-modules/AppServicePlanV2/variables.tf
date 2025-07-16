variable "resource_group_name" {
  description = "The resource group name."
}

variable "location" {
  description = "The region were the resource will be deployed."
}

variable "azurerm_app_service_plan_name" {
  description = "The name of the app service plan."
}

# Choose the tier: Basic, Standard, Premium, PremiumV2 # More info https://azure.microsoft.com/en-us/pricing/details/app-service/windows/
variable "tier" {
  default = "Standard"
}

# Choose the size" S1, S2, S3 # More info https://azure.microsoft.com/en-us/pricing/details/app-service/windows/
variable "size" {
  default = "S1"
}

variable "kind" {
  description = "The kind of the App Service Plan to create. Possible values are Windows (also available as App), Linux, elastic (for Premium Consumption) and FunctionApp (for a Consumption Plan). Defaults to Windows. Changing this forces a new resource to be created."
  default = "Windows"
}

variable "tags" {
}
variable "resource_group_name" {
  description = "The resource group name."
}

variable "location" {
  description = "The region were the resource will be deployed."
}

variable "azurerm_app_service_plan_name" {
  description = "The name of the app service plan."
}

# Choose the tier: Basic, Standard, ElasticPremium # More info https://azure.microsoft.com/en-us/pricing/details/app-service/windows/
variable "tier" {
  default = "Dynamic"
}

# Choose the size" S1, S2, S3, EP1, EP2, EP3 # More info https://azure.microsoft.com/en-us/pricing/details/app-service/windows/
variable "size" {
  default = "Y1"
}

variable "linux" {
  description = "'True' to have a linux plan (and 'false' will be windows)."
  type        = bool
  default     = true
}
variable "tags" {
}

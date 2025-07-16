
variable "azurerm_automation_connection_name" {
    description = "The name of the automation account connection"
}

variable "application_id" {
    description = "The application id of service principal"
}

variable "tenant_id" {
    description = "The id of the tenant deploying automation account"
}

variable "subscription_id" {
    description = "The id of the subscription deploying automation account"
}

variable "thumbprint" {
    description = "Automation account certificate thumbprint"
}

variable "resource_group_name" {
    description = "The resource group name."
}

variable "azurerm_automation_account_name" {
    description = "The name for the automation account."
}
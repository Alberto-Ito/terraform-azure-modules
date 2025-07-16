variable "azurerm_resource_group_template_deployment_name" {
  description = "The name which should be used for this Resource Group Template Deployment. Changing this forces a new Resource Group Template Deployment to be created."
}

variable "resource_group_name" {
  description = "The name of the Resource Group where the Resource Group Template Deployment should exist. Changing this forces a new Resource Group Template Deployment to be created."
}
variable "deployment_mode" {
  description = "The Deployment Mode for this Resource Group Template Deployment. Possible values are Complete (where resources in the Resource Group not specified in the ARM Template will be destroyed) and Incremental (where resources are additive only)."
}

variable "template_content" {
  description = "The contents of the ARM Template which should be deployed into this Resource Group."
}

variable "parameters_content" {
  description = "(Optional) The contents of the ARM Template parameters file - containing a JSON list of parameters."
  default = null
}

variable "tags" {
}

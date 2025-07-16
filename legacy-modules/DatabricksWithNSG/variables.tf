variable "azurerm_databricks_workspace_name" {
  description = "The data bricks workspace name."
}

variable "resource_group_name" {
  description = "The resource group name."
}

variable "location" {
  description = "The region were the resource will be deployed."
}

variable "sku" {
  description = "The sku to use for the Databricks Workspace. Possible values are standard, premium, or trial. Changing this forces a new resource to be created."
  default = "premium"
}

variable "public_subnet_name"  {
  description = "The name of the Public Subnet within the Virtual Network. Required if virtual_network_id is set."
}
variable "private_subnet_name" {
  description = "The name of the Private Subnet within the Virtual Network. Required if virtual_network_id is set."
}
variable "virtual_network_id" {
  description = "The ID of a Virtual Network where this Databricks Cluster should be created."
}

variable "tags" {
}

variable "public_subnet_network_security_group_association_id" {
  description = "(Optional) The resource ID of the azurerm_subnet_network_security_group_association resource which is referred to by the public_subnet_name field. Required if virtual_network_id is set."
}

variable "private_subnet_network_security_group_association_id" {
  description = "(Optional) The resource ID of the azurerm_subnet_network_security_group_association resource which is referred to by the private_subnet_name field. Required if virtual_network_id is set."
}

variable "managed_resource_group_name" {
  description = "The name of the resource group where Azure should place the managed Databricks resources. Changing this forces a new resource to be created."
  default = null
}
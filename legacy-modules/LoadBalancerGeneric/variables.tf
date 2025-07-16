variable "resource_group_name" {
  description = "The resource group name."
}
variable "location" {
  description = "The region were the resource will be deployed."
}

variable "azurerm_lb_name" {
  description = "Specifies the name of the Load Balancer."
}

variable "tags" {
}

# variable "frontend_ip_configuration_name" {
#   description = "Specifies the name of the frontend ip configuration."
# }

# variable "subnet_id" {
#     description = "The ID of the Subnet which should be associated with the IP Configuration."
# }
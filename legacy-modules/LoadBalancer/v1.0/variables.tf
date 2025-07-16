variable "resource_group_name" {
  description = "The resource group name."
}
variable "location" {
  description = "The region were the resource will be deployed."
}

variable "azurerm_lb_name" {
  description = "Specifies the name of the Load Balancer."
}

variable "public_ip_address_name" {
  description = "The public ip name for public ip that the loadbalancer will use."
  default = null
}

variable "public_ip_address_id" {
  description = "The public ip id for public ip that the loadbalancer will use."
  default = null
}

variable "tags" {
}
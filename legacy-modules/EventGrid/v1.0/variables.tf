variable "resource_group_name" {
  description = "The resource group name."
}

variable "location" {
  description = "The region were the resource will be deployed."
}

variable "eventgrid_name" {
  description = "The storage account name."
}

variable "allowed_ips" {
  description = "The ip mask (CIDR) to match on."
  default = null
  type = list(string)
}

variable "tags" {
}

variable "public_network_access_enabled" {
  default = false
  description = "Whether or not public network access is allowed for this server."
}
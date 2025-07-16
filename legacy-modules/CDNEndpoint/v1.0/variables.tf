variable "azurerm_cdn_endpoint_name" {
  description = "Specifies the name of the CDN Endpoint. Changing this forces a new resource to be created."
}
variable "cdn_profile_name" {
  description = "The CDN Profile to which to attach the CDN Endpoint."
}
variable "resource_group_name" {
  description = "The resource group name."
}
variable "location" {
  description = "The region were the resource will be deployed."
}

variable "orgin_name" {
  description = "The name of the origin. This is an arbitrary value. However, this value needs to be unique under the endpoint. Changing this forces a new resource to be created."
}

variable "orgin_host_name" {
  description = "A string that determines the hostname/IP address of the origin server. This string can be a domain name, Storage Account endpoint, Web App endpoint, IPv4 address or IPv6 address. Changing this forces a new resource to be created."
}

variable "tags" {
}
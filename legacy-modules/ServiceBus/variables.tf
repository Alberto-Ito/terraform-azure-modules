variable "resource_group_name" {
  description = "The resource group name."
}

variable "location" {
  description = "The region were the resource will be deployed."
}

variable "service_bus_namespace_name" {
  description = "The service bus namespace name."
}

variable "sku" {
  description = "Sku"
}

variable "tags" {
}

variable "storage_account_id" {
  description = "The storage account id for the service bus diagnostic log."
}
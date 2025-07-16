variable "azresource" {
  default = ""
}

variable "redis_cache_name" {
  description = "The name of the Redis instance. Changing this forces a new resource to be created."
}

variable "location" {
  description = "The location of the resource group."
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Redis instance."
}

variable "capacity" {
  description = "The size of the Redis cache to deploy. Valid values for a SKU family of C (Basic/Standard) are 0, 1, 2, 3, 4, 5, 6, and for P (Premium) family are 1, 2, 3, 4."
  default     = "2"
}

variable "family" {
  description = "The SKU family/pricing group to use. Valid values are C (for Basic/Standard SKU family) and P (for Premium)"
  default     = "C"
}

variable "sku_name" {
  description = "The SKU of Redis to use. Possible values are Basic, Standard and Premium."
  default     = "Standard"
}

variable "minimum_tls_version" {
  description = "The minimum TLS version. Defaults to 1.0."
  default     = "1.2"
}

variable "tags" {
}

variable "subnet_id" {
  description = "Only available when using the Premium SKU The ID of the Subnet within which the Redis Cache should be deployed. This Subnet must only contain Azure Cache for Redis instances without any other type of resources. Changing this forces a new resource to be created"
}
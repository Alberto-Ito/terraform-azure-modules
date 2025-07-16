variable "azresource" {
  default = ""
}


variable "container_registry_name" {
  description = "Specifies the name of the Container Registry. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Container Registry. Changing this forces a new resource to be created."
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "admin_enabled" {
  description = "Specifies whether the admin user is enabled. Defaults to false."
  default     = "false"
}

variable "sku" {
  description = "The SKU name of the container registry. Possible values are Basic, Standard and Premium. Classic (which was previously Basic) is supported only for existing resources."
  default     = "Premium"
}

variable "georeplication_locations" {
  description = "A list of Azure locations where the container registry should be geo-replicated."
}

# NOTE:
# The georeplication_locations is only supported on new resources with the Premium SKU.

# NOTE:
# The georeplication_locations list cannot contain the location where the Container Registry exists.

variable "tags" {
}

variable "ip_ranges" {
  type    = list(string)
  default = []
}

variable "allowed_subnet_ids" {
  type    = list(string)
  default = []
}
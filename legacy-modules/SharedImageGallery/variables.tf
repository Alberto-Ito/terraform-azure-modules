variable "resource_group_name" {
  description = "The name of the resource group in which to create the Shared Image Gallery. Changing this forces a new resource to be created."
}

variable "location" {
  description = "The region were the resource will be deployed."
}

variable "azurerm_shared_image_gallery_name" {
  description = "Specifies the name of the Shared Image Gallery. Changing this forces a new resource to be created."
}

variable "description" {
  description = "A description for this Shared Image Gallery."
}

variable "tags" {
}
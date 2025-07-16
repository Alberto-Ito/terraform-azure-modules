variable "resource_group_name" {
  description = "The name of the resource group in which to create the Shared Image Definition. Changing this forces a new resource to be created."
}

variable "location" {
  description = "The region were the resource will be deployed."
}

variable "azurerm_shared_image_gallery_name" {
  description = "Specifies the name of the Shared Image Gallery. Changing this forces a new resource to be created."
}

variable "azurerm_shared_image_name" {
  description = "Specifies the name of the image definition. Changing this forces a new resource to be created."
}

variable "os_type" {
  description = "The type of Operating System present in this Shared Image. Possible values are Linux and Windows. Changing this forces a new resource to be created."
}

variable "description" {
  description = "A description for this Shared Image."
}

variable "offer" {
  description = "The Offer Name for this Shared Image."
}

variable "publisher" {
  description = "The Publisher Name for this Gallery Image."
}

variable "sku" {
  description = "The Name of the SKU for this Gallery Image."
}

variable "tags" {
}
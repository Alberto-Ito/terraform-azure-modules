variable sku {
  description = "Specifies which tier to use. Valid values are Free_F1 and Standard_S1."
  default = "Standard_S1"
}

variable signalr_service_name {
  description = "The name of the SignalR service. Changing this forces a new resource to be created."
}

variable "location" {
    description =   "The supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
    description = "Specifies the Name of the Resource Group within which the Private Endpoint should exist. Changing this forces a new resource to be created."
}

variable allowed_origins {
  description = "A list of origins which should be able to make cross-origin calls. * can be used to allow all calls."
  default =  ["*"]
}

variable capacity {
  description = "Specifies the number of units associated with this SignalR service. Valid values are 1, 2, 5, 10, 20, 50 and 100"
  default = 1
}

variable "tags" {
}
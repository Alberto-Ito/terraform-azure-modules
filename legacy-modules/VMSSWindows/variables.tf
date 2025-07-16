variable "azurerm_subnet_name" {
  description = "Existing subnet where the VM will be deployed."
}
variable "virtual_network_name" {
  description = "The vnet where the VM will be deployed and the target subnet exist."
}
variable "vnet_resource_group_name" {
  description = "The resource group name where the vnet resides."
}

variable "boot_diag_azurerm_storage_account_name" {
  description = "Specifies the name of the Storage Account"
}
variable "boot_diag_resource_group_name" {
  description = "Specifies the name of the resource group the Storage Account is located in."
}


variable "resource_group_name" {
  description = "The resource group name."
}
variable "location" {
  description = "The region were the resource will be deployed."
}
variable "azurerm_windows_virtual_machine_scale_set_name" {
  description = "The name of the Windows Virtual Machine Scale Set. Changing this forces a new resource to be created."
}
variable "instances" {
  description = "The number of Virtual Machines in the Scale Set."
}
variable "size" {
  description = "Choose the VM size. Ref: https://aka.ms/WinVMSizes"
  default     = "Standard_DS2_v2"
}
variable "admin_username" {
  description = "The name of the Windows Virtual Machine. Changing this forces a new resource to be created."
}
variable "admin_password" {
  description = "The Password which should be used for the local-administrator on this Virtual Machine. Changing this forces a new resource to be created."
}
variable "storage_account_type" {
  description = "The Type of Storage Account which should back this the Internal OS Disk. Possible values are Standard_LRS, StandardSSD_LRS and Premium_LRS. Changing this forces a new resource to be created."
  default     = "StandardSSD_LRS"
}
variable "sku" {
  description = "Specifies the SKU of the image used to create the virtual machines."
  default     = "2016-Datacenter"
}

variable "tags" {
}
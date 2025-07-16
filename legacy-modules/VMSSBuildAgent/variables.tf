#Variables
variable "resource_group_name" {
  description = "The resource group name."
}
variable "location" {
  description = "The region were the resource will be deployed."
}

#VNET Variables
variable "subnet_id" {
  description = "Specifies the identifier of the subnet."
}

#Image Variables
variable "image_id" {
  description = "id of the custom image for the VMSS."
}

#VMSS Variables
variable "virtual_machine_scale_set_name" {
  description = "The name of the Windows Virtual Machine Scale Set. Changing this forces a new resource to be created."
}
variable "capacity" {
  description = "Specifies the number of virtual machines in the scale set."
}
variable "size" {
  description = "Choose the VM size. Ref: https://aka.ms/WinVMSizes"
  default     = "Standard_DS2_v2"
}
variable "storage_account_type" {
  description = "The Type of Storage Account which should back this the Internal OS Disk. Possible values are Standard_LRS, StandardSSD_LRS and Premium_LRS. Changing this forces a new resource to be created."
  default     = "StandardSSD_LRS"
}
variable "computer_name_prefix" {
  description = "Specifies the computer name prefix for all of the virtual machines in the scale set. "
}
variable "admin_username" {
  description = "The name of the Windows Virtual Machine. Changing this forces a new resource to be created."
}
variable "admin_password" {
  description = "The Password which should be used for the local-administrator on this Virtual Machine. Changing this forces a new resource to be created."
}

variable "tags" {
}
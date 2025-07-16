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
   description =   "Specifies the name of the Storage Account"
}
variable "boot_diag_resource_group_name" {
   description =   "Specifies the name of the resource group the Storage Account is located in."
}

# variable "azurerm_network_interface_name" {
#     description = "The VM network interface name."
#  }

variable "resource_group_name" {
  description = "The resource group name."
}
variable "location" {
  description = "The region were the resource will be deployed."
}
variable "private_ip_address_allocation" {
    description ="The allocation method used for the Private IP Address. Possible values are Dynamic and Static."
   default =   "Dynamic"
}
variable "azurerm_linux_virtual_machine_name" {
    description ="The name of the linux Virtual Machine. Changing this forces a new resource to be created."
}
variable "size" {
    description = "Choose the VM size. Ref: https://aka.ms/WinVMSizes"
   default =   "Standard_DS2_v2"
}
variable "admin_username" {
   description =   "The name of the linux Virtual Machine. Changing this forces a new resource to be created."
   default = "__adminusername__"
}
variable "admin_password" {
   description =   "The Password which should be used for the local-administrator on this Virtual Machine. Changing this forces a new resource to be created."
   default = null
}
variable "storage_account_type" {
   description = "The Type of Storage Account which should back this the Internal OS Disk. Possible values are Standard_LRS, StandardSSD_LRS and Premium_LRS. Changing this forces a new resource to be created."
   default =   "StandardSSD_LRS"
}
variable "sku" {
    description = "Specifies the SKU of the image used to create the virtual machines."
   default =   "18_04-lts-gen2"
}

variable "offer" {
    description = "Specifies the offer of the image used to create the virtual machines."
    default =  "UbuntuServer"
}

variable "publisher" {
    description = "Specifies the publisher of the image used to create the virtual machines."
    default = "Canonical"
}

variable "sku_version" {
    description = "Specifies the version of the image used to create the virtual machines."
    default = "latest"
}

variable "public_ip_address_id" {
    description = "Reference to a Public IP Address to associate with this NIC"
    default = null
}

variable "enable_ip_forwarding" {
    description = "Should IP Forwarding be enabled?"
    default = false
}

variable "enable_accelerated_networking" {
    description = "Should Accelerated Networking be enabled?"
    default = false
}

variable "tags" {
}

variable "custom_image_id" {
   description = "Resource ID of the custom image to be used to create the virtual machines. NOTE: You must also enable the 'use_custom_image' boolean for this to be used. Changing this forces a new resource to be created."
   default = null
}

variable "availability_set_id" {
   description =   "The id of the Availability Set that the VM will use."
   default = null
}

variable "use_managed_identity" {
   description = "Boolean value to use a system assigned managed identity."
   default = false
}

# variable "boot_diagnostics" {
#   description = "Enable or Disable boot diagnostics."
#   default     = "false"
# }
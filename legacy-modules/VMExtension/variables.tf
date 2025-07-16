variable "azurerm_virtual_machine_extension_name" {
  description = "The name of the virtual machine extension peering. Changing this forces a new resource to be created."
}

variable "virtual_machine_id" {
  description = "The ID of the Virtual Machine. Changing this forces a new resource to be created"
}

variable "publisher" {
  description = "The publisher of the extension, available publishers can be found by using the Azure CLI."
  default = "Microsoft.Compute"
}

variable "extension_type" {
  description = "The type of extension, available types for a publisher can be found using the Azure CLI."
  # Note: The Publisher and Type of Virtual Machine Extensions can be found using the Azure CLI, via: shell $ az vm extension image list --location westus -o table
  default = "CustomScriptExtension"
}

variable "type_handler_version" {
  description = "Specifies the version of the extension to use, available versions can be found using the Azure CLI."
  default = "1.10"
}

variable "script_file_urls" {
  description = "The URL(s) for file(s) to be downloaded."
}

variable "command_to_execute" {
  description = "The entry point script to execute. "
}

variable "storage_account_name" {
  description = "The name of the storage account where the scripts are stored."
}

variable "storage_account_key" {
  description = "The access key of storage account where the scripts are stored."
}
variable "tags" {
}
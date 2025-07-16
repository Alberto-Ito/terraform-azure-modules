resource "azurerm_virtual_machine_extension" "vmextension-0000" {
  name                       = var.azurerm_virtual_machine_extension_name
  virtual_machine_id         = var.virtual_machine_id
  publisher                  = var.publisher            #"Microsoft.Compute"
  type                       = var.extension_type       #"CustomScriptExtension	"
  type_handler_version       = var.type_handler_version #"1.10"
  auto_upgrade_minor_version = true
  tags                       = var.tags

  lifecycle {
    ignore_changes = [
      tags
    ]
  }

  /* settings = <<SETTINGS
      {
          "fileUris": ["${var.script_file_urls}"],
          "commandToExecute": "${var.command_to_execute}",
          "managedIdentity" : {${var.managed_identity}}
      }
  SETTINGS */

  protected_settings = <<PROTECTED_SETTINGS
      {
          "fileUris": ["${var.script_file_urls}"],
          "commandToExecute": "${var.command_to_execute}",
          "storageAccountName": "${var.storage_account_name}",
          "storageAccountKey": "${var.storage_account_key}"
      }
  PROTECTED_SETTINGS
}
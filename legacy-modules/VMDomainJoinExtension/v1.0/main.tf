resource "azurerm_virtual_machine_extension" "adjoin" {
  name                 = var.azurerm_virtual_machine_extension_name
  virtual_machine_id   = var.target_virtual_machine_id
  publisher            = "Microsoft.Compute"
  type                 = "JsonADDomainExtension"
  type_handler_version = "1.3"
  tags                 = var.tags

  lifecycle {
    ignore_changes = [
      tags
    ]
  }

  # What the settings mean: https://docs.microsoft.com/en-us/windows/desktop/api/lmjoin/nf-lmjoin-netjoindomain

  settings = <<SETTINGS
    {
        "Name": "jpdemo.net",
        "OUPath": "OU=OUTEST,DC=jpdemo,DC=net",
        "User": "jpdemo.net\\jptempadmintest",
        "Restart": "true",
        "Options": "3"
    }
SETTINGS
  protected_settings = <<PROTECTED_SETTINGS
    {
      "Password": "PasswordHere"
    }
    PROTECTED_SETTINGS
}
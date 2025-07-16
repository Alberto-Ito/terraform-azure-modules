resource "azurerm_automation_certificate" "example" {
  name                    = var.azurerm_automation_certificate_name
  resource_group_name     = var.resource_group_name
  automation_account_name = var.azurerm_automation_account_name
  description = var.description
  base64      = var.base64

#depends_on = [azurerm_automation_account.aa]

}
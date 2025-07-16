resource "azurerm_automation_account" "automation-0000" {
  name                = var.azurerm_automation_account_name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku_name = "Basic"
  tags     = var.tags

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
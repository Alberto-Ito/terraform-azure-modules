resource "azurerm_recovery_services_vault" "vault" {
  name                = var.azurerm_recovery_services_vault_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku
  soft_delete_enabled = true
  tags                = var.tags

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
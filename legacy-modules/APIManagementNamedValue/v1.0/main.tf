locals {
  keyvault_exists = var.key_vault_name == "" ? 0 : 1
}

data "azurerm_key_vault" "key_vault" {
  count = local.keyvault_exists
  name                = var.key_vault_name
  resource_group_name = var.resource_group_name
}

data "azurerm_key_vault_secret" "secret" {
  count = local.keyvault_exists
  name         = var.display_name
  key_vault_id = data.azurerm_key_vault.key_vault[count.index].id
}

resource "azurerm_api_management_named_value" "namedvalue" {
  count               = 1
  name                = var.name
  resource_group_name = var.resource_group_name
  api_management_name = var.azurerm_api_management_name
  display_name        = var.display_name
  value               = var.key_vault_name == "" ? var.value : "${data.azurerm_key_vault_secret.secret[count.index].value}"
  secret              = var.key_vault_name == "" ? false : true 
  tags                = var.tags

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

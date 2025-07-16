data "azurerm_key_vault" "keyvault" {
  name                = var.azurerm_key_vault_name
  resource_group_name = var.key_vault_resource_group_name
}

resource "azurerm_data_factory_linked_service_key_vault" "dflskeyvault" {
  name                = var.data_factory_linked_service_key_vault_name
  resource_group_name = var.resource_group_name
  data_factory_name   = var.azurerm_data_factory_name
  key_vault_id        = data.azurerm_key_vault.keyvault.id
}
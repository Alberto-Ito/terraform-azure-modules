data "azurerm_key_vault" "keyvault" {
  name                = var.azurerm_key_vault_name
  resource_group_name = var.key_vault_resource_group_name
}

data "azurerm_key_vault_secret" "keyvaultsecret0" {
  name         = var.azurerm_key_vault_secret0
  key_vault_id = data.azurerm_key_vault.keyvault.id
}

data "azurerm_function_app" "functionapp" {
  name                = var.azurerm_function_app_name
  resource_group_name = var.function_app_resource_group_name
}

resource "azurerm_data_factory_linked_service_azure_function" "dflsfunctionappS" {
  name                = var.azurerm_data_factory_linked_service_azure_function_name
  resource_group_name = var.resource_group_name
  data_factory_name   = var.azurerm_data_factory_name
  url                 = data.azurerm_function_app.functionapp.default_hostname
  key                 = data.azurerm_key_vault_secret.keyvaultsecret0.value
}
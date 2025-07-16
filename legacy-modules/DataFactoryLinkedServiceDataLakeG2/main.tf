data "azurerm_client_config" "current" {
}

# data "azurerm_key_vault" "keyvault" {
#   name                = var.azurerm_key_vault_name
#   resource_group_name = var.key_vault_resource_group_name
# }

# data "azurerm_key_vault_secret" "keyvaultsecret0" {
#   name         = var.service_principal_id
#   key_vault_id = data.azurerm_key_vault.keyvault.id
# }

# data "azurerm_key_vault_secret" "keyvaultsecret1" {
#   name         = var.service_principal_key
#   key_vault_id = data.azurerm_key_vault.keyvault.id
# }

data "azurerm_storage_account" "datalakeg2" {
  name                = var.azurerm_storage_account_data_lake_name
  resource_group_name = var.data_lake_gen2_resource_group_name
}

resource "azurerm_data_factory_linked_service_data_lake_storage_gen2" "example" {
  name                  = var.azurerm_data_factory_linked_service_data_lake_storage_gen2_name
  resource_group_name   = var.resource_group_name
  data_factory_name     = var.azurerm_data_factory_name
  service_principal_id  = var.service_principal_id #data.azurerm_key_vault_secret.keyvaultsecret0.value
  service_principal_key = var.service_principal_key #data.azurerm_key_vault_secret.keyvaultsecret1.value
  tenant                = data.azurerm_client_config.current.tenant_id
  url                   = data.azurerm_storage_account.datalakeg2.primary_dfs_endpoint
}
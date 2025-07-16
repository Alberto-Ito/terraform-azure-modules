data "azurerm_client_config" "current" {
}

data "azurerm_key_vault" "azurekeyvault" {
    name                = var.key_vault_name
    resource_group_name = var.key_vault_resource_group_name
}

resource "azurerm_key_vault_access_policy" "keyvaultpermissions" {
    key_vault_id            = data.azurerm_key_vault.azurekeyvault.id
    tenant_id               = data.azurerm_client_config.current.tenant_id
    object_id               = var.object_id
    key_permissions         = var.policy_key_permissions
    secret_permissions      = var.policy_secret_permissions
    storage_permissions     = var.policy_storage_permissions
    certificate_permissions = var.policy_certificate_permissions
}
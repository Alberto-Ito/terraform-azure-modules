resource "azurerm_key_vault_access_policy" "keyvaultpermissions" {
  key_vault_id            = var.key_vault_id
  tenant_id               = var.tenant_id
  object_id               = var.object_id
  key_permissions         = var.policy_key_permissions
  secret_permissions      = var.policy_secret_permissions
  storage_permissions     = var.policy_storage_permissions
  certificate_permissions = var.policy_certificate_permissions
}

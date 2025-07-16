module "keyvault-key-0000" {
  source = "../KeyVaultKey/v1.0/"
  key_vault_id    = var.key_vault_id
  expiration_date = var.expiration_date
  tags            = var.tags
  name            = "DiskEncryptionSetKey"
  key_type        = "RSA"
  key_size        = 4096
}

resource "azurerm_disk_encryption_set" "disk_encryption_set" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  key_vault_key_id    = module.keyvault-key-0000.id
  tags                = var.tags

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_key_vault_access_policy" "access_policy" {
  key_vault_id = var.key_vault_id

  tenant_id = azurerm_disk_encryption_set.disk_encryption_set.identity.0.tenant_id
  object_id = azurerm_disk_encryption_set.disk_encryption_set.identity.0.principal_id

  key_permissions = [
    "Get",
    "WrapKey",
    "UnwrapKey"
  ]
}

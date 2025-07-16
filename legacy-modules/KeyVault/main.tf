# WARNING:
# This module is considered deprecated and could be removed in the future.
# Considere the migration in the places where is used, and to not added in new places using 'Advanced_Modules/KeyVaultSecurityReady' instead.

data "azurerm_client_config" "current" {
}

resource "azurerm_key_vault" "keyvault" {
  name                        = var.azurerm_key_vault_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_enabled         = true
  soft_delete_retention_days  = 7
  purge_protection_enabled    = true
  tags                        = var.tags
  sku_name                    = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = var.key_permissions

    secret_permissions = var.secret_permissions

    storage_permissions = var.storage_permissions

    certificate_permissions = var.certificate_permissions
  }

  network_acls {
    default_action             = var.default_action
    bypass                     = var.bypass
    ip_rules                   = var.ip_rules
    virtual_network_subnet_ids = var.virtual_network_subnet_ids
  }

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

module "diagnostic_logs" {
  source             = "../DiagnosticLogs/"
  name               = var.diagnostic_logs_name
  target_resource_id = azurerm_key_vault.keyvault.id
  storage_account_id = var.diagnostic_logs_storage_account_id
}

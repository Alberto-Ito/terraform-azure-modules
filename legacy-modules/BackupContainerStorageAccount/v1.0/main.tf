resource "azurerm_backup_container_storage_account" "container" {
  resource_group_name = var.resource_group_name
  recovery_vault_name = var.recovery_services_vault_name
  storage_account_id  = var.storage_account_id
}
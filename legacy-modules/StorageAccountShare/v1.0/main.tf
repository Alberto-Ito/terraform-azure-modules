resource "azurerm_storage_share" "share" {
  name                 = var.name
  storage_account_name = var.storage_account_name
  quota                = var.quota
  metadata             = var.metadata
  enabled_protocol     = var.enabled_protocol
}

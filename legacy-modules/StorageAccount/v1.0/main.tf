resource "azurerm_storage_account" "storageaccount" {
  name                     = var.azurerm_storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  min_tls_version          = var.min_tls_version
  tags                     = var.tags

  blob_properties {
    cors_rule {
      allowed_headers    = var.allowed_headers
      allowed_methods    = var.allowed_methods
      allowed_origins    = var.allowed_origins
      exposed_headers    = var.exposed_headers
      max_age_in_seconds = var.max_age_in_seconds
    }
  }

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

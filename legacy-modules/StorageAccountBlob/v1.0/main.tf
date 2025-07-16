resource "azurerm_storage_blob" "newblob" {
  name                   = var.storage_blob_name
  storage_account_name   = var.storage_account_name
  storage_container_name = var.storage_container_name
  type                   = var.type
  access_tier            = var.access_tier
  source                 = var.file_path
}


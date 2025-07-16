resource "azurerm_media_services_account" "ams_account" {
  name                        = var.azurerm_media_services_account_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  tags                        = var.tags

  storage_account {
    id         = var.storage_account_id
    is_primary = var.storage_account_is_primary
  }

  identity {
    type = "SystemAssigned" #Only available value for now
  }
}
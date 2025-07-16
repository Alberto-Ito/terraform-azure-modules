resource "azurerm_function_app" "functionapp" {
  name                       = var.azurerm_function_app_name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  app_service_plan_id        = var.app_service_plan_id
  storage_account_name       = var.storage_account_name
  storage_account_access_key = var.storage_account_primary_key
  tags                       = var.tags
  https_only                 = true

  identity {
    type = var.identity_type
  }

  site_config {
    http2_enabled = true
    ftps_state    = "FtpsOnly"
  }

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

resource "azurerm_app_service" "appservice" {
  name                = var.azurerm_app_service_name
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = var.app_service_plan_id
  https_only          = true
  tags                = var.tags

  identity {
    type = "SystemAssigned"
  }
  
  site_config {
    linux_fx_version  = var.linux_fx_version
    ftps_state        = "FtpsOnly"
    http2_enabled     = var.site_config_http2_enabled
  }

  logs {
    detailed_error_messages_enabled = true
    failed_request_tracing_enabled  = true

    http_logs {
      file_system {
        retention_in_days = 7
        retention_in_mb   = 100
      }
    }
  }

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
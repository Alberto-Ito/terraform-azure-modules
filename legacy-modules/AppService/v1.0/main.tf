resource "azurerm_app_service" "appservice" {
  name                      = var.azurerm_app_service_name
  location                  = var.location
  resource_group_name       = var.resource_group_name
  app_service_plan_id       = var.app_service_plan_id
  client_affinity_enabled   = var.client_affinity_enabled
  https_only                = true
  tags                      = var.tags

  identity {
    type = "SystemAssigned"
  }

  site_config {
    always_on                     = var.always_on
    dotnet_framework_version      = var.dotnet_framework_version
    linux_fx_version              = var.linux_fx_version
    windows_fx_version            = var.windows_fx_version
    ftps_state                    = var.ftps_state
    use_32_bit_worker_process     = var.use_32_bit_worker_process
    http2_enabled                 = var.http2_enabled
    websockets_enabled            = var.websockets_enabled
    ip_restriction                = var.ip_restriction    
    health_check_path             = var.health_check_path
    number_of_workers             = var.number_of_workers
  }

   app_settings = var.app_settings

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

resource "azurerm_app_service_virtual_network_swift_connection" "swiftconnection" {
  count          = var.enable_vnet_integration == true ? 1 : 0
  app_service_id = azurerm_app_service.appservice.id
  subnet_id      = var.subnet_id
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.80.0"
    }
  }
}

resource "azurerm_app_service_slot" "slot" {
  resource_group_name     = var.resource_group_name
  app_service_name        = var.app_service_name
  name                    = var.name
  app_service_plan_id     = var.app_service_plan_id
  app_settings            = var.app_settings
  client_affinity_enabled = var.client_affinity_enabled
  https_only              = var.https_only
  location                = var.location
  tags                    = var.tags

  site_config {
    always_on                 = var.always_on
    auto_swap_slot_name       = var.auto_swap_slot_name
    dotnet_framework_version  = var.dotnet_framework_version
    ftps_state                = var.ftps_state
    health_check_path         = var.health_check_path
    http2_enabled             = var.http2_enabled
    ip_restriction            = var.ip_restriction
    linux_fx_version          = var.linux_fx_version
    min_tls_version           = var.min_tls_version
    use_32_bit_worker_process = var.use_32_bit_worker_process
    vnet_route_all_enabled    = var.vnet_route_all_enabled
    websockets_enabled        = var.websockets_enabled
    windows_fx_version        = var.windows_fx_version

    dynamic "cors" {
      for_each = var.allowed_origins == null ? [] : [1]

      content {
        allowed_origins = var.allowed_origins
      }
    }
  }

  dynamic "identity" {
    for_each = var.identity_type == null ? [] : [var.identity_type]

    content {
      type         = var.identity_type
      identity_ids = var.identity_type == "UserAssigned" ? var.identity_ids : null
    }
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
}

resource "azurerm_app_service_slot_virtual_network_swift_connection" "swiftconnection" {
  count          = var.enable_vnet_integration ? 1 : 0
  app_service_id = var.app_service_id
  slot_name      = azurerm_app_service_slot.slot.name
  subnet_id      = var.subnet_id
}

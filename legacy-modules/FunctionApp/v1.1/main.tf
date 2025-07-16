terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.80.0"
    }
  }
}

locals {
  os_type = var.os_type == "windows" ? null : var.os_type
}

resource "azurerm_function_app" "functionapp" {
  name                       = var.azurerm_function_app_name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  app_service_plan_id        = var.app_service_plan_id
  storage_account_name       = var.storage_account_name
  storage_account_access_key = var.storage_account_access_key
  version                    = var.runtime_version
  os_type                    = local.os_type
  enable_builtin_logging     = var.enable_builtin_logging
  https_only                 = var.https_only
  tags                       = var.tags
  app_settings               = var.app_settings == null ? null : var.app_settings

  dynamic "identity" {
    for_each = var.identity_type == null ? [] : [var.identity_type]

    content {
      type         = var.identity_type
      identity_ids = var.identity_type == "UserAssigned" ? var.identity_ids : null
    }
  }

  dynamic "site_config" {
    for_each = [1]

    content {
      always_on                        = var.always_on
      app_scale_limit                  = var.app_scale_limit
      dotnet_framework_version         = var.dotnet_framework_version
      health_check_path                = var.health_check_path
      ip_restriction                   = var.ip_restriction
      linux_fx_version                 = var.linux_fx_version
      min_tls_version                  = var.min_tls_version
      runtime_scale_monitoring_enabled = var.runtime_scale_monitoring_enabled
      scm_ip_restriction               = var.scm_ip_restriction
      scm_type                         = var.scm_type
      scm_use_main_ip_restriction      = var.scm_use_main_ip_restriction
      vnet_route_all_enabled           = var.vnet_route_all_enabled
      elastic_instance_minimum         = var.elastic_instance_minimum
      use_32_bit_worker_process        = var.use_32_bit_worker_process
      http2_enabled                    = var.http2_enabled
      ftps_state                       = var.ftps_state
      websockets_enabled               = var.websockets_enabled
      pre_warmed_instance_count        = var.pre_warmed_instance_count

      dynamic "cors" {
        for_each = var.allowed_origins == null ? [] : [1]

        content {
          allowed_origins     = var.allowed_origins
          support_credentials = var.support_credentials
        }
      }
    }
  }

  dynamic "auth_settings" {
    for_each = var.auth_setting_flag == true ? [1] : [0]
    content {
      enabled                       = var.auth_setting_flag
      token_refresh_extension_hours = var.token_refresh_extension_hours
    }
  }

  lifecycle {
    ignore_changes = [
      app_settings,
      tags
    ]
  }
}

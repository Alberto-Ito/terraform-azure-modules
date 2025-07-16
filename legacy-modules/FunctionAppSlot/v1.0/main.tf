terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.80.0"
    }
  }
}

# File share
module "share" {
  source               = "../../StorageAccountShare/v1.0/"
  count                = var.create_file_share ? 1 : 0
  name                 = "fileshare-${var.name}"
  storage_account_name = var.storage_account_name
}

locals {
  os_type        = var.os_type == "windows" ? null : var.os_type
  local_settings = var.create_file_share ? { "WEBSITE_CONTENTSHARE" = module.share[0].name } : null
}

resource "azurerm_function_app_slot" "slot" {
  resource_group_name        = var.resource_group_name
  function_app_name          = var.function_app_name
  name                       = var.name
  app_service_plan_id        = var.app_service_plan_id
  app_settings               = merge(local.local_settings, var.app_settings)
  enable_builtin_logging     = var.enable_builtin_logging
  https_only                 = var.https_only
  location                   = var.location
  os_type                    = local.os_type
  storage_account_name       = var.storage_account_name
  storage_account_access_key = var.storage_account_access_key
  tags                       = var.tags
  version                    = var.runtime_version

  site_config {
    always_on                        = var.always_on
    app_scale_limit                  = var.app_scale_limit
    auto_swap_slot_name              = var.auto_swap_slot_name
    dotnet_framework_version         = var.dotnet_framework_version
    elastic_instance_minimum         = var.elastic_instance_minimum
    ftps_state                       = var.ftps_state
    health_check_path                = var.health_check_path
    http2_enabled                    = var.http2_enabled
    linux_fx_version                 = var.linux_fx_version
    min_tls_version                  = var.min_tls_version
    pre_warmed_instance_count        = var.pre_warmed_instance_count
    runtime_scale_monitoring_enabled = var.runtime_scale_monitoring_enabled
    use_32_bit_worker_process        = var.use_32_bit_worker_process
    vnet_route_all_enabled           = var.vnet_route_all_enabled
    websockets_enabled               = var.websockets_enabled
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
}

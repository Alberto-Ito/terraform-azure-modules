locals {
  missing_tenant_or_object = var.tenant_id == null || var.object_id == null
  client_config = {
    tenant_id = (
      local.missing_tenant_or_object
      ? data.azurerm_client_config.current[0].tenant_id
      : var.tenant_id
    )
    object_id = (
      local.missing_tenant_or_object
      ? data.azurerm_client_config.current[0].object_id
      : var.object_id
    )
  }
}
data "azurerm_client_config" "current" {
  # Optional: if tenant_id and object_id are passed, we'll use those
  count = local.missing_tenant_or_object ? 1 : 0
}

locals {
  network_acl_enabled = var.bypass != null && var.default_action != null
  network_acl_for_each = (
    local.network_acl_enabled == true
    ? toset(["default"])
    : toset([])
  )
  current_context_access_policy = var.current_context_access_policy == true ? 1 : 0
}

resource "azurerm_key_vault" "keyvault" {
  name                            = var.azurerm_key_vault_name
  location                        = var.location
  resource_group_name             = var.resource_group_name
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  tenant_id                       = local.client_config.tenant_id
  soft_delete_retention_days      = var.soft_delete_retention_days
  purge_protection_enabled        = var.purge_protection_enabled
  tags                            = var.tags
  sku_name                        = var.sku_name
  enabled_for_template_deployment = var.enabled_for_template_deployment
  enabled_for_deployment          = var.enabled_for_deployment

  dynamic "network_acls" {
    for_each = local.network_acl_for_each
    content {
      default_action             = var.default_action
      bypass                     = var.bypass
      ip_rules                   = var.ip_rules
      virtual_network_subnet_ids = var.virtual_network_subnet_ids
    }
  }

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

module "diagnostic_logs" {
  source                     = "../../DiagnosticLogs/v1.0/"
  name                       = var.diagnostic_logs_name
  target_resource_id         = azurerm_key_vault.keyvault.id
  storage_account_id         = var.diagnostic_logs_storage_account_id
  log_analytics_workspace_id = var.diagnostic_logs_analytics_workspace_id
  logs                       = ["AuditEvent", "AzurePolicyEvaluationDetails"]
  metrics                    = ["AllMetrics"]
}

module "accesspolicy" {
  source                         = "../../KeyVaultAccessPolicyById/v1.0/"
  count                          = local.current_context_access_policy
  tenant_id                      = local.client_config.tenant_id
  object_id                      = local.client_config.object_id
  key_vault_id                   = azurerm_key_vault.keyvault.id
  policy_key_permissions         = var.key_permissions
  policy_secret_permissions      = var.secret_permissions
  policy_storage_permissions     = var.storage_permissions
  policy_certificate_permissions = var.certificate_permissions
}

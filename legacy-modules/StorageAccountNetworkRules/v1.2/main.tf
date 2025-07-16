terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.78.0"
    }
  }
}

resource "azurerm_storage_account_network_rules" "storageaccountnetworkrules" {
  resource_group_name        = local.resource_group_name
  storage_account_name       = local.storage_account_name
  storage_account_id         = var.storage_account_id
  default_action             = var.default_action
  ip_rules                   = var.ip_rules
  virtual_network_subnet_ids = var.virtual_network_subnet_ids
  bypass                     = flatten(var.bypass)

  lifecycle {
    ignore_changes = [
      ip_rules
    ]
  }
}

locals {
  resource_group_name  = var.storage_account_id == null ? var.resource_group_name : null
  storage_account_name = var.storage_account_id == null ? var.storage_account_name : null
}

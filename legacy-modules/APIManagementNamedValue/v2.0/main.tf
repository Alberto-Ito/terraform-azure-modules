terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.68.0"
    }
  }
}

locals {
  key_vault_secret = var.keyvault_secret_id == null ? [] : ["secret"]
}

resource "azurerm_api_management_named_value" "namedvalue" {
  name                = var.name
  resource_group_name = var.resource_group_name
  api_management_name = var.api_management_name
  display_name        = var.display_name
  value               = var.value
  secret              = var.keyvault_secret_id == null ? var.secret : true
  tags                = var.tags

  dynamic "value_from_key_vault" {
    for_each = local.key_vault_secret
    content {
      secret_id          = var.keyvault_secret_id
      identity_client_id = var.identity_client_id
    }
  }

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

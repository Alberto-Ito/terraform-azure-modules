terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.58.0"
    }
  }
}

resource "azurerm_api_management_certificate" "api_certificate" {
  api_management_name          = var.api_management_name
  resource_group_name          = var.resource_group_name
  name                         = var.name
  data                         = var.data
  password                     = var.password
  key_vault_secret_id          = var.key_vault_secret_id
  key_vault_identity_client_id = var.key_vault_identity_client_id
}

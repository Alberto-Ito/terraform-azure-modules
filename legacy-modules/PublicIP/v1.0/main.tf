terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.63.0"
    }
  }
}

resource "azurerm_public_ip" "publicip" {
  name                = var.azurerm_public_ip_name
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = var.allocation_method
  sku                 = var.sku
  availability_zone   = var.availability_zone
  domain_name_label   = var.domain_name_label
  tags                = var.tags

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

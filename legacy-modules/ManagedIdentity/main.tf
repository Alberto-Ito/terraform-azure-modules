resource "azurerm_user_assigned_identity" "managedid0" {
  resource_group_name = var.resource_group_name
  location            = var.location

  name = var.user_assigned_identity_name
  tags = var.tags

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
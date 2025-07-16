data "azurerm_subscription" "current" {
}

resource "azurerm_management_group" "child" {
  display_name               = var.azurerm_management_group_child_name
  parent_management_group_id = var.azurerm_management_group_parent_name

  subscription_ids = [
    data.azurerm_subscription.current.subscription_id,
  ]
}
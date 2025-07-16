data "azurerm_subscription" "current" {
}

resource "azurerm_management_group" "parent" {
  display_name = var.azurerm_management_group_display_name
  name = var.azurerm_management_group_display_name
  subscription_ids = [
    data.azurerm_subscription.current.subscription_id,
  ]
}
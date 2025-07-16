resource "random_string" "userid" {
  length  = 8
  special = false
  lower   = true
  upper   = false
  number  = true
}

resource "azurerm_api_management_user" "user" {
  count               = var.create_user ? 1 : 0
  user_id             = random_string.userid.result
  resource_group_name = var.resource_group_name
  api_management_name = var.azurerm_api_management_name
  first_name          = var.first_name
  last_name           = var.last_name
  email               = var.user_email
  state               = var.user_state
}

resource "azurerm_api_management_subscription" "subscription" {
  resource_group_name = var.resource_group_name
  api_management_name = var.azurerm_api_management_name
  display_name        = var.subscription_name
  product_id          = var.product_id
  user_id             = var.create_user ? azurerm_api_management_user.user[0].id : var.user_id
  state               = var.subscription_state
}

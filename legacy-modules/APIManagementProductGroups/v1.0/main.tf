resource "azurerm_api_management_product" "product" {
  product_id            = var.product_id
  resource_group_name   = var.resource_group_name
  api_management_name   = var.azurerm_api_management_name
  display_name          = var.display_name
  subscription_required = true
  published             = var.published
  approval_required     = var.approval_required
}

resource "azurerm_api_management_product_api" "productapi" {
  product_id          = azurerm_api_management_product.product.product_id
  api_management_name = var.azurerm_api_management_name
  resource_group_name = var.resource_group_name
  for_each            = toset(var.api_names)
  api_name            = each.key
}

resource "azurerm_api_management_product_group" "productgroup" {
  product_id          = azurerm_api_management_product.product.product_id
  api_management_name = var.azurerm_api_management_name
  resource_group_name = var.resource_group_name
  for_each            = toset(var.groups)
  group_name          = each.key
}

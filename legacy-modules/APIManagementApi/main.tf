resource "azurerm_api_management_api" "api" {
  name                = var.azurerm_api_management_api
  resource_group_name = var.resource_group_name
  api_management_name = var.azurerm_api_management_name
  revision            = var.revision
  display_name        = var.display_name
  path                = var.api_path
  protocols           = var.protocols
  subscription_required = true

  import {
    content_format = var.import_content_format
    content_value  = var.is_import_localFile ? file("${var.import_specs_path}") : var.import_specs_path
  }
}

resource "azurerm_api_management_api_policy" "policy" {
  api_name            = azurerm_api_management_api.api.name
  api_management_name = var.azurerm_api_management_name
  resource_group_name = var.resource_group_name
  count               = length(var.import_policy_paths)
  xml_content         = file("${var.import_policy_paths[count.index]}")
}
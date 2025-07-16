data "azurerm_app_service_plan" "appserviceplan" {
  name                = var.azurerm_app_service_plan_name
  resource_group_name = var.appserviceplanrgName
}

data "azurerm_storage_account" "storage" {
  name                = var.azurerm_storage_account_name
  resource_group_name = var.storagergName
}

resource "azurerm_function_app" "functionapp" {
  name                      = var.azurerm_function_app_name
  location                  = var.location
  resource_group_name       = var.resource_group_name
  app_service_plan_id       = data.azurerm_app_service_plan.appserviceplan.id
  storage_account_name      = data.azurerm_storage_account.storage.name
  storage_account_access_key = data.azurerm_storage_account.storage.primary_access_key
  tags                      = var.tags

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

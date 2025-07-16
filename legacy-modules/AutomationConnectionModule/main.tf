resource "azurerm_automation_connection_service_principal" "test" {
  name                    = var.azurerm_automation_connection_name
  resource_group_name     = var.resource_group_name
  automation_account_name = var.azurerm_automation_account_name
  application_id           = var.application_id
  tenant_id                = var.tenant_id
  subscription_id          = var.subscription_id
  certificate_thumbprint   = var.thumbprint
  #depends_on = [azurerm_automation_account.aa]

}
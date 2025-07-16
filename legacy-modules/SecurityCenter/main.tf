data "azurerm_log_analytics_workspace" "loganalytics0" {
  name                = var.azurerm_log_analytics_workspace_name
  resource_group_name = var.log_analytics_resource_group_name
}

resource "azurerm_security_center_subscription_pricing" "securitycenter" {
  tier = "Standard"
}

resource "azurerm_security_center_workspace" "securitycenterworkspace" {
  scope        = var.scope
  workspace_id = data.azurerm_log_analytics_workspace.loganalytics0.id
}

resource "azurerm_security_center_contact" "securitycentercontact" {
  email = var.email
  phone = var.phone

  alert_notifications = true
  alerts_to_admins    = true
}
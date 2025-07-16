data "azurerm_storage_account" "datastorageaccount" {
  name                = var.azurerm_storage_account_name
  resource_group_name = var.storage_account_resource_group_name
}

data "azurerm_resource_group" "dataresourcegroup" {
  name = var.target_resource_group_name
}

data "azurerm_monitor_action_group" "dataactiongroup" {
  resource_group_name = var.target_action_group_resource_group_name
  name                = var.azurerm_monitor_action_group_name
}

resource "azurerm_monitor_activity_log_alert" "logalert" {
  name                = var.azurerm_monitor_activity_log_alert_name
  resource_group_name = var.resource_group_name
  scopes              = [data.azurerm_resource_group.dataresourcegroup.id]
  description         = "This alert will monitor a specific storage accounts updates."
  tags                = var.tags

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
  
  criteria {
    resource_id    = data.azurerm_storage_account.datastorageaccount.id
    operation_name = var.operation_name
    category       = var.category
  }

  action {
    action_group_id = data.azurerm_monitor_action_group.dataactiongroup.id

    webhook_properties = {
      from = "terraform"
    }
  }
}
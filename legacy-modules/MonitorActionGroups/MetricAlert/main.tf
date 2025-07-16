data "azurerm_storage_account" "datastorageaccount" {
  name                = var.azurerm_storage_account_name
  resource_group_name = var.storage_account_resource_group_name
}

data "azurerm_monitor_action_group" "dataactiongroup" {
  resource_group_name = var.target_action_group_resource_group_name
  name                = var.azurerm_monitor_action_group_name
}

resource "azurerm_monitor_metric_alert" "metricalert" {
  name                = var.azurerm_monitor_metric_alert_name
  resource_group_name = var.resource_group_name
  scopes              = [data.azurerm_storage_account.datastorageaccount.id]
  description         = "Action will be triggered when Transactions count is greater than 50."
  tags                = var.tags

  lifecycle {
    ignore_changes = [
      tags
    ]
  }

  criteria {
    metric_namespace = var.metric_namespace
    metric_name      = var.metric_name
    aggregation      = var.aggregation
    operator         = var.operator
    threshold        = var.threshold

    dimension {
      name     = "ApiName"
      operator = "Include"
      values   = ["*"]
    }
  }

  action {
    action_group_id = data.azurerm_monitor_action_group.dataactiongroup.id
  }
}


# resource "azurerm_monitor_activity_log_alert" "logalert" {
#   name                = var.azurerm_monitor_activity_log_alert_name
#   resource_group_name = var.resource_group_name
#   scopes              = [data.azurerm_resource_group.dataresourcegroup.id]
#   description         = "This alert will monitor a specific storage accounts updates."

#   criteria {
#     resource_id    = data.azurerm_storage_account.datastorageaccount.id
#     operation_name = var.operation_name
#     category       = var.category
#   }

#   action {
#     action_group_id = data.azurerm_monitor_action_group.dataactiongroup.id

#     webhook_properties = {
#       from = "terraform"
#     }
#   }
# }
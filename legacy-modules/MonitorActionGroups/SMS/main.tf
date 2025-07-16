resource "azurerm_monitor_action_group" "smsmonitoractiongroup0" {
  name                = var.azurerm_monitor_action_group_name
  resource_group_name = var.resource_group_name
  short_name          = var.short_name
  tags                = var.tags

  lifecycle {
    ignore_changes = [
      tags
    ]
  }

  sms_receiver {
    name         = var.sms_receiver_name
    country_code = "1"
    phone_number = var.phone_number
  }
}
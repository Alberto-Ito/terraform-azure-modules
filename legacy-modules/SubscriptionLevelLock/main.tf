resource "azurerm_management_lock" "subscriptionlock" {
  name       = var.azurerm_management_lock_name
  scope      = var.scope
  lock_level = var.lock_level
  notes      = "This Resource Group is ${var.lock_level}"
}

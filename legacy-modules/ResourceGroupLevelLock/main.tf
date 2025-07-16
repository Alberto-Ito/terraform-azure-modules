data "azurerm_resource_group" "targetrg" {
  name = var.target_resource_group_name
}

resource "azurerm_management_lock" "resourcegrouplock" {
  name       = var.azurerm_management_lock_name
  scope      = data.azurerm_resource_group.targetrg.id
  lock_level = var.lock_level
  notes      = "This Resource Group is ${var.lock_level}"
}

resource "azurerm_virtual_machine_scale_set" "example" {
  name                = var.virtual_machine_scale_set_name
  location            = var.location
  resource_group_name = var.resource_group_name
  upgrade_policy_mode = "Manual"
  overprovision       = false
  automatic_os_upgrade = false

  sku {
    name     = var.size
    tier     = "Standard"
    capacity = var.capacity
  }

  storage_profile_image_reference {
    id = var.image_id
  }

  storage_profile_os_disk {
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = var.storage_account_type
  }

  os_profile {
    computer_name_prefix = var.computer_name_prefix
    admin_username       = var.admin_username
    admin_password       = var.admin_password
  }

  network_profile {
    name    = "${var.virtual_machine_scale_set_name}-nic"
    primary = true

    ip_configuration {
      name      = "${var.virtual_machine_scale_set_name}-internal"
      primary   = true
      subnet_id = var.subnet_id
    }
  }

  tags = var.tags
  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

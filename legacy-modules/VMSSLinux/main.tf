data "azurerm_subnet" "subnet0000" {
  name                 = var.azurerm_subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.vnet_resource_group_name
}

data "azurerm_storage_account" "bootstorageaccount" {
  name                = var.boot_diag_azurerm_storage_account_name
  resource_group_name = var.boot_diag_resource_group_name
}

resource "azurerm_linux_virtual_machine_scale_set" "vmsslinuxvm0000" {
  name                            = var.azurerm_linux_virtual_machine_scale_set_name
  resource_group_name             = var.resource_group_name
  location                        = var.location
  sku                             = var.size #"Standard_F2"
  instances                       = var.instances
  admin_username                  = var.admin_username
  admin_password                  = var.admin_password
  disable_password_authentication = false
  tags                            = var.tags

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = var.storage_account_type
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = var.sku
    version   = "latest"
  }

  network_interface {
    name    = "${var.azurerm_linux_virtual_machine_scale_set_name}-nic"
    primary = true

    ip_configuration {
      name      = "${var.azurerm_linux_virtual_machine_scale_set_name}-internal"
      primary   = true
      subnet_id = data.azurerm_subnet.subnet0000.id
    }
  }

  boot_diagnostics {
    storage_account_uri = data.azurerm_storage_account.bootstorageaccount.primary_blob_endpoint
  }

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
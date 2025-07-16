data "azurerm_subnet" "subnet0000" {
  name                 = var.azurerm_subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.vnet_resource_group_name
}

data "azurerm_availability_set" "availabilityset0" {
  name                = var.azurerm_availability_set_name
  resource_group_name = var.availability_set_resource_group_name
}

data "azurerm_storage_account" "bootstorageaccount" {
  name                = var.boot_diag_azurerm_storage_account_name
  resource_group_name = var.boot_diag_resource_group_name
}


resource "azurerm_network_interface" "linuxnic0000" {
  name                = "${var.azurerm_linux_virtual_machine_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet0000.id
    private_ip_address_allocation = var.private_ip_address_allocation
  }

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

resource "azurerm_linux_virtual_machine" "linuxvm0000" {
  name                            = var.azurerm_linux_virtual_machine_name
  resource_group_name             = var.resource_group_name
  location                        = var.location
  size                            = var.size #"Standard_F2"
  admin_username                  = var.admin_username
  admin_password                  = var.admin_password
  disable_password_authentication = false
  availability_set_id             = data.azurerm_availability_set.availabilityset0.id
  network_interface_ids = [
    azurerm_network_interface.linuxnic0000.id,
  ]
  tags                            = var.tags

  lifecycle {
    ignore_changes = [
      tags
    ]
  }

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

  boot_diagnostics {
    storage_account_uri = data.azurerm_storage_account.bootstorageaccount.primary_blob_endpoint
  }
}
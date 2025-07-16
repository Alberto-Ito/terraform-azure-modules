data "azurerm_subnet" "subnet0000" {
  name                 = var.azurerm_subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.vnet_resource_group_name
}

data "azurerm_storage_account" "bootstorageaccount" {
  name                = var.boot_diag_azurerm_storage_account_name
  resource_group_name = var.boot_diag_resource_group_name
}


resource "azurerm_network_interface" "winnic0000" {
  name                          = "${var.azurerm_windows_virtual_machine_name}-nic"
  location                      = var.location
  resource_group_name           = var.resource_group_name
  enable_accelerated_networking = var.enable_accelerated_networking
  enable_ip_forwarding          = var.enable_ip_forwarding
  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet0000.id
    private_ip_address_allocation = var.private_ip_address_allocation
    public_ip_address_id          = var.public_ip_address_id == null ? null : var.public_ip_address_id
  }
  tags = var.tags

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

resource "azurerm_windows_virtual_machine" "winvm0000" {
  name                = var.azurerm_windows_virtual_machine_name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.size #"Standard_F2"
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  availability_set_id = var.availability_set_id == null ? null : var.availability_set_id
  network_interface_ids = [
    azurerm_network_interface.winnic0000.id,
  ]

  computer_name = var.computer_name == null ? var.azurerm_windows_virtual_machine_name : var.computer_name

  tags = var.tags

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = var.storage_account_type
  }

  source_image_id = var.custom_image_id == null ? null : var.custom_image_id

  dynamic "source_image_reference" {
    for_each = var.custom_image_id == null ? [1] : []
    content {
      publisher = var.publisher
      offer     = var.offer
      sku       = var.sku
      version   = var.sku_version
    }
  }

  dynamic "identity" {
    for_each = var.use_managed_identity ? [1]:[]
    content{
      type = "SystemAssigned"
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

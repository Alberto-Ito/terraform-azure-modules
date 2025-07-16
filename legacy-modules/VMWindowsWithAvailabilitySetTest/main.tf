# data "azurerm_subnet" "subnet0000" {
#   name                 = var.azurerm_subnet_name
#   virtual_network_name = var.virtual_network_name
#   resource_group_name  = var.vnet_resource_group_name
# }

# data "azurerm_storage_account" "bootstorageaccount" {
#   name                = var.boot_diag_azurerm_storage_account_name
#   resource_group_name = var.boot_diag_resource_group_name
# }


resource "azurerm_network_interface" "winnic0000" {
  name                = "${var.azurerm_windows_virtual_machine_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name
    ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.private_ip_address_allocation
  }
  tags                = var.tags

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
  admin_username      = var.adminusername
  admin_password      = var.adminpassword
  availability_set_id = var.availability_set_id
  network_interface_ids = [
    azurerm_network_interface.winnic0000.id,
  ]
  tags                = var.tags

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = var.storage_account_type
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = var.sku
    version   = "latest"
  }

  boot_diagnostics {
    storage_account_uri = var.storage_account_uri # data.azurerm_storage_account.bootstorageaccount.primary_blob_endpoint
  }

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
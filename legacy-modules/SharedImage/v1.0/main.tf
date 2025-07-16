resource "azurerm_shared_image" "sharedimage" {
  name                = var.azurerm_shared_image_name
  gallery_name        = var.azurerm_shared_image_gallery_name
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = var.os_type
  tags                = var.tags

  identifier {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
  }

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

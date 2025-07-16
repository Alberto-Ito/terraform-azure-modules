
resource "azurerm_eventgrid_topic" "eventgrid" {
  name                          = var.eventgrid_name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  tags                          = var.tags
  public_network_access_enabled = false
  
  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
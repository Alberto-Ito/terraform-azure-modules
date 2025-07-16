resource "azurerm_databricks_workspace" "databricks" {
  name                = var.azurerm_databricks_workspace_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku

  custom_parameters {
    public_subnet_name  = var.public_subnet_name
    private_subnet_name = var.private_subnet_name
    virtual_network_id  = var.virtual_network_id
    no_public_ip        = true
  }
  
  tags = var.tags

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
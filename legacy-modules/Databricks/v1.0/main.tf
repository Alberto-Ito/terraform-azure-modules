resource "azurerm_databricks_workspace" "databricks" {
  name                        = var.azurerm_databricks_workspace_name
  resource_group_name         = var.resource_group_name
  location                    = var.location
  sku                         = var.sku
  managed_resource_group_name = var.managed_resource_group_name

   custom_parameters {
      public_subnet_name  = var.public_subnet_name
      private_subnet_name = var.private_subnet_name
      virtual_network_id  = var.virtual_network_id
      no_public_ip        = true

      public_subnet_network_security_group_association_id  = var.public_subnet_network_security_group_association_id
      private_subnet_network_security_group_association_id = var.private_subnet_network_security_group_association_id
    }

  tags = var.tags

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

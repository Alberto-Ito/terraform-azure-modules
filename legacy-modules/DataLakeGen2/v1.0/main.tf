resource "azurerm_storage_account" "datalake" {
  name                     = var.azurerm_storage_account_data_lake_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  account_kind             = "StorageV2"
  is_hns_enabled           = "true"
  min_tls_version          = var.min_tls_version
  
  tags = var.tags

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

######### Assign RBAC

data "azurerm_client_config" "current" {
}

data "azurerm_subscription" "primary" {
}


resource "azurerm_role_assignment" "rbac" {
  scope                = azurerm_storage_account.datalake.id
  role_definition_name = "Owner"
  principal_id         = data.azurerm_client_config.current.object_id
}

###

# Create Data Lake Gen 2 FS Container

# resource "azurerm_storage_data_lake_gen2_filesystem" "dfg2fs" {
#   name               = var.azurerm_storage_dlfs2_container_name
#   storage_account_id = azurerm_storage_account.datalake.id
#   depends_on = [azurerm_role_assignment.rbac]

#   # properties = {
#   #   hello = "aGVsbG8="
#   # }
# }
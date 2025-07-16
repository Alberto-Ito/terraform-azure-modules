/* Azure Data Explorer (ADX) - Kusto Cluster and Database */

locals {
  cluster_name         = "${var.naming.data_explorer_cluster}${var.name_suffix}"
  cluster_sku_name     = var.sku.name
  cluster_sku_capacity = var.sku.capacity

  cluster_has_identity_ids = length(var.identity_ids) > 0
  cluster_identity_type    = local.cluster_has_identity_ids ? "SystemAssigned, UserAssigned" : "SystemAssigned"
  cluster_identity_ids     = local.cluster_has_identity_ids ? var.identity_ids : null

  database_name = "${var.naming.data_explorer_database}-${var.name_suffix}"
}

resource "azurerm_kusto_cluster" "kusto_cluster" {
  name                      = local.cluster_name
  location                  = var.location
  resource_group_name       = var.resource_group_name
  double_encryption_enabled = var.double_encryption_enabled
  enable_disk_encryption    = var.enable_disk_encryption
  enable_streaming_ingest   = var.enable_streaming_ingest
  enable_purge              = var.enable_purge
  tags                      = var.naming.tags

  sku {
    name     = local.cluster_sku_name
    capacity = local.cluster_sku_capacity
  }

  identity {
    type         = local.cluster_identity_type
    identity_ids = local.cluster_identity_ids
  }

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

resource "azurerm_kusto_database" "kusto_database" {
  name                = local.database_name
  location            = var.location
  resource_group_name = var.resource_group_name
  cluster_name        = azurerm_kusto_cluster.kusto_cluster.name # Ensure DB is dependent on cluster creation
  hot_cache_period    = var.database.hot_cache_period
  soft_delete_period  = var.database.soft_delete_period
}

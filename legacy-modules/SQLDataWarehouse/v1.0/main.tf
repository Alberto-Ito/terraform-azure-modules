resource "azurerm_storage_account" "sqlstorageaccount" {
  name                     = var.azurerm_storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  tags                     = var.tags

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

resource "azurerm_sql_server" "sqlserver" {
  name                         = var.azurerm_sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.sqllogin
  administrator_login_password = var.sqladminpassword
  tags                         = var.tags

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

resource "azurerm_sql_active_directory_administrator" "sqladadmin" {
  server_name         = azurerm_sql_server.sqlserver.name
  resource_group_name = var.resource_group_name
  login               = var.sql_ad_admin_login
  object_id           = var.sql_ad_admin_object_id
  tenant_id           = var.sql_ad_admin_tenant_id
}

output "sqlstorageaccountblobendpoint" {
  value = azurerm_storage_account.sqlstorageaccount.primary_blob_endpoint
}

output "sqlstorageaccountblobsc" {
  value = azurerm_storage_account.sqlstorageaccount.primary_blob_connection_string
}

resource "azurerm_mssql_server_extended_auditing_policy" "sqlserverauditingpolicy" {
  server_id                               = azurerm_sql_server.sqlserver.id
  storage_endpoint                        = azurerm_storage_account.sqlstorageaccount.primary_blob_endpoint
  storage_account_access_key              = azurerm_storage_account.sqlstorageaccount.primary_access_key
  storage_account_access_key_is_secondary = false
  retention_in_days                       = var.retention_in_days
  depends_on                              = [azurerm_sql_server.sqlserver]
}


resource "azurerm_sql_database" "sqldatawarehouse" {
  name                = var.azurerm_sql_database_name
  resource_group_name = var.resource_group_name
  location            = var.location
  server_name         = azurerm_sql_server.sqlserver.name
  edition             = "DataWarehouse"
  depends_on          = [azurerm_sql_server.sqlserver]
  tags                = var.tags

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

resource "time_sleep" "wait_30_seconds" {
  depends_on = [azurerm_mssql_server_extended_auditing_policy.sqlserverauditingpolicy]

  create_duration = "45s"
}

# This resource will create (at least) 30 seconds after null_resource.previous
resource "null_resource" "next" {
  depends_on = [time_sleep.wait_30_seconds]
}

resource "azurerm_mssql_database_extended_auditing_policy" "sqldatabaseauditingpolicy" {
  database_id                             = azurerm_sql_database.sqldatawarehouse.id
  storage_endpoint                        = azurerm_storage_account.sqlstorageaccount.primary_blob_endpoint
  storage_account_access_key              = azurerm_storage_account.sqlstorageaccount.primary_access_key
  storage_account_access_key_is_secondary = false
  retention_in_days                       = var.database_retention_in_days
  depends_on                              = [azurerm_sql_database.sqldatawarehouse]
}


data "azurerm_subnet" "subnet" {
  name                 = var.azurerm_subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.vnet_resource_group_name
}

# output "subnet_id" {
#   value = data.azurerm_subnet.subnet.id
# }

resource "azurerm_sql_virtual_network_rule" "sqlservervnetrule" {
  name                = var.azurerm_sql_virtual_network_rule_name
  resource_group_name = var.resource_group_name
  server_name         = azurerm_sql_server.sqlserver.name
  subnet_id           = data.azurerm_subnet.subnet.id
}

# resource "azurerm_sql_firewall_rule" "sqlfirewallrule" {
#   name                = var.azurerm_sql_firewall_rule_0001
#   resource_group_name = var.resource_group_name
#   server_name         = azurerm_sql_server.sqlserver.name
#   start_ip_address    = var.start_ip_address_0001
#   end_ip_address      = var.end_ip_adress_0001
# }
resource "azurerm_mysql_server" "mysqlserver" {
  name                = var.mysql_server_name
  location            = var.location
  resource_group_name = var.resource_group_name

  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password

  sku_name   = var.sku_name # "B_Gen5_2"
  storage_mb = var.storage_mb # 5120
  version    = var.mysql_version #"5.7"

  auto_grow_enabled                 = var.auto_grow_enabled # true
  backup_retention_days             = var.backup_retention_days # 7
  geo_redundant_backup_enabled      = var.geo_redundant_backup_enabled # true
  infrastructure_encryption_enabled = var.infrastructure_encryption_enabled # true
  public_network_access_enabled     = var.public_network_access_enabled # false
  ssl_enforcement_enabled           = var.ssl_enforcement_enabled # true
  ssl_minimal_tls_version_enforced  = var.ssl_minimal_tls_version_enforced # "TLS1_2"

  tags                              = var.tags

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

resource "azurerm_mysql_active_directory_administrator" "mysqladadmin" {
  server_name         = azurerm_mysql_server.mysqlserver.name
  resource_group_name = var.resource_group_name
  login               = var.mysql_ad_admin_login
  object_id           = var.mysql_ad_admin_object_id
  tenant_id           = var.mysql_ad_admin_tenant_id
}

resource "azurerm_advanced_threat_protection" "threat_protection" {
  target_resource_id = azurerm_mysql_server.mysqlserver.id
  enabled            = true
}
resource "azurerm_mysql_database" "mysqldatabase" {
  name                = var.mysql_database_name
  resource_group_name = var.resource_group_name
  server_name         = var.server_name
  charset             = var.charset #"utf8"
  collation           = var.collation # "utf8_unicode_ci"
}
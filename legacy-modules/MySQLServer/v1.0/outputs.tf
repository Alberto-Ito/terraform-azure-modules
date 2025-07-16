output "id" {
    description = "The ID of the MySQL Server."
   value = azurerm_mysql_server.mysqlserver.id
}

output "fqdn" {
    description = "The FQDN of the MySQL Server."
   value = azurerm_mysql_server.mysqlserver.fqdn
}
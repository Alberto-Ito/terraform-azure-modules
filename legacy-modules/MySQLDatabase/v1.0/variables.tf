variable "mysql_database_name" {
    description = "Specifies the name of the MySQL Database, which needs to be a valid MySQL identifier. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
    description = "The name of the resource group in which the MySQL Server exists. Changing this forces a new resource to be created."
}

variable "server_name" {
    description = " Specifies the name of the MySQL Server. Changing this forces a new resource to be created."
}

variable "charset" {
    description = "Specifies the Charset for the MySQL Database, which needs to be a valid MySQL Charset. Changing this forces a new resource to be created."
    default = "utf8"
}

variable "collation" {
    description = "pecifies the Collation for the MySQL Database, which needs to be a valid MySQL Collation. Changing this forces a new resource to be created."
    default = "utf8_unicode_ci"
}
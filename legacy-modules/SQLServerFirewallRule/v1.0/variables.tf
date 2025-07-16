variable "resource_group_name" {
  description = "The name of the resource group in which to the SQL server exist."
}

variable "sql_server_name" {
  description = "The name of the target SQL server."
}
variable "azurerm_sql_firewall_rule_name" {
  description = "The firerwall rule name for the workspace."
  default     = "DefaultRuleName"
}

variable "start_ip_address" {
  description = "The start IP address of the firewall rule. Must be IPv4 format."
  default     = "0.0.0.0"
}

variable "end_ip_address" {
  description = "The end IP address of the firewall rule. Must be IPv4 format. Must be greater than or equal to startIpAddress."
  default     = "255.255.255.255"
}
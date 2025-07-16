# Azure Data Explorer - Naming conventions

## Arguments

variable "data_explorer_cluster" {
  description = "Azure Data Explorer cluster prefix."
  default     = "dec"
}

variable "data_explorer_database" {
  description = "Azure Data Explorer database prefix."
  default     = "dedb"
}

variable "data_explorer_database_principal_assignment" {
  description = "Azure Data Explorer principal assignment"
  default     = "dedb-pa"
}

variable "data_explorer_eventhub_data_connection" {
  description = "Azure Data Explorer Event Hub data connection"
  default     = "dedb-evh"
}

## Locals / Calculated

locals {
  # dec<Environment><random string>
  data_explorer_cluster = "${var.data_explorer_cluster}${var.environment}"

  # dedb-<App Alias>-<Environment>-<random string>
  data_explorer_database = "${var.data_explorer_database}-${var.app_alias}-${var.environment}"

  # dedb-pa-<App Alias>-<Environment>-<random string>
  data_explorer_database_principal_assignment = "${var.data_explorer_database_principal_assignment}-${var.app_alias}-${var.environment}"

  # dedb-evh-<App Alias>-<Environment>-<random string>
  data_explorer_eventhub_data_connection = "${var.data_explorer_eventhub_data_connection}-${var.app_alias}-${var.environment}"
}

## Outputs

output "data_explorer_cluster" {
  value = local.data_explorer_cluster
}

output "data_explorer_database" {
  value = local.data_explorer_database
}

output "data_explorer_database_principal_assignment" {
  value = local.data_explorer_database_principal_assignment
}

output "data_explorer_eventhub_data_connection" {
  value = local.data_explorer_eventhub_data_connection
}

## References

# - [Azure - Naming - Analytics and IoT](https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations#analytics-and-iot)
# - [Azure - ADX](https://docs.microsoft.com/en-us/azure/data-explorer/data-explorer-overview)
# - [TF - kusto_cluster](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kusto_cluster)
# - [TF - kusto_cluster_database](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kusto_database)
# - [TF - kusto_eventhub_data_connection](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kusto_eventhub_data_connection)

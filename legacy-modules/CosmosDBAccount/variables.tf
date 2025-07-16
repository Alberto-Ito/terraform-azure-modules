variable "resource_group_name" {
  description = "The resource group name."
}
variable "location" {
  description = "The region were the resource will be deployed."
}

variable "azurerm_cosmosdb_account_name" {
  description = "The Cosmos DB account name."
}

variable "offer_type" {
  description = "The Offer Type for the Cosmos DB account."
  default     = "Standard"
}

variable "kind" {
  description = "The Kind of Cosmos DB Account."
  default     = "GlobalDocumentDB"
}

variable "enable_automatic_failover" {
  description = "Enable automatic fail over for this Cosmos DB account."
  default     = false
}

variable "consistency_level" {
  description = "The Consistency Level to use for this CosmosDB Account."
  default     = "Session"
}

variable "public_network_access_enabled" {
  description = "Whether or not public network access is allowed for this CosmosDB account."
  default     = false
}

variable "ip_range_filter" {
  description = "CosmosDB Firewall Support: This value specifies the set of IP addresses or IP address ranges in CIDR form to be included as the allowed list of client IP's for a given database account. IP addresses/ranges must be comma separated and must not contain any spaces."
  default     = null
}

variable "network_acl_bypass_ids" {
  description = "The list of resource Ids for Network Acl Bypass for this Cosmos DB account."
  default     = null
}

variable "is_virtual_network_filter_enabled" {
  default = true
}

variable "tags" {
}

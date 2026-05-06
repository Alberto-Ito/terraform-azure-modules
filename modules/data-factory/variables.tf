variable "name" {
  description = "The Data Factory name."
  type        = string
}

variable "identity_id" {
  description = "The user-assigned managed identity ID used by Azure Data Factory."
  type        = string
}

variable "location" {
  description = "The Azure region where the resources will be deployed."
  type        = string
}

variable "resource_group_name" {
  description = "The resource group name."
  type        = string
}

variable "enable_managed_virtual_network" {
  description = "Indicates whether to enable the Managed Virtual Network for Azure Data Factory."
  type        = bool
  default     = true
}

variable "postgres_db_name" {
  description = "The name of the PostgreSQL database."
  type        = string
}

variable "postgres_admin" {
  description = "The PostgreSQL admin username."
  type        = string
}

variable "postgres_admin_password" {
  description = "The PostgreSQL admin password."
  type        = string
  sensitive   = true
}

variable "private_link_service_id" {
  description = "The ID of the Private Link Service."
  type        = string
}

variable "private_link_service_name" {
  description = "The name of the Private Link Service."
  type        = string
}

variable "postgres_fqdns" {
  description = "List of fully qualified domain names used by Data Factory to validate the Managed Private Endpoint connection to PostgreSQL."
  type        = list(string)
  default     = []
}

variable "storages_within_sub_managed_pe" {
  description = "Storage account managed private endpoints to create and approve in the current subscription."
  type = list(object({
    name                 = string
    storage_account_name = string
    target_resource_id   = string
  }))
}

variable "storage_out_sub_managed_pe" {
  description = "Storage account managed private endpoints to create and approve outside the current subscription."
  type = list(object({
    name                 = string
    storage_account_name = string
    target_resource_id   = string
  }))
  default = []
}

variable "client_id" {
  description = "The Client ID of the Azure Service Principal."
  type        = string
}

variable "client_secret" {
  description = "The Client Secret of the Azure Service Principal."
  type        = string
  sensitive   = true
}

variable "tenant_id" {
  description = "The Tenant ID associated with the Azure Service Principal."
  type        = string
}

variable "subscription_id" {
  description = "The Azure subscription ID."
  type        = string
}

variable "tags" {
  description = "Map of tags to apply to the Data Factory resource."
  type        = map(string)
}

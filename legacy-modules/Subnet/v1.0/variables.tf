variable "azurerm_virtual_network_name" {
  description = "VNet name."
}

variable "resource_group_name" {
  description = "The resource group name."
}

variable "location" {
  description = "The region were the resource will be deployed."
}

variable "address_prefixes" {
  type        = string
  description = "The address prefixes for the subnet."
}

variable "azurerm_subnet_name" {
  description = "The subnet name."
}

variable "delegation_name" {
  description = "A name for this delegation."
  default = null
}

variable "service_delegation_type" {
   description =   "A service_delegation block as defined below."
   default = null
}

variable "service_delegation_actions" {
   description =   "A list of Actions which should be delegated. This list is specific to the service to delegate to."
   default = null
}

variable "service_endpoints" {
  description =   "The list of Service endpoints to associate with the subnet. Possible values include: Microsoft.AzureActiveDirectory, Microsoft.AzureCosmosDB, Microsoft.ContainerRegistry, Microsoft.EventHub, Microsoft.KeyVault, Microsoft.ServiceBus, Microsoft.Sql, Microsoft.Storage and Microsoft.Web."
  default = null
}

variable "enforce_private_link_endpoint_network_policies"{
  description = ""
  default = false
}
variable "enforce_private_link_service_network_policies" {
  description = ""
  default = false
}
variable "resource_group_name" {
  description = "The resource group name."
}
variable "location" {
  description = "The region were the resource will be deployed."
}

variable "azurerm_network_ddos_protection_plan_name" {
    description = "This is the ddos plan name."
}

variable "tags" {
}

# variable "virtual_network_ids" {
#   description = "These are the network ids assocaited with the DDoS plan."
# }
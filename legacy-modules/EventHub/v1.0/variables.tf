variable "resource_group_name" {
  description = "The resource group name."
}

variable "azurerm_namespace_name" {
  description = "The eventhub namespace name."
}

variable "azurerm_eventhub_name" {
  description = "Specifies the name of the EventHub Namespace resource. Changing this forces a new resource to be created."
}

variable "partition_count" {
  description = "Specifies the current number of shards on the Event Hub. Changing this forces a new resource to be created."
  default     = "2"
}

variable "message_retention" {
  description = "Specifies the number of days to retain the events for this Event Hub."
  default     = "7"
}


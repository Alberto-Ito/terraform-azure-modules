variable "eventhub_consumer_group_name" {
    description = "Specifies the name of the EventHub Consumer Group resource. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
  description = "The name of the resource group in which the EventHub Consumer Group's grandparent Namespace exists. Changing this forces a new resource to be created."
}

variable "namespace_name" {
  description = "Specifies the name of the grandparent EventHub Namespace. Changing this forces a new resource to be created."
}

variable "eventhub_name" {
  description = "Specifies the name of the EventHub. Changing this forces a new resource to be created."
}
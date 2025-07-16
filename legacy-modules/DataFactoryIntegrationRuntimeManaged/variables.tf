variable "data_factory_integration_runtime_managed_name" {
    description = "Specifies the name of the Managed Integration Runtime. Changing this forces a new resource to be created. Must be globally unique. See the Microsoft documentation for all restrictions."
}

variable "data_factory_name" {
    description = "Specifies the name of the Data Factory the Managed Integration Runtime belongs to. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
    description = "The name of the resource group in which to create the Managed Integration Runtime. Changing this forces a new resource to be created."
}

variable "location" {
    description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "node_size" {
    description = "The size of the nodes on which the Managed Integration Runtime runs. Valid values are: Standard_D2_v3, Standard_D4_v3, Standard_D8_v3, Standard_D16_v3, Standard_D32_v3, Standard_D64_v3, Standard_E2_v3, Standard_E4_v3, Standard_E8_v3, Standard_E16_v3, Standard_E32_v3, Standard_E64_v3, Standard_D1_v2, Standard_D2_v2, Standard_D3_v2, Standard_D4_v2, Standard_A4_v2 and Standard_A8_v2"
    default = "Standard_D8_v3"
}

variable "number_of_nodes" {
    description = "Number of nodes for the Managed Integration Runtime. Max is 10. Defaults to 1."
    default = "1"
}

variable "max_parallel_executions_per_node" {
    description = "Defines the maximum parallel executions per node. Defaults to 1. Max is 16."
    default = "1"
}

variable "edition" {
    description = "The Managed Integration Runtime edition. Valid values are Standard and Enterprise. Defaults to Standard."
    default = "Standard"
}
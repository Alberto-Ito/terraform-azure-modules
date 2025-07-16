resource "azurerm_data_factory_integration_runtime_managed" "datafactoryinegrationruntime" {
    name                             = var.data_factory_integration_runtime_managed_name
    data_factory_name                = var. data_factory_name
    resource_group_name              = var.resource_group_name
    location                         = var.location

    node_size                        = var.node_size
    number_of_nodes                  = var.number_of_nodes
    max_parallel_executions_per_node = var.max_parallel_executions_per_node
    edition                          = var.edition
}
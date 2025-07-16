resource "azurerm_kubernetes_cluster_node_pool" "k8snodepool" {
  name                  = var.kubernetes_cluster_node_pool_name
  kubernetes_cluster_id = var.kubernetes_cluster_id
  vm_size               = var.vm_size #"Standard_DS2_v2"
  node_count            = var.node_count
  tags                  = var.tags

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
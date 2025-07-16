output "id" {
  value = azurerm_kubernetes_cluster.k8cluster.id
}

output "principal_id" {
  description = "The Principal ID for the Service Principal associated with the Managed Service Identity of this kubernetes cluster."
  value       = local.create_user_identity ? local.cluster_identity_principal_id : azurerm_kubernetes_cluster.k8cluster.identity[0].principal_id
  sensitive   = true
}

output "name" {
  value = azurerm_kubernetes_cluster.k8cluster.name
}

output "client_certificate" {
  value = azurerm_kubernetes_cluster.k8cluster.kube_config.0.client_certificate
}

output "kube_config_raw" {
  value = azurerm_kubernetes_cluster.k8cluster.kube_config_raw
}

output "fqdn" {
  value = azurerm_kubernetes_cluster.k8cluster.fqdn
}

output "private_fqdn" {
  value = azurerm_kubernetes_cluster.k8cluster.private_fqdn
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.k8cluster.kube_config
  sensitive = true
}

output "node_resource_group" {
  description = "The auto-generated Resource Group which contains the resources for this Managed Kubernetes Cluster."
  value       = azurerm_kubernetes_cluster.k8cluster.node_resource_group
}

# This value do not accept sensitive flag (so far)
output "kubelet_identity" {
  value = azurerm_kubernetes_cluster.k8cluster.kubelet_identity[0]
}

output "kubelet_identity_name" {
  value = "${azurerm_kubernetes_cluster.k8cluster.name}-agentpool"
}

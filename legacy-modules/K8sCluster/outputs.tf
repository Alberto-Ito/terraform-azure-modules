output "id" {
  value = azurerm_kubernetes_cluster.k8cluster.id
}

output "client_certificate" {
  value = azurerm_kubernetes_cluster.k8cluster.kube_config.0.client_certificate
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.k8cluster.kube_config_raw
}

output "fqdn" {
  value = azurerm_kubernetes_cluster.k8cluster.fqdn
}

output "private_fqdn" {
  value = azurerm_kubernetes_cluster.k8cluster.private_fqdn
}
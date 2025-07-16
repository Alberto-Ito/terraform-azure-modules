data "azurerm_resource_group" "node_resourcegroup" {
  count = var.enable_pod_identity ? 1 : 0
  name  = azurerm_kubernetes_cluster.k8cluster.node_resource_group
}

resource "azurerm_role_assignment" "rbac_idoperator" {
  count                = var.enable_pod_identity ? 1 : 0
  scope                = data.azurerm_resource_group.node_resourcegroup[0].id
  role_definition_name = "Managed Identity Operator"
  principal_id         = azurerm_kubernetes_cluster.k8cluster.kubelet_identity[0].object_id
}

resource "azurerm_role_assignment" "rbac_vmcontributor" {
  count                = var.enable_pod_identity ? 1 : 0
  scope                = data.azurerm_resource_group.node_resourcegroup[0].id
  role_definition_name = "Virtual Machine Contributor"
  principal_id         = azurerm_kubernetes_cluster.k8cluster.kubelet_identity[0].object_id
}

module "keyvaultaccesspolicy-0000" {
  count                          = var.enable_pod_identity ? 1 : 0
  source                         = "../../KeyVaultAccessPolicyById/v1.0/"
  tenant_id                      = var.tenant_id
  key_vault_id                   = var.keyvault_id
  object_id                      = azurerm_kubernetes_cluster.k8cluster.kubelet_identity[0].object_id
  policy_key_permissions         = null
  policy_secret_permissions      = ["get", "list"]
  policy_storage_permissions     = null
  policy_certificate_permissions = null
  depends_on = [
    azurerm_kubernetes_cluster.k8cluster
  ]
}

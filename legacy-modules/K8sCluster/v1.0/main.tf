locals {
  # At this point, private cluster do not support System identities.
  aks_identity_type    = var.private_cluster_enabled ? "UserAssigned" : var.identity_type
  create_user_identity = local.aks_identity_type == "UserAssigned"
}

resource "azurerm_user_assigned_identity" "cluster_identity" {
  count               = local.create_user_identity ? 1 : 0
  name                = "aks-identity"
  resource_group_name = var.resource_group_name
  location            = var.location
}

locals {
  cluster_identity_id           = local.create_user_identity ? azurerm_user_assigned_identity.cluster_identity[0].id : null
  cluster_identity_principal_id = local.create_user_identity ? azurerm_user_assigned_identity.cluster_identity[0].principal_id : null
}

# Note: For this rbac, the SPN needs to be part of 'AAD_MS_Network_Hub_001_azmk8s.io-UserAccessAdministrator' group.
resource "azurerm_role_assignment" "rbac_dnszone" {
  count                = var.private_cluster_enabled ? 1 : 0
  scope                = var.private_dns_zone_id
  role_definition_name = "Private DNS Zone Contributor"
  principal_id         = local.cluster_identity_principal_id
}

# BYO Subnet, Route Table, SLB and NSG permissions
resource "azurerm_role_assignment" "rbac_network" {
  count                = var.private_cluster_enabled ? 1 : 0
  scope                = var.virtual_network_id
  role_definition_name = "Network Contributor"
  principal_id         = local.cluster_identity_principal_id
}

# Wait for role assignment to propagate 
resource "time_sleep" "wait_rbac_propagation" {
  count = var.private_cluster_enabled ? 1 : 0
  depends_on = [
    azurerm_role_assignment.rbac_network[0],
    azurerm_role_assignment.rbac_dnszone[0]
  ]
  create_duration = "120s"
}

locals {
  wait_rbac_propagation = var.private_cluster_enabled ? time_sleep.wait_rbac_propagation[0] : null
}

resource "azurerm_kubernetes_cluster" "k8cluster" {
  name                            = var.kubernetes_cluster_name
  location                        = var.location
  resource_group_name             = var.resource_group_name
  dns_prefix                      = var.dns_prefix
  api_server_authorized_ip_ranges = var.api_server_authorized_ip_ranges
  tags                            = var.tags
  sku_tier                        = var.sku_tier
  private_cluster_enabled         = var.private_cluster_enabled
  private_dns_zone_id             = var.private_dns_zone_id
  depends_on = [
    local.wait_rbac_propagation
  ]

  default_node_pool {
    name                = var.default_node_pool_name
    node_count          = var.node_count
    vm_size             = var.vm_size #"Standard_D2_v2"
    enable_auto_scaling = var.enable_auto_scaling
    max_count           = var.max_count
    min_count           = var.min_count
    vnet_subnet_id      = var.vnet_subnet_id
  }

  dynamic "network_profile" {
    for_each = var.network_policy == null ? [] : [var.network_policy]

    content {
      load_balancer_sku  = var.load_balancer_sku
      network_plugin     = var.network_plugin
      network_policy     = var.network_policy
      dns_service_ip     = var.network_dns_service_ip
      service_cidr       = var.network_service_cidr
      docker_bridge_cidr = var.network_docker_bridge_cidr
      outbound_type      = var.outbound_type
    }
  }

  identity {
    type                      = local.aks_identity_type
    user_assigned_identity_id = local.cluster_identity_id
  }

  kubelet_identity {
  }

  role_based_access_control {
    enabled = var.rbac_enabled
  }

  addon_profile {
    http_application_routing { # forces replacement
      enabled = var.http_application_routing_enabled
    }

    azure_policy {
      enabled = var.azure_policy_enabled
    }

    kube_dashboard {
      enabled = var.kube_dashboard_enabled
    }

    oms_agent {
      enabled                    = var.oms_agent_enabled
      log_analytics_workspace_id = var.log_analytics_workspace_id
    }
  }

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

resource "azurerm_role_assignment" "attach_acr" {
  count                = var.attach_acr ? 1 : 0
  scope                = var.acr_id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.k8cluster.kubelet_identity[0].object_id
}

# Diagnostic logs
module "diagnostic_logs" {
  count                      = var.diagnostic_logs_analytics_workspace_id == null ? 0 : 1
  source                     = "../../../Modules/DiagnosticLogs/v1.0/"
  name                       = "diag-${azurerm_kubernetes_cluster.k8cluster.name}"
  target_resource_id         = azurerm_kubernetes_cluster.k8cluster.id
  log_analytics_workspace_id = var.diagnostic_logs_analytics_workspace_id
  logs = [
    "cloud-controller-manager",
    "cluster-autoscaler",
    "csi-azuredisk-controller",
    "csi-azurefile-controller",
    "csi-snapshot-controller",
    "guard",
    "kube-apiserver",
    "kube-audit",
    "kube-audit-admin",
    "kube-controller-manager",
    "kube-scheduler",
  ]
  metrics = ["AllMetrics"]
}

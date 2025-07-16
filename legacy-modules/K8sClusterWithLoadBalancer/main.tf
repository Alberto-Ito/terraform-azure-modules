resource "azurerm_kubernetes_cluster" "k8cluster" {
  name                            = var.kubernetes_cluster_name
  location                        = var.location
  resource_group_name             = var.resource_group_name
  dns_prefix                      = var.dns_prefix
  api_server_authorized_ip_ranges = var.api_server_authorized_ip_ranges
  tags                            = var.tags
  private_cluster_enabled         = var.private_cluster_enabled
  # disk_encryption_set_id          = var.disk_encryption_set_id

  default_node_pool {
    name                = var.default_node_pool_name
    node_count          = var.node_count
    vm_size             = var.vm_size #"Standard_D2_v2"
    enable_auto_scaling = var.enable_auto_scaling
    max_count           = var.max_count
    min_count           = var.min_count
  }

  network_profile {
    load_balancer_sku = var.load_balancer_sku
    network_plugin    = var.network_plugin
    network_policy    = var.network_policy
  }

  identity {
    type = var.identity_type # "SystemAssigned"
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

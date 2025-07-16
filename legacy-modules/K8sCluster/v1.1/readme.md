# Azure Kubernetes Cluster (AKS or Azure Kubernetes Service)

[AKS Terraform Resource Documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster)
[AKS Cluster Nodel Pool Resource Documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_node_pool)

**Notes:**

## Version 1.1:
- Addition of `availability_zones` argument to `default_node_pool` block in k8scluster resource.
- Addition of variable defined as **availability_zones** that has the default value of **null**.
- Overall addition of zone support/zone redundancy for the Azure Kubernetes Cluster node pool.

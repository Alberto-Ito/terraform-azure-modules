variable "kubernetes_cluster_name" {
  description = "The name of the Managed Kubernetes Cluster to create. Changing this forces a new resource to be created."
}
variable "resource_group_name" {
  description = "Specifies the Resource Group where the Managed Kubernetes Cluster should exist. Changing this forces a new resource to be created."
}
variable "location" {
  description = "The region were the resource will be deployed."
}

variable "dns_prefix" {
  description = "DNS prefix specified when creating the managed cluster. Changing this forces a new resource to be created."
}

variable "default_node_pool_name" {
  description = "The name which should be used for the default Kubernetes Node Pool. Changing this forces a new resource to be created."
  default     = "default"
}
variable "node_count" {
  description = "The number of nodes which should exist in this Node Pool. If specified this must be between 1 and 100."
  default     = "1"
}
variable "vm_size" {
  description = "The size of the Virtual Machine, such as Standard_DS2_v2."
  default     = "Standard_DS2_v2"
}
variable "identity_type" {
  description = "The type of identity used for the managed cluster. At this time the only supported value is SystemAssigned."
  default     = "SystemAssigned"
}
variable "max_count" {
  description = "The maximum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 1000."
  default     = "null"
}

variable "min_count" {
  description = "The minimum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 1000."
  default     = "null"
}

variable "enable_auto_scaling" {
  description = "Should the Kubernetes Auto Scaler be enabled for this Node Pool? Defaults to false."
  default     = "false"
}

variable "rbac_enabled" {
  description = "Using Kubernetes role-based access control (RBAC), you can grant users, groups, and service accounts access to only the resources they need"
  default     = "true"
}

variable "api_server_authorized_ip_ranges" {
  description = "The API server is the central way to interact with and manage a cluster. To improve cluster security and minimize attacks, the API server should only be accessible from a limited set of IP address ranges.z"
}

variable "oms_agent_enabled" {
  description = "Ensure AKS logging to Azure Monitoring is configured for containers to monitor the performance of workloads."
  default     = true
}

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics Workspace which the OMS Agent should send data to."
}

variable "load_balancer_sku" {
  description = "Specifies the SKU of the Load Balancer used for this Kubernetes Cluster. Possible values are Basic and Standard. Defaults to Standard."
  default     = "standard"
}

variable "network_plugin" {
  description = "Network plugin to use for networking. Currently supported values are azure and kubenet. Changing this forces a new resource to be created. NOTE: When network_plugin is set to azure - the vnet_subnet_id field in the default_node_pool block must be set and pod_cidr must not be set."
  default     = "azure"
}

variable "network_policy" {
  description = "Sets up network policy to be used with Azure CNI. Network policy allows us to control the traffic flow between pods. Currently supported values are calico and azure. Changing this forces a new resource to be created. NOTE: When network_policy is set to azure, the network_plugin field can only be set to azure."
  default     = "azure"
}

variable "http_application_routing_enabled" {
  description = "Is HTTP Application Routing Enabled?"
  default     = false
}

variable "tags" {
}

variable "disk_encryption_set_id" {
  description = "The ID of the Disk Encryption Set which should be used for the Nodes and Volumes."
  type        = string
  default     = null
}

variable "private_cluster_enabled" {
  description = "Should this Kubernetes Cluster have its API server only exposed on internal IP addresses? This provides a Private IP Address for the Kubernetes API on the Virtual Network where the Kubernetes Cluster is located"
  default     = true
}

variable "azure_policy_enabled" {
  description = "Is the Azure Policy for Kubernetes Add On enabled?"
  default     = true
}

variable "kube_dashboard_enabled" {
  description = "Is the Kubernetes Dashboard enabled?"
  default     = false
}

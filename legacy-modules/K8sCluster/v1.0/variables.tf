variable "kubernetes_cluster_name" {
  description = "The name of the Managed Kubernetes Cluster to create. Changing this forces a new resource to be created."
}
variable "resource_group_name" {
  description = "Specifies the Resource Group where the Managed Kubernetes Cluster should exist. Changing this forces a new resource to be created."
}

variable "virtual_network_id" {
  description = "The Virtual Network ID to assign RBAC. Required for a private cluster."
  type        = string
  default     = null
}

variable "location" {
  description = "The region were the resource will be deployed."
}

variable "dns_prefix" {
  description = "DNS prefix specified when creating the managed cluster. Changing this forces a new resource to be created."
}

variable "default_node_pool_name" {
  description = "The name which should be used for the default Kubernetes Node Pool. Changing this forces a new resource to be created."
  type        = string
  default     = "default"
}
variable "node_count" {
  description = "The number of nodes which should exist in this Node Pool. If specified this must be between 1 and 100."
  type        = number
  default     = 1
}
variable "vm_size" {
  description = "The size of the Virtual Machine, such as Standard_DS2_v2."
  type        = string
  default     = "Standard_DS2_v2"
}
variable "identity_type" {
  description = "The type of identity used for the managed cluster. At this time the only supported value is SystemAssigned."
  default     = "SystemAssigned"
}
variable "max_count" {
  description = "The maximum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 1000."
  type        = number
  default     = null
}

variable "min_count" {
  description = "The minimum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 1000."
  type        = number
  default     = null
}

variable "enable_auto_scaling" {
  description = "Should the Kubernetes Auto Scaler be enabled for this Node Pool? Defaults to false."
  type        = bool
  default     = false
}

variable "rbac_enabled" {
  description = "Using Kubernetes role-based access control (RBAC), you can grant users, groups, and service accounts access to only the resources they need"
  type        = bool
  default     = true
}

variable "api_server_authorized_ip_ranges" {
  description = "The API server is the central way to interact with and manage a cluster. To improve cluster security and minimize attacks, the API server should only be accessible from a limited set of IP address ranges.z"
  type        = list(string)
  default     = null
}

variable "oms_agent_enabled" {
  description = "Ensure AKS logging to Azure Monitoring is configured for containers to monitor the performance of workloads."
  type        = bool
  default     = true
}

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics Workspace which the OMS Agent should send data to."
  type        = string
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
  type        = string
  default     = null # "azure"
}

variable "http_application_routing_enabled" {
  description = "Is HTTP Application Routing Enabled?"
  type        = bool
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
  type        = bool
  default     = true
}

variable "azure_policy_enabled" {
  description = "Is the Azure Policy for Kubernetes Add On enabled?"
  type        = bool
  default     = true
}

variable "kube_dashboard_enabled" {
  description = "Is the Kubernetes Dashboard enabled?"
  type        = bool
  default     = false
}

variable "vnet_subnet_id" {
  description = "The ID of a Subnet where the Kubernetes Node Pool should exist. Changing this forces a new resource to be created."
  default     = null
}

variable "private_dns_zone_id" {
  description = "ID of Private DNS Zone which should be delegated to this Cluster."
  type        = string
  default     = null
}

variable "attach_acr" {
  description = "Enable ACR Pull attach. Needs 'acr_id' to be defined."
  type        = bool
  default     = false
}

variable "acr_id" {
  description = "Attach ACR ID to allow ACR Pull from the SP/Managed Indentity."
  type        = string
  default     = null
}

variable "enable_pod_identity" {
  description = "Enable Pod Identity."
  type        = bool
  default     = false
}

variable "keyvault_id" {
  description = "Keyvault ID to read secrets. Required for POD Identity."
  type        = string
  default     = null
}

variable "tenant_id" {
  description = "Keyvault's Tenant ID. Required for POD Identity."
  type        = string
  default     = null
}

variable "sku_tier" {
  description = "(Optional) The SKU Tier that should be used for this Kubernetes Cluster. Possible values are Free and Paid (which includes the Uptime SLA). Defaults to Free."
  default     = "Free"
  type        = string

  validation {
    condition     = contains(["Free", "Paid"], var.sku_tier)
    error_message = "The sku tier is invalid."
  }
}

variable "network_dns_service_ip" {
  description = "(Optional) IP address within the Kubernetes service address range that will be used by cluster service discovery (kube-dns). Changing this forces a new resource to be created."
  type        = string
  default     = null # equals to "10.0.0.10"
}

variable "network_service_cidr" {
  description = "(Optional) The Network Range used by the Kubernetes service. Changing this forces a new resource to be created."
  type        = string
  default     = null # equals to "10.0.0.0/16"
}

variable "network_docker_bridge_cidr" {
  description = "(Optional) IP address (in CIDR notation) used as the Docker bridge IP address on nodes. Changing this forces a new resource to be created."
  type        = string
  default     = null # equals to "172.17.0.1/16"
}

variable "outbound_type" {
  description = "(Optional) The outbound (egress) routing method which should be used for this Kubernetes Cluster. Possible values are loadBalancer and userDefinedRouting. Defaults to loadBalancer."
  type        = string
  default     = "loadBalancer"

  validation {
    condition     = contains(["loadBalancer", "userDefinedRouting"], var.outbound_type)
    error_message = "The outbound type is invalid."
  }
}

variable "diagnostic_logs_analytics_workspace_id" {
  description = "(Optional) The logs analytics workspace id to store the diagnostic logs."
  type        = string
  default     = null
}

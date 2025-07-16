variable "kubernetes_cluster_node_pool_name" {
  description = "The name of the Node Pool which should be created within the Kubernetes Cluster. Changing this forces a new resource to be created. NOTE: A Windows Node Pool cannot have a name longer than 6 characters."
}


variable "kubernetes_cluster_id" {
  description = "The ID of the Kubernetes Cluster where this Node Pool should exist. Changing this forces a new resource to be created.NOTE: The type of Default Node Pool for the Kubernetes Cluster must be VirtualMachineScaleSets to attach multiple node pools."
}

variable "vm_size" {
  description = "The SKU which should be used for the Virtual Machines used in this Node Pool. Changing this forces a new resource to be created."
  default     = "Standard_DS2_v2"
}

variable "node_count" {
  description = "The initial number of nodes which should exist within this Node Pool. Valid values are between 0 and 1000 and must be a value in the range min_count - max_count."
  default     = "1"
}

variable "tags" {
}
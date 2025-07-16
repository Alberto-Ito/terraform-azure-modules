variable "synapse_firewall_rule_name" {
    description = "The Name of the firewall rule. Changing this forces a new resource to be created."
}
variable "synapse_workspace_id" {
    description = "The ID of the Synapse Workspace on which to create the Firewall Rule. Changing this forces a new resource to be created."
}

variable "start_ip_address" {
    description = "The starting IP address to allow through the firewall for this rule."
    default = "0.0.0.0"
}

variable "end_ip_address" {
    description = "The ending IP address to allow through the firewall for this rule."
    default = "255.255.255.255"
}
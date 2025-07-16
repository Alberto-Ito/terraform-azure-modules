variable "azresource" {
  default = ""
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the storage account. Changing this forces a new resource to be created."

}


variable "storage_account_name" {
  description = "Specifies the name of the storage account. Changing this forces a new resource to be created. This must be unique across the entire Azure service, not just within the resource group."

}

variable "default_action" {
  description = "Specifies the default action of allow or deny when no other rules match. Valid options are Deny or Allow."
  default     = "Deny"
}

#############################
#############################
########## IP Rules VAR######
# NOTE
# Small address ranges using "/31" or "/32" prefix sizes are not supported. These ranges should be configured using individual IP address rules without prefix specified.

# NOTE
# IP network rules have no effect on requests originating from the same Azure region as the storage account. Use Virtual network rules to allow same-region requests. Services deployed in the same region as the storage account use private Azure IP addresses for communication. Thus, you cannot restrict access to specific Azure services based on their public outbound IP address range.

# NOTE
# User has to explicitly set ip_rules to empty slice ([]) to remove it.
#############################
#############################

variable "ip_rules" {
  description = "List of public IP or IP ranges in CIDR Format. Only IPV4 addresses are allowed. Private IP address ranges (as defined in RFC 1918) are not allowed."
}

# NOTE
# User has to explicitly set virtual_network_subnet_ids to empty slice ([]) to remove it.

variable "virtual_network_subnet_ids" {
  description = "A list of virtual network subnet ids to to secure the storage account."
}

# NOTE
# User has to explicitly set bypass to empty slice ([]) to remove it.

variable "bypass" {
  description = "- (Optional) Specifies whether traffic is bypassed for Logging/Metrics/AzureServices. Valid options are any combination of Logging, Metrics, AzureServices, or None."
  default     = "Metrics"
}
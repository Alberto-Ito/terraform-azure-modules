variable "azurerm_network_security_rule_name" {
  description = "The network security group rule name."
  default     = "RDP"
}

variable "priority" {
  description = "This represents the rule priority."
  default     = "100"
}
variable "direction" {
  description = "This represents the rule direction."
  default     = "Inbound"
}

variable "access" {
  description = "This represents either allow or deny."
  default     = "Deny"
}

variable "protocol" {
  description = "This represents the protcol for the rule."
  default     = "TCP"
}

variable "source_port_range" {
  description = "This represents the rule source port range."
  default     = "*"
}

variable "destination_port_range" {
  description = "This represents the rule destination port range."
  default     = "3389"
}

variable "source_address_prefix" {
  description = "This represents the rule source address prefix."
  default     = "*"
}

variable "destination_address_prefix" {
  description = "This represents the rule destination address prefix."
  default     = "*"
}

variable "resource_group_name" {
  description = "The resource group name."
}

variable "target_azurerm_network_security_group_name" {
  description = "This represents the network security group target."
}

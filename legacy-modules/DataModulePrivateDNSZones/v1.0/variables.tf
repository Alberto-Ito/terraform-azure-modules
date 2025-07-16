variable "resource_group_name" {
  type        = string
  description = "Private DNS Zones Resource Group Name."
}

variable "adx_locations" {
  description = "Location list for ADX Private DNS Zones."
  # Accepts a string or list of strings. For example: "eastus2" or ["centralus", "eastus2"]
  default = []
}

variable "redis_firewall_rule_name" {
  description = "The name of the Firewall Rule. Changing this forces a new resource to be created."
}

variable "redis_cache_name" {
  description = "The name of the Redis Cache. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
  description = "The name of the resource group in which this Redis Cache exists."
}

variable "start_ip" {
  description = "The lowest IP address included in the range"
}

variable "end_ip" {
  description = "The highest IP address included in the range."
}
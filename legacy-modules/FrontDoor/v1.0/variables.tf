variable "front_door_name" {
  description = "The name of the Front Door."
}

variable "location" {
  description = "The resource location."
}

variable "resource_group_name" {
  description = "Resource group name."
}

variable "enforce_backend_pools_certificate_name_check" {
  description = "Enforce certificate name check on HTTPS requests to all backend pools, this setting will have no effect on HTTP requests."
  default     = false
}

variable "routing_rule_name" {
  description = "Specifies the name of the Routing Rule."
}

variable "routing_rule_frontend_endpoint" {
  description = "The names of the frontend_endpoint blocks within this resource to associate with this routing_rule."
}

variable "routing_rule_accepted_protocols" {
  description = "Protocol schemes to match for the Backend Routing Rule."
  default     = ["Https"]
}

variable "routing_rule_patterns_to_match" {
  description = "The route patterns for the Backend Routing Rule."
  default     = ["/*"]
}

variable "routing_rule_forwarding_configuration_forwarding_protocol" {
  description = "Protocol to use when redirecting. Valid options are HttpOnly, HttpsOnly, or MatchRequest."
  default     = "HttpOnly"
}

variable "routing_rule_forwarding_configuration_cache_enabled" {
  description = "Specifies whether to Enable caching or not."
  default     = false
}

variable "backend_pool_name" {
  description = " Specifies the name of the Backend Pool."
}

variable "backend_pool_load_balancing_name" {
  description = "Specifies the name of the Load Balancer."
}

variable "backend_pool_health_probe_name" {
  description = " Specifies the name of the Health Probe."
}

variable "backend_pool_backend_host_header" {
  description = "The value to use as the host header sent to the backend."
}

variable "backend_pool_backend_address" {
  description = "Location of the backend (IP address or FQDN)"
}

variable "backend_pool_backend_http_port" {
  description = "The HTTP TCP port number."
  default     = 80
}

variable "backend_pool_backend_https_port" {
  description = "The HTTPS TCP port number."
  default     = 443
}

variable "tags" {
}

variable "web_application_firewall_policy_link_id" {
  description = "(Optional) Defines the Web Application Firewall policy ID for each host."
  default     = null
}

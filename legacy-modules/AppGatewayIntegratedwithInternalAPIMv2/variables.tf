variable "resource_group_name" {
  description = "The name of the resource group in which to the Application Gateway should exist. Changing this forces a new resource to be created."
}

variable "location" {
  description = "The Azure region where the Application Gateway should exist. Changing this forces a new resource to be created."
}

variable "identity_identity_ids" {
  description = "Specifies a list with a single user managed identity id to be assigned to the Application Gateway."
}

variable "ssl_certificate" {
  description = "(base-64 encoded unencrypted pfx) Secret or Certificate object stored in Azure KeyVault. You need to enable soft delete for keyvault to use this feature. Required if data is not set."
}

variable "application_gateway_name" {
  description = "The name of the Application Gateway. Changing this forces a new resource to be created."
}

variable "sku_name" {
  description = "The Name of the SKU to use for this Application Gateway. Possible values are Standard_Small, Standard_Medium, Standard_Large, Standard_v2, WAF_Medium, WAF_Large, and WAF_v2."
}

variable "sku_tier" {
  description = "The Tier of the SKU to use for this Application Gateway. Possible values are Standard, Standard_v2, WAF and WAF_v2."
}

variable "sku_capacity" {
  description = "The Capacity of the SKU to use for this Application Gateway. When using a V1 SKU this value must be between 1 and 32, and 1 to 125 for a V2 SKU. This property is optional if autoscale_configuration is set."
}

variable "gateway_ip_configuration_subnet_id" {
  description = "The ID of the Subnet which the Application Gateway should be connected to."
}

variable "frontend_port" {
  description = "The port used for this Frontend Port."
  default     = "443"
}

variable "public_ip_address" {
  description = "Public IP Address which the Application Gateway should use."
}

variable "backend_ip_addresses" {
  description = "A list of FQDN's which should be part of the Backend Address Pool."
  type        = list(string)
}

variable "cookie_based_affinity" {
  description = "Is Cookie-Based Affinity enabled? Possible values are Enabled and Disabled."
  default     = "Disabled"
}

variable "path" {
  description = "The Path which should be used as a prefix for all HTTP requests."
  default     = ""
}

variable "backend_http_settings_port" {
  description = "The port which should be used for this Backend HTTP Settings Collection."
  default     = "443"
}

variable "backend_http_settings_protocol" {
  description = "The Protocol which should be used. Possible values are Http and Https."
  default     = "Https"
}

variable "backend_http_settings_request_timeout" {
  description = "The request timeout in seconds, which must be between 1 and 86400 seconds."
  default     = "60"
}

variable "backend_http_settings_host_name" {
  description = "Host header to be sent to the backend servers. Cannot be set if pick_host_name_from_backend_address is set to true."
}

variable "backend_http_settings_dev_host_name" {
  description = "Host header to be sent to the Dev portal backend servers. Cannot be set if pick_host_name_from_backend_address is set to true."
  default     = null
}

variable "http_listener_protocol" {
  description = "The Protocol to use for this HTTP Listener. Possible values are Http and Https."
  default     = "Https"
}

variable "rule_type" {
  description = "The Type of Routing that should be used for this Rule. Possible values are Basic and PathBasedRouting."
  default     = "Basic"
}

variable "is_gateway_url_default_http_setting" {
  description = "Whether or not to the gateway URL is the default http setting. Default to true."
  default     = "true"
}

variable "routing_rule_paths" {
  description = "The path for the PathBased routing rule to set the child target. Defaultsks to path with."
  default     = ["/*"]
}

# Probe API Management Gateway

variable "probe_name" {
  description = "The Name of the Probe."
}

variable "probe_host" {
  description = "The Hostname used for this Probe. If the Application Gateway is configured for a single site, by default the Host name should be specified as ‘127.0.0.1’, unless otherwise configured in custom probe. Cannot be set if pick_host_name_from_backend_http_settings is set to true."
  default     = null
}

variable "probe_interval" {
  description = "The Interval between two consecutive probes in seconds. Possible values range from 1 second to a maximum of 86,400 seconds."
  default     = "30"
}

variable "probe_protocol" {
  description = "The Protocol used for this Probe. Possible values are Http and Https."
  default     = "Https"
}

variable "probe_path" {
  description = "The Path used for this Probe."
  default     = "/"
}

variable "dev_probe_path" {
  description = "The Path used for this Probe's developer portal."
  default     = "/"
}

variable "probe_timeout" {
  description = "The Timeout used for this Probe, which indicates when a probe becomes unhealthy. Possible values range from 1 second to a maximum of 86,400 seconds."
  default     = "30"
}

variable "probe_unhealthy_threshold" {
  description = "The Unhealthy Threshold for this Probe, which indicates the amount of retries which should be attempted before a node is deemed unhealthy. Possible values are from 1 - 20 seconds."
  default     = "3"
}

variable "probe_pick_host_name_from_backend_http_settings" {
  description = "Whether the host header should be picked from the backend http settings. Defaults to false."
  default     = false
}

variable "tags" {
}

variable "min_protocol_version" {
  description = "Used to set minimum protocol that Application Gateway should support."
  default     = "TLSv1_2"
}

variable "cipher_suites" {
  description = "Holds the accepted cipher suites for Application Gateway."
  type        = list(string)
  default = ["TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256",
    "TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384",
    "TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA",
    "TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA",
    "TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256",
    "TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384",
    "TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384",
    "TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256",
    "TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA",
    "TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA",
    "TLS_RSA_WITH_AES_256_GCM_SHA384",
    "TLS_RSA_WITH_AES_128_GCM_SHA256",
    "TLS_RSA_WITH_AES_256_CBC_SHA256",
    "TLS_RSA_WITH_AES_128_CBC_SHA256",
    "TLS_RSA_WITH_AES_256_CBC_SHA",
  "TLS_RSA_WITH_AES_128_CBC_SHA"]
}

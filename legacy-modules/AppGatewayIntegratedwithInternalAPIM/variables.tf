# Key Vault
variable "identity_identity_ids" {
description = "Specifies a list with a single user managed identity id to be assigned to the Application Gateway."
}

variable "user_assigned_identity_resource_group_name" {
    description = "The resource group where the mananged id exist."
}
variable "key_vault_name" {
  description = "The key vault where the SSL certificate is stored."
}

variable "key_vault_resource_group_name" {
  description = "The resource group where the key vault is stored."
}


variable "ssl_certificate_name" {
  description = "The name of the SSL certificate that the App Gateway will use."
}

# SSL

# variable "ssl_certificate_key_vault_secret_id" {
#   description = "Secret Id of (base-64 encoded unencrypted pfx) Secret or Certificate object stored in Azure KeyVault. You need to enable soft delete for keyvault to use this feature. Required if data is not set."
# }


variable "application_gateway_name" {
  description = "The name of the Application Gateway. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
  description = "The name of the resource group in which to the Application Gateway should exist. Changing this forces a new resource to be created."
}

variable "location" {
  description = "The Azure region where the Application Gateway should exist. Changing this forces a new resource to be created."
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
}

variable "public_ip_address_id" {
  description = "The ID of a Public IP Address which the Application Gateway should use."
}

variable "public_ip_address_name" {
  description = "The FQDN of a Public IP Address which the Application Gateway should use."
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
}

variable "http_listener_protocol" {
  description = "The Protocol to use for this HTTP Listener. Possible values are Http and Https."
  default     = "Https"
}

variable "rule_type" {
  description = "The Type of Routing that should be used for this Rule. Possible values are Basic and PathBasedRouting."
  default     = "Basic"
}

variable "redirect_type" {
  description = "The type of redirect. Possible values are Permanent, Temporary, Found and SeeOther."
  default     = "Permanent"
}

variable "redirect_include_path" {
  description = "Whether or not to include the path in the redirected Url. Defaults to false"
  default     = "true"
}

variable "include_query_string" {
  description = "Whether or not to include the query string in the redirected Url. Default to false."
  default     = "true"
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

# variable "probe_port" {
#   description = "Custom port which will be used for probing the backend servers. The valid value ranges from 1 to 65535. In case not set, port from http settings will be used. This property is valid for Standard_v2 and WAF_v2 only."
#   default     = "443"
# }

variable "probe_pick_host_name_from_backend_http_settings" {
  description = "Whether the host header should be picked from the backend http settings. Defaults to false."
  default     = false
}

# variable "match_status_code" {
#   description = "A list of allowed status codes for this Health Probe."
#   default     = "200-399"
# }

variable "tags" {
}

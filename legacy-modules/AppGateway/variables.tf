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
  default     = "80"
}

variable "backend_http_settings_protocol" {
  description = "The Protocol which should be used. Possible values are Http and Https."
  default     = "Http"
}

variable "backend_http_settings_request_timeout" {
  description = "The request timeout in seconds, which must be between 1 and 86400 seconds."
  default     = "60"
}

variable "http_listener_protocol" {
  description = "The Protocol to use for this HTTP Listener. Possible values are Http and Https."
  default     = "Http"
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

variable "tags" {
}
variable "resource_group_name" {
  description = "The resource group name."
  type        = string
}

variable "api_management_name" {
  description = "The name of the API Management Service."
  type        = string
}

variable "api_management_logger_id" {
  description = "The ID of the API Management Logger."
  type        = string
}

variable "api_name" {
  description = "The name of the API on which to configure the Diagnostics Logs."
  type        = string
}

variable "identifier" {
  description = "Identifier of the Diagnostics Logs. Possible values are 'applicationinsights' and 'azuremonitor'."
  type        = string
  default     = "applicationinsights"
}

variable "sampling_percentage" {
  description = "Sampling (%). For high traffic APIs, please read this documentation to understand performance implications and log sampling. Valid values are between 0.0 and 100.0."
  type        = number
  default     = 20
}

variable "always_log_errors" {
  description = "Always log errors. Send telemetry if there is an erroneous condition, regardless of sampling settings."
  type        = bool
  default     = true
}

variable "log_client_ip" {
  description = "Boolean, log client IP address."
  type        = bool
  default     = true
}

variable "verbosity" {
  description = "Logging verbosity. Possible values are 'verbose', 'information' or 'error'."
  type        = string
  default     = "information"
}

variable "http_correlation_protocol" {
  description = "The HTTP Correlation Protocol to use. Possible values are 'None', 'Legacy' or 'W3C'."
  type        = string
  default     = "W3C"
}

variable "frontend_request" {
  type = object({
    body_bytes     = number
    headers_to_log = list(string)
  })
  default = {
    body_bytes = 1024
    headers_to_log = [
      "accept",
      "content-type",
      "origin"
    ]
  }
}

variable "frontend_response" {
  type = object({
    body_bytes     = number
    headers_to_log = list(string)
  })
  default = {
    body_bytes = 1024
    headers_to_log = [
      "content-length",
      "content-type",
      "origin"
    ]
  }
}

variable "backend_request" {
  type = object({
    body_bytes     = number
    headers_to_log = list(string)
  })
  default = {
    body_bytes = 1024
    headers_to_log = [
      "accept",
      "content-type",
      "origin"
    ]
  }
}

variable "backend_response" {
  type = object({
    body_bytes     = number
    headers_to_log = list(string)
  })
  default = {
    body_bytes = 1024
    headers_to_log = [
      "content-type",
      "content-length",
      "origin"
    ]
  }
}

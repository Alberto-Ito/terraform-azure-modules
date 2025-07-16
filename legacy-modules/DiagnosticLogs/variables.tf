variable "name" {
  type = string
}

variable "target_resource_id" {
  type = string
}

variable "storage_account_id" {
  type    = string
  default = null
}

variable "log_analytics_workspace_id" {
  type    = string
  default = null
}

variable "logs" {
  description = "Logs to add."
  type        = list(string)
  default     = []
}

variable "metrics" {
  description = "Metrics to add."
  type        = list(string)
  default     = []
}

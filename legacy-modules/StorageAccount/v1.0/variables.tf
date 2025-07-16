variable "resource_group_name" {
  description = "The resource group name."
}

variable "location" {
  description = "The region were the resource will be deployed."
}

variable "azurerm_storage_account_name" {
  description = "The storage account name."
}

variable "account_tier" {
  description = " The access tier for the storage account."
  default     = "Standard"
}

variable "account_replication_type" {
  default = "LRS"
}

variable "min_tls_version" {
   default =   "TLS1_2"
}

variable "tags" {
}

variable "allowed_origins" {
  description = "A list of origin domains that will be allowed by CORS."
  default = ["*"]
}

variable allowed_headers {
  description = "A list of headers that are allowed to be a part of the cross-origin request"
  default = ["*"]
}

variable allowed_methods {
  description = "A list of http methods that are allowed to be executed by the origin. Valid options are DELETE, GET, HEAD, MERGE, POST, OPTIONS, PUT or PATCH."
  default = ["DELETE", "GET", "HEAD", "MERGE", "POST", "OPTIONS", "PUT", "PATCH"]
}

variable exposed_headers {
  description = "A list of response headers that are exposed to CORS clients."
  default = ["*"]
}

variable max_age_in_seconds {
  description = "The number of seconds the client should cache a preflight response."
  default = 200
}

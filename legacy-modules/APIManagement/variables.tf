variable "resource_group_name" {
  description = "The resource group name."
}
variable "location" {
  description = "The region were the resource will be deployed."
}

variable "azurerm_api_management_name" {
  description = "The name of the API Management Service. Changing this forces a new resource to be created."
}

variable "publisher_name" {
  description = "The name of publisher/company."
}

variable "publisher_email" {
  description = "The email of publisher/company."
}

variable "sku_name" {
  description = "sku_name is a string consisting of two parts separated by an underscore(_). The fist part is the name, valid values include: Consumption, Developer, Basic, Standard and Premium. The second part is the capacity (e.g. the number of deployed units of the sku), which must be a positive integer (e.g. Developer_1)."
  default     = "Developer_1"
}

variable "tags" {
}

variable "enable_backend_ssl30" {
  description = "Flag to enable/disable SSL3 on bakend"
  default     = false
}

variable "enable_backend_tls10" {
  description = "Flag to enable/disable TLS 1.0 on bakend"
  default     = false
}

variable "enable_backend_tls11" {
  description = "Flag to enable/disable 1.1 on bakend"
  default     = false
}

variable "enable_frontend_ssl30" {
  description = "Flag to enable/disable SSL3 on front end"
  default     = false
}

variable "enable_frontend_tls10" {
  description = "Flag to enable/disable TLS 1.0 on front end"
  default     = false
}

variable "enable_frontend_tls11" {
  description = "Flag to enable/disable 1.1 on front end"
  default     = false
}

variable "tls_ecdhe_ecdsa_with_aes256_cbc_sha_ciphers_enabled" {
  description = "Flag to enable/disable TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA"
  default     = false
}

variable "tls_ecdhe_ecdsa_with_aes128_cbc_sha_ciphers_enabled" {
  description = "Flag to enable/disable TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA"
  default     = false
}

variable "tls_ecdheRsa_with_aes256_cbc_sha_ciphers_enabled" {
  description = "Flag to enable/disable TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA"
  default     = false
}

variable "tls_ecdheRsa_with_aes128_cbc_sha_ciphers_enabled" {
  description = "Flag to enable/disable TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA"
  default     = false
}

variable "tls_rsa_with_aes128_gcm_sha256_ciphers_enabled" {
  description = "Flag to enable/disable TLS_RSA_WITH_AES_128_GCM_SHA256"
  default     = false
}

variable "tls_rsa_with_aes256_cbc_sha256_ciphers_enabled" {
  description = "Flag to enable/disable TLS_RSA_WITH_AES_256_CBC_SHA256"
  default     = false
}

variable "tls_rsa_with_aes128_cbc_sha256_ciphers_enabled" {
  description = "Flag to enable/disable TLS_RSA_WITH_AES_128_CBC_SHA256"
  default     = false
}

variable "tls_rsa_with_aes256_cbc_sha_ciphers_enabled" {
  description = "Flag to enable/disable TLS_RSA_WITH_AES_256_CBC_SHA"
  default     = false
}

variable "tls_rsa_with_aes128_cbc_sha_ciphers_enabled" {
  description = "Flag to enable/disable TLS_RSA_WITH_AES_128_CBC_SHA"
  default     = false
}

variable "triple_des_ciphers_enabled" {
  description = "Flag to enable/disable TripleDes168"
  default     = false
}

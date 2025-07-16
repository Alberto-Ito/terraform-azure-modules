variable "source_certificate" {
  description = "The source certificate."
}

variable "source_secret" {
  description = "The source secret associated to the certificate."
}

variable "target_key_vault_id" {
  description = "The id of the target Key Vault."
}

variable "is_self_signed" {
  description = "True, if copying a self-signed certificate"
  type        = bool
  default     = false
}

variable "tags" {
}

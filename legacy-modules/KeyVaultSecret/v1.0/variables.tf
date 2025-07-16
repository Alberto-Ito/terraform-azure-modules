variable "key_vault_id" {
  description = "The key vault id."
}

variable "secret_name" {
  description = "The secret name."
}

variable "secret_value" {
  description = "The secret value."
  # Parameter only available on Terraform 0.14
  #   sensitive   = true
}

variable "content_type" {
  description = "Specifies the content type for the Key Vault Secret."
  default     = "sensitive"
}

# expiration_date will be calculated if null. Ignored on updates (lifecycle)
variable "expiration_date" {
  description = "Expiration UTC datetime (Y-m-d'T'H:M:S'Z')."
  default     = null
}

variable "tags" {
}

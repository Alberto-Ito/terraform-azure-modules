variable "azurerm_key_vault_certificate_name" {
  description = "The name of the certificate."
}

variable "azurerm_key_vault_id" {
  description = "The id of the Key Vault."
}

variable "certificate_contents" {
  description =  "contents of certificate, input file name"
}

variable "certificate_password" {
  description = "password of the certificate"
}

variable "certificate_policy_issuer_parameters_name" {
  description = "The name of the Certificate Issuer. Possible values include Self (for self-signed certificate), or Unknown (for a certificate issuing authority like Let's Encrypt and Azure direct supported ones)."
  default     = "Self"
}

variable "key_properties_key_type" {
  description = "Specifies the Type of Key, such as RSA."
  default     = "RSA"
}
variable "key_property_key_size" {
  description = "The size of the Key used in the Certificate. Possible values include 2048, 3072, and 4096."
  default     = 2048
}

variable "key_properties_reusable" {
  description = "if the key is reusable"
  default     = false
}

variable "key_properties_exportable" {
    description = "if key is exportable"
    default = true
}

variable "secret_properties_content_type" {
    description = "The Content-Type of the Certificate, such as application/x-pkcs12 for a PFX or application/x-pem-file for a PEM."
    default = "application/x-pkcs12"
}
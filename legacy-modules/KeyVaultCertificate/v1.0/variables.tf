variable "certificate_name" {
  description = "The name of the certificate."
}

variable "key_vault_id" {
  description = "The id of the Key Vault."
}

variable "certificate_policy_issuer_parameters_name" {
  description = "The name of the Certificate Issuer. Possible values include Self (for self-signed certificate), or Unknown (for a certificate issuing authority like Let's Encrypt and Azure direct supported ones)."
  default     = "Self"
}

variable "key_properties_exportable" {
  description = "Determines if the Key is exportable."
  default     = true
}

variable "key_properties_key_size" {
  description = "The size of the Key used in the Certificate. Possible values include 2048, 3072, and 4096."
  default     = 2048
}

variable "key_properties_key_type" {
  description = "Specifies the Type of Key, such as RSA."
  default     = "RSA"
}

variable "key_properties_reuse_key" {
  description = "Determines if the Key is reusable."
  default     = true
}

variable "lifetime_action_action_type" {
  description = "he Type of action to be performed when the lifetime trigger is triggered. Possible values include AutoRenew and EmailContacts."
  default     = "AutoRenew"
}

variable "lifetime_action_trigger_days_before_expiry" {
  description = "The number of days before the Certificate expires that the action associated with this Trigger should run."
  default     = 30
}

variable "secret_properties_content_type" {
  description = "The Content-Type of the Certificate, such as application/x-pkcs12 for a PFX or application/x-pem-file for a PEM."
  default     = "application/x-pkcs12"
}

# Server Authentication = 1.3.6.1.5.5.7.3.1
# Client Authentication = 1.3.6.1.5.5.7.3.2
variable "x509_certificate_properties_extended_key_usage" {
  description = "A list of Extended/Enhanced Key Usages."
  default     = null
}

variable "x509_certificate_properties_key_usage" {
  description = " A list of uses associated with this Key. Possible values include cRLSign, dataEncipherment, decipherOnly, digitalSignature, encipherOnly, keyAgreement, keyCertSign, keyEncipherment and nonRepudiation and are case-sensitive."
  default     = ["cRLSign", "dataEncipherment", "digitalSignature", "keyAgreement", "keyCertSign", "keyEncipherment"]
}

variable "x509_certificate_properties_subject_alternative_names_dns_names" {
  description = "A list of alternative DNS names (FQDNs) identified by the Certificate."
  default     = null
}

variable "x509_certificate_properties_subject" {
  description = "The Certificate's Subject."
}

variable "x509_certificate_properties_validity_in_months" {
  description = "The Certificates Validity Period in Months."
  default     = 12
}

variable "tags" {
}
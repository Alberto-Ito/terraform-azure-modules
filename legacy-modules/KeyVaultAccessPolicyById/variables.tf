variable "policy_key_permissions" {
  default = ["get", "list"]
}

variable "policy_secret_permissions" {
  default = ["get", "list"]
}

variable "policy_storage_permissions" {
  default = ["get", "listsas"]
}

variable "object_id" {
  description = "The object ID of a user, service principal or security group in the Azure Active Directory tenant for the vault. The object ID must be unique for the list of access policies. Changing this forces a new resource to be created."
}

variable "policy_certificate_permissions" {
  default = ["get", "list"]
}

variable "key_vault_id" {
  description = "Specifies the id of the Key Vault resource. Changing this forces a new resource to be created."
}

variable "tenant_id" {
  description = " The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault. Changing this forces a new resource to be created."
}

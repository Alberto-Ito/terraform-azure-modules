variable "key_vault_name" {
  description = "The key vault name."
}

variable "key_vault_resource_group_name" {
  description = "The name of the resource group that host the key vault."
}

variable "policy_key_permissions" {
    default = ["get", "list"]
}

variable "policy_secret_permissions" {
   default =   ["get", "list"]
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
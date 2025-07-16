variable "name" {
  description = "The name of the Disk Encryption Set. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
  description = "The resource group name."
}

variable "location" {
  description = "The region were the resource will be deployed."
}

variable "key_vault_id" {
  description = "Specifies the ID of a Key Vault Key."
}

variable "expiration_date" {
  description = "Expiration UTC datetime (Y-m-d'T'H:M:S'Z')."
}

variable "tags" {

}

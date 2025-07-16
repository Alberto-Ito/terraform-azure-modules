variable "name" {
  description = "Specifies the name of the Key Vault Key. Changing this forces a new resource to be created."
}

variable "key_vault_id" {
  description = "The ID of the Key Vault where the Key should be created. Changing this forces a new resource to be created."
}

variable "key_type" {
  description = "Specifies the Key Type to use for this Key Vault Key. Changing this forces a new resource to be created."
  # EC (Elliptic Curve), EC-HSM, Oct (Octet), RSA and RSA-HSM
}

variable "key_size" {
  description = "Specifies the Size of the RSA key to create in bytes. Changing this forces a new resource to be created."
  default     = 2048
}

variable "expiration_date" {
  description = "Expiration UTC datetime (Y-m-d'T'H:M:S'Z')."
}

variable "tags" {

}

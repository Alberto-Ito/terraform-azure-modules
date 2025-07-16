variable "secret_user_name" {
  description = "The name of the secret displayed in key vault for the user name."
  default     = "adminloginname"
}

variable "secret_password_name" {
  description = "The name of the secret displayed in key vault for the password."
  default     = "holdsapasswordinKV"
}

variable "keyvault_name" {
  description = "The key vault name were the secrets will be stored."
}
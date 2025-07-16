variable "user_assigned_identity_name" {
    description = "The name of the user assigned identity. Changing this forces a new identity to be created."
}

variable "resource_group_name" {
    description = "The name of the resource group in which to create the user assigned identity."
}

variable "location" {
    description = "The location/region where the user assigned identity is created."
}

variable "tags" {
}
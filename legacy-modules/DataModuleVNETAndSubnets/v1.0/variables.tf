# TODO: Add description to variables

variable "resource_group_name" {
  type = string
}

variable "virtual_network_name" {
  type = string
}

variable "name_suffixes" {
  type    = list(string)
  default = null
}

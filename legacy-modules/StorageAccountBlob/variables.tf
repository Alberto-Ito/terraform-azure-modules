variable "storage_blob_name" {
  description = "The name of the Blob which should be created within the Storage Container."
}

variable "storage_account_name" {
  description = "The name of the Storage Account where the Blob should be created."
}

variable "storage_container_name" {
  description = "The name of the Storage Container where the Blob should be created."
}

variable "type" {
  description = "The type of the storage blob to be created. Possible values are Append, Block or Page. Changing this forces a new resource to be created."
  default     = "Block"
}

variable "access_tier" {
  description = "The access tier of the storage blob. Possible values are Archive, Cool and Hot."
  default     = "Cool"
}

variable "file_path" {
  description = "An absolute path to a file on the local system."
}

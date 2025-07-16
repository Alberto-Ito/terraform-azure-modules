variable "resource_group_name" {
  description = "The resource group name."
}

variable "azurerm_api_management_api" {
  description = "The name of the API to be imported in API Management."
}

variable "azurerm_api_management_name" {
  description = "The name of the API Management Service. Changing this forces a new resource to be created."
}

variable "revision" {
  description = "The revision number of the api."
}

variable "display_name" {
  description = "The display name of the API being imported."
}

variable "api_path" {
  description = "The api suffix of the API being imported."
  default     = ""
}

variable "protocols" {
  type        = list(string)
  description = "The directory path of the policy and other documents."
  default     = ["https"]
}

variable "import_content_format" {
  description = "The format of the content from which the API Definition should be imported. Possible values are: openapi, openapi+json, openapi+json-link, openapi-link, swagger-json, swagger-link-json, wadl-link-json, wadl-xml, wsdl and wsdl-link. Defaults to openapi."
  default     = "openapi"
}

variable "import_specs_path" {
  description = "The Content from which the API Definition should be imported. When is is_import_localFile is set to true a fully qualified local path must be mentioned, otherwise this must be a URL."
}

variable "is_import_localFile" {
  description = "When is is_import_localFile is set to true a fully qualified local path must be mentioned, otherwise this must be a URL. Defaults to false."
  default     = false
}

variable "import_policy_paths" {
  type        = list(string)
  description = "The XML Content for this Policy as a list of strings. An XML file can be used here with Terraform's file function "
  default     = []
}

variable "service_url" {
  description = "(Optional) Absolute URL of the backend service implementing this API."
  type        = string
  default     = null
}

variable "revision_description" {
  description = "(Optional) The description of the Api Revision of the API Management API."
  type        = string
  default     = null
}

variable "version_description" {
  description = "(Optional) The description of the Api Version of the API Management API."
  type        = string
  default     = null
}

variable "api_key_name" {
  description = "Specifies the name of the Application Insights API key."
}

variable "application_insights_id" {
  description = "The ID of the Application Insights component on which the API key operates."
}

# Supported values: "agentconfig", "aggregate", "api", "draft", "extendqueries", "search"

variable "read_permissions" {
  description = "Specifies the list of read permissions granted to the API key. Valid values are agentconfig, aggregate, api, draft, extendqueries, search."
  default     = []
}

# Supported values: "annotations"

variable "write_permissions" {
  description = "Specifies the list of write permissions granted to the API key. Valid values are annotations. "
  default     = []
}

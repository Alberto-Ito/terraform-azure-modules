variable "databricks_provider" {
    description = "This is the databricks alias for the workspace named that is added in Terraform."
}

# Example:
#    provider "databricks" {
#       alias = "created_workspace"
#       host  = databricks_mws_workspaces.this.workspace_url
#      }"


variable "lifetime_seconds" {
    description = "(Integer) The lifetime of the token, in seconds. If no lifetime is specified, the token remains valid indefinitely."
    default =   "8640000" # 100 day token
}

variable "comment" {
    description = "(String) Comment that will appear on the user’s settings page for this token."
    default =   "Terraform Provisioning"
}
variable "group_display_name" {
  description = "This is the display name for the given group."
  default     = "Some Group"
}

variable "allow_cluster_create" {
  description = "This is a field to allow the group to have cluster create privileges. More fine grained permissions could be assigned with databricks_permissions and cluster_id argument. Everyone without allow_cluster_create argument set, but with permission to use Cluster Policy would be able to create clusters, but within boundaries of that specific policy."
  default     = true
}

variable "allow_instance_pool_create" {
  description = "This is a field to allow the group to have instance pool create privileges. More fine grained permissions could be assigned with databricks_permissions and instance_pool_id argument."
  default     = true
}

variable "allow_sql_analytics_access" {
  description = "This is a field to allow the group to have access to SQL Analytics feature through databricks_sql_endpoint."
  default     = true
}

# Create User

variable "user_name" {
  description = "This is the username of the given user and will be their form of access and identity."
}

variable "display_name" {
  description = "This is an alias for the username that can be the full name of the user."
}

variable "allow_cluster_create" {
  description = "Allow the user to have cluster create privileges. Defaults to false. More fine grained permissions could be assigned with databricks_permissions and cluster_id argument. Everyone without allow_cluster_create argument set, but with permission to use Cluster Policy would be able to create clusters, but within boundaries of that specific policy."
  default     = false
}

variable "allow_instance_pool_create" {
  description = "Allow the user to have instance pool create privileges. Defaults to false. More fine grained permissions could be assigned with databricks_permissions and instance_pool_id argument."
  default     = false
}

variable "allow_sql_analytics_access" {
  description = "This is a field to allow the group to have access to SQL Analytics feature through databricks_sql_endpoint."
  default     = true
}

variable "active" {
  description = "Either user is active or not. True by default, but can be set to false in case of user deactivation with preserving user assets."
  default     = true
}

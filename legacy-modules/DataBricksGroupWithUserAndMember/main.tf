# Creates Group
resource "databricks_group" "create_group" {
  display_name               = var.group_display_name
  allow_cluster_create       = var.allow_cluster_create
  allow_instance_pool_create = var.allow_instance_pool_create
  allow_sql_analytics_access = var.allow_sql_analytics_access
}

# Creates User

resource "databricks_user" "create_user" {
  user_name                  = var.user_name
  display_name               = var.display_name
  allow_cluster_create       = var.allow_cluster_create
  allow_instance_pool_create = var.allow_instance_pool_create
  allow_sql_analytics_access = var.allow_sql_analytics_access
  active                     = var.active

}

# Make the user a memeber of the group

resource "databricks_group_member" "add_user_to_group" {
  group_id  = databricks_group.create_group.id
  member_id = databricks_user.create_user.id
}

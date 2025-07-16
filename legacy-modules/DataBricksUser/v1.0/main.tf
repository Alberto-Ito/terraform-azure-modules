resource "databricks_user" "create_user" {
  user_name                  = var.user_name
  display_name               = var.display_name
  allow_cluster_create       = var.allow_cluster_create
  allow_instance_pool_create = var.allow_instance_pool_create
  allow_sql_analytics_access = var.allow_sql_analytics_access
  active                     = var.active

}

resource "databricks_token" "pat" {
  provider = var.provider
  comment  = var.comment #"Terraform Provisioning"
  lifetime_seconds = var.lifetime_seconds
}
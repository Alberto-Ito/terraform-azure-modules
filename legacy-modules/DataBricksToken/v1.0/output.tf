output "id" {
  description = "Canonical unique identifier for the token."
  value     = databricks_token.pat.id
  }

output "token_value" {
    description = " Sensitive value of the newly-created token."
  value     = databricks_token.pat.token_value
  sensitive = true
}
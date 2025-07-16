output "api_key" {
  value       = azurerm_application_insights_api_key.api_key.api_key
  description = "The Application Insights Api Key"
  sensitive   = true
}

output "apim_api_diagnostic_id" {
  description = "The ID of the API Management Service API Diagnostics Logs."
  value       = azurerm_api_management_api_diagnostic.apimapidiagnostic.id
}
output "data_factory_id" {
  value       = azurerm_data_factory.factory.id
  description = "The ID of the Azure Data Factory."
}

output "data_factory_name" {
  value       = azurerm_data_factory.factory.name
  description = "The name of the Azure Data Factory."
}

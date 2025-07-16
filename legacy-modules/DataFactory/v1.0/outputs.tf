output "name" {
  description = "The name of the data factory created."
  value       = azurerm_data_factory.datafactory.name
}

output "id" {
  description = "The ID of the Data Factory."
  value       = azurerm_data_factory.datafactory.id
}
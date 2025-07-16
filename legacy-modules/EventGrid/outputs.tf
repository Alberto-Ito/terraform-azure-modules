output "id" {
  description = "Specifies the id of eventgrid"
  value       = azurerm_eventgrid_topic.eventgrid.id
}

output "name" {
  description = "Specifies the name of eventgrid"
  value       = azurerm_eventgrid_topic.eventgrid.name
}

output "endpoint" {
  description = "Specifies the endpoint of event grid"
  value       = azurerm_eventgrid_topic.eventgrid.endpoint
}

output "primarykey" {
  description = "Specifies the primary key of event grid"
  value       = azurerm_eventgrid_topic.eventgrid.primary_access_key
}

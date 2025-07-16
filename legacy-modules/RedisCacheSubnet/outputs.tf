output "id" {
  description = "The Route ID"
  value       = azurerm_redis_cache.rediscache0.id
}

output "hostname" {
  description = "The Hostname of the Redis Instance"
  value       = azurerm_redis_cache.rediscache0.hostname
}

output "ssl_port" {
  description = "The SSL Port of the Redis Instance"
  value       = azurerm_redis_cache.rediscache0.ssl_port
}

output "primary_access_key" {
  description = "The Primary Access Key for the Redis Instance"
  value       = azurerm_redis_cache.rediscache0.primary_access_key
  sensitive   = true
}

output "secondary_access_key" {
  description = "The Secondary Access Key for the Redis Instance"
  value       = azurerm_redis_cache.rediscache0.secondary_access_key
  sensitive   = true
}

output "primary_connection_string" {
  description = "The primary connection string of the Redis Instance."
  value       = azurerm_redis_cache.rediscache0.primary_connection_string
  sensitive   = true
}

# output "secondary_connection_string" {
#   description = "The secondary connection string of the Redis Instance."
#   value       = azurerm_redis_cache.rediscache0.output.secondary_connection_string
# }

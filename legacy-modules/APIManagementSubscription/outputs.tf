output "id" {
  description = "Specifies the ID of the generated Subscription for the product."
  value = azurerm_api_management_subscription.subscription.id
}

output "primary_key" {
  description = "Specifies the Primary Key of the generated Subscription for the product."
  value = azurerm_api_management_subscription.subscription.primary_key
}

output "secondary_key" {
  description = "Specifies the Secondary Key of the generated Subscription for the product."
  value = azurerm_api_management_subscription.subscription.secondary_key
}
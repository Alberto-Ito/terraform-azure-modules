output "available_subscriptions" {
  description = "Array of 'id' - 'name' subscriptions."
  value       = [for x in data.azurerm_subscriptions.available.subscriptions : { subscription_id = x.subscription_id, display_name = x.display_name }]

  # Output Example
  #   [
  #     {
  #         "display_name" = "Subs-001"
  #         "subscription_id" = "605d89e6..."
  #     },
  #     {
  #         "display_name" = "Subs-002"
  #         "subscription_id" = "41b1ff69..."
  #     }
  #   ]

  # You can 'query' this array in similar way as the other outputs (in case that you have a parametrized name).
}

output "nba_shared_001" {
  value = "" #[for x in data.azurerm_subscriptions.available.subscriptions : x.subscription_id if x.display_name == local.nba_shared_001][0]
}

output "ott_shared_001" {
  value = [for x in data.azurerm_subscriptions.available.subscriptions : x.subscription_id if x.display_name == local.ott_shared_001][0]
}

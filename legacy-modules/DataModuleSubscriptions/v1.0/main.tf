/* Find available subscriptions */

# Data retrieval for available subscriptions
data "azurerm_subscriptions" "available" {
}

locals {
  all_subscriptions          = data.azurerm_subscriptions.available.subscriptions
  has_display_name_filter    = var.display_name_filter != null
  display_name_filter        = local.has_display_name_filter ? var.display_name_filter : []
  has_subscription_id_filter = var.subscription_id_filter != null
  subscription_id_filter     = local.has_subscription_id_filter ? var.subscription_id_filter : []


  subscriptions_by_display_name = (
    { for subscription in local.all_subscriptions : subscription.display_name => subscription
      if ! local.has_display_name_filter || contains(local.display_name_filter, subscription.display_name)
    }
  )

  subscriptions_by_id = (
    { for subscription in local.all_subscriptions : subscription.subscription_id => subscription
      if ! local.has_subscription_id_filter || contains(local.subscription_id_filter, subscription.subscription_id)
    }
  )
}

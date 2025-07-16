# Subscriptions Data Module

## Example

```terraform
module "subscriptions" {
  source = "../../../../../IaC/Modules/DataModuleSubscriptions/v1.0/"
  display_name_filter = [
    var.network_hub_subscription_name
    , var.shared_services_subscription_name
  ]
}
locals {
  network_hub_subscription     = module.subscriptions.subscriptions_by_display_name[var.network_hub_subscription_name]
  shared_services_subscription = module.subscriptions.subscriptions_by_display_name[var.shared_services_subscription_name]
}
```

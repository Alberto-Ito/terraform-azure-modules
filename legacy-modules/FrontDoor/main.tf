resource "azurerm_frontdoor" "frontdoor" {
  name                                         = var.front_door_name
  location                                     = var.location
  resource_group_name                          = var.resource_group_name
  enforce_backend_pools_certificate_name_check = var.enforce_backend_pools_certificate_name_check
  tags                                         = var.tags

  routing_rule {
    name               = var.routing_rule_name
    accepted_protocols = var.routing_rule_accepted_protocols
    patterns_to_match  = var.routing_rule_patterns_to_match
    frontend_endpoints = [var.routing_rule_frontend_endpoint]

    forwarding_configuration {
      forwarding_protocol = var.routing_rule_forwarding_configuration_forwarding_protocol
      backend_pool_name   = var.backend_pool_name
      cache_enabled       = var.routing_rule_forwarding_configuration_cache_enabled
    }
  }

  backend_pool_load_balancing {
    name = var.backend_pool_load_balancing_name
  }

  backend_pool_health_probe {
    name = var.backend_pool_health_probe_name
  }

  backend_pool {
    name = var.backend_pool_name
    backend {
      host_header = var.backend_pool_backend_host_header
      address     = var.backend_pool_backend_address
      http_port   = var.backend_pool_backend_http_port
      https_port  = var.backend_pool_backend_https_port
    }

    load_balancing_name = var.backend_pool_load_balancing_name
    health_probe_name   = var.backend_pool_health_probe_name
  }

  frontend_endpoint {
    name                                    = var.routing_rule_frontend_endpoint
    host_name                               = "${var.front_door_name}.azurefd.net"
    web_application_firewall_policy_link_id = var.web_application_firewall_policy_link_id
  }

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

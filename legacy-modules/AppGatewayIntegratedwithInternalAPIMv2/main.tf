# Note: To use a certificate from a Keyvaul behind a Network it's necessary to configure a service enpoint to the keyvault
# because it is not able to resolve the private endpoint.
# https://docs.microsoft.com/en-us/azure/application-gateway/key-vault-certs#how-integration-works

# https://docs.microsoft.com/en-us/azure/api-management/api-management-howto-integrate-internal-vnet-appgateway

locals {
  frontend_port_name             = "${var.application_gateway_name}-fep"
  frontend_ip_configuration_name = "${var.application_gateway_name}-feip"
  backend_http_settings_name     = "${var.application_gateway_name}-httpbe"
  dev_backend_http_settings_name = "${var.application_gateway_name}-dev-httpbe"
  backend_address_pool_name      = "${var.application_gateway_name}-bep"
  http_listener_name             = "${var.application_gateway_name}-listener"
  url_path_map_name              = "${var.application_gateway_name}-pathmap"
}

resource "azurerm_application_gateway" "appgateway-0000" {
  name                = var.application_gateway_name
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags

  sku {
    name     = var.sku_name
    tier     = var.sku_tier
    capacity = var.sku_capacity
  }

  gateway_ip_configuration {
    name      = "${var.application_gateway_name}-gwconf"
    subnet_id = var.gateway_ip_configuration_subnet_id
  }

  frontend_port {
    name = local.frontend_port_name
    port = var.frontend_port
  }

  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = var.public_ip_address.id
  }

  backend_address_pool {
    name         = local.backend_address_pool_name
    ip_addresses = var.backend_ip_addresses
  }

  backend_http_settings {
    name                  = local.backend_http_settings_name
    cookie_based_affinity = var.cookie_based_affinity                 #"Disabled"
    path                  = var.path                                  #"/path1/"
    port                  = var.backend_http_settings_port            # 443
    protocol              = var.backend_http_settings_protocol        # "Https"
    request_timeout       = var.backend_http_settings_request_timeout # 60
    host_name             = var.backend_http_settings_host_name
    probe_name            = var.probe_name
  }

  backend_http_settings {
    name                  = local.dev_backend_http_settings_name
    cookie_based_affinity = var.cookie_based_affinity                 #"Disabled"
    path                  = var.path                                  #"/path1/"
    port                  = var.backend_http_settings_port            # 443
    protocol              = var.backend_http_settings_protocol        # "Https"
    request_timeout       = var.backend_http_settings_request_timeout # 60
    host_name             = var.backend_http_settings_dev_host_name
    probe_name            = "dev${var.probe_name}"
  }

  identity {
    type = "UserAssigned"
    identity_ids = flatten([var.identity_identity_ids])
  }

  ssl_certificate {
    name                = var.ssl_certificate.name
    key_vault_secret_id = var.ssl_certificate.secret_id # This is really the SSL ID (from KeyVault).
  }

  http_listener {
    name                           = local.http_listener_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = var.http_listener_protocol #"Http"
    ssl_certificate_name           = var.ssl_certificate.name
    host_names                     = flatten([var.public_ip_address.fqdn])
  }

  request_routing_rule {
    name                       = "${var.application_gateway_name}-reqrule"
    rule_type                  = var.rule_type
    http_listener_name         = local.http_listener_name
    backend_address_pool_name  = var.rule_type == "Basic" ? local.backend_address_pool_name : null
    backend_http_settings_name = var.rule_type == "Basic" ? local.dev_backend_http_settings_name : null
    url_path_map_name          = var.rule_type == "Basic" ? null : local.url_path_map_name
  }

  url_path_map {
    name                               = local.url_path_map_name
    default_backend_address_pool_name  = local.backend_address_pool_name
    default_backend_http_settings_name = local.backend_http_settings_name

    path_rule {
      name                       = "${var.application_gateway_name}-pathrule"
      paths                      = var.routing_rule_paths
      backend_address_pool_name  = local.backend_address_pool_name
      backend_http_settings_name = var.is_gateway_url_default_http_setting ? local.dev_backend_http_settings_name : local.backend_http_settings_name
    }
  }

  probe {
    name                                      = var.probe_name
    host                                      = var.probe_host
    interval                                  = var.probe_interval
    protocol                                  = var.probe_protocol
    path                                      = var.probe_path
    timeout                                   = var.probe_timeout
    unhealthy_threshold                       = var.probe_unhealthy_threshold
    pick_host_name_from_backend_http_settings = var.probe_pick_host_name_from_backend_http_settings
  }

  probe {

    name                                      = "dev${var.probe_name}"
    host                                      = var.probe_host
    interval                                  = var.probe_interval
    protocol                                  = var.probe_protocol
    path                                      = var.dev_probe_path
    timeout                                   = var.probe_timeout
    unhealthy_threshold                       = var.probe_unhealthy_threshold
    pick_host_name_from_backend_http_settings = var.probe_pick_host_name_from_backend_http_settings
  }

  lifecycle {
    ignore_changes = [
      tags
    ]
  }

  ssl_policy {
    policy_type          = "Custom"
    min_protocol_version = var.min_protocol_version
    cipher_suites        = var.cipher_suites
  }
}

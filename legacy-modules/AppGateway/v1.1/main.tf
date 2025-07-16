resource "azurerm_application_gateway" "appgateway" {
  name                = var.application_gateway_name
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
  zones               = var.zones

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
    name = "${var.application_gateway_name}-fep"
    port = var.frontend_port
  }

  frontend_ip_configuration {
    name                 = "${var.application_gateway_name}-feip"
    public_ip_address_id = var.public_ip_address_id
  }

  backend_address_pool {
    name         = "${var.application_gateway_name}-bep"
    ip_addresses = var.backend_ip_addresses
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

  dynamic "probe" {
    for_each = var.dev_probe_path == null ? [] : [var.dev_probe_path]
    content {
      name                                      = "dev${var.probe_name}"
      host                                      = var.probe_host
      interval                                  = var.probe_interval
      protocol                                  = var.probe_protocol
      path                                      = var.dev_probe_path
      timeout                                   = var.probe_timeout
      unhealthy_threshold                       = var.probe_unhealthy_threshold
      pick_host_name_from_backend_http_settings = var.probe_pick_host_name_from_backend_http_settings
    }
  }

  backend_http_settings {
    name                  = "${var.application_gateway_name}-httpbe"
    cookie_based_affinity = var.cookie_based_affinity                 #"Disabled"
    path                  = var.path                                  #"/path1/"
    port                  = var.backend_http_settings_port            #80
    protocol              = var.backend_http_settings_protocol        #"Http"
    request_timeout       = var.backend_http_settings_request_timeout #60
    host_name             = var.backend_http_settings_host_name
    probe_name            = var.probe_name
  }

  dynamic "backend_http_settings" {
    for_each = var.backend_http_settings_dev_host_name == null ? [] : [var.backend_http_settings_dev_host_name]
    content {
      name                  = "${var.application_gateway_name}-dev-httpbe"
      cookie_based_affinity = var.cookie_based_affinity                 #"Disabled"
      path                  = var.path                                  #"/path1/"
      port                  = var.backend_http_settings_port            #80
      protocol              = var.backend_http_settings_protocol        #"Http"
      request_timeout       = var.backend_http_settings_request_timeout #60
      host_name             = var.backend_http_settings_dev_host_name
      probe_name            = "dev${var.probe_name}"
    }
  }

  http_listener {
    name                           = "${var.application_gateway_name}-listener"
    frontend_ip_configuration_name = "${var.application_gateway_name}-feip"
    frontend_port_name             = "${var.application_gateway_name}-fep"
    protocol                       = var.http_listener_protocol #"Http"
    ssl_certificate_name           = var.ssl_certificate_name
    host_name                      = var.rule_type == "Basic" ? "" : "${var.public_ip_address_name}"
  }

  # redirect_configuration {
  #   name                 = "${var.application_gateway_name}-redirect"
  #   redirect_type        = var.redirect_type
  #   include_path         = var.redirect_include_path
  #   include_query_string = var.include_query_string
  # }

  request_routing_rule {
    name                       = "${var.application_gateway_name}-route"
    rule_type                  = var.rule_type
    http_listener_name         = "${var.application_gateway_name}-listener"
    backend_address_pool_name  = var.rule_type == "Basic" ? "${var.application_gateway_name}-bep" : ""
    backend_http_settings_name = var.rule_type == "Basic" ? "${var.application_gateway_name}-httpbe" : ""
    url_path_map_name          = var.rule_type == "Basic" ? "" : "${var.application_gateway_name}-route"
  }

  dynamic "identity" {
    for_each = var.managed_identity_id == null ? [] : [var.managed_identity_id]
    content {
      identity_ids = [var.managed_identity_id]
    }
  }

  dynamic "ssl_certificate" {
    for_each = var.ssl_certificate_name == null ? [] : [var.ssl_certificate_name]
    content {
      name                = var.ssl_certificate_name
      key_vault_secret_id = var.ssl_certificate_id # This is really the SSL ID.
    }
  }

  url_path_map {
    name                               = "${var.application_gateway_name}-route"
    default_backend_address_pool_name  = "${var.application_gateway_name}-bep"
    default_backend_http_settings_name = var.is_gateway_url_default_http_setting ? "${var.application_gateway_name}-httpbe" : "${var.application_gateway_name}-dev-httpbe"

    path_rule {
      name                       = var.is_gateway_url_default_http_setting ? "${var.application_gateway_name}-dev-route" : "${var.application_gateway_name}-webapi-route"
      paths                      = var.routing_rule_paths
      backend_address_pool_name  = "${var.application_gateway_name}-bep"
      backend_http_settings_name = var.is_gateway_url_default_http_setting ? "${var.application_gateway_name}-dev-httpbe" : "${var.application_gateway_name}-httpbe"
    }
  }

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

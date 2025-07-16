resource "azurerm_application_gateway" "appgateway" {
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

  backend_http_settings {
    name                  = "${var.application_gateway_name}-httpbe"
    cookie_based_affinity = var.cookie_based_affinity                 #"Disabled"
    path                  = var.path                                  #"/path1/"
    port                  = var.backend_http_settings_port            #80
    protocol              = var.backend_http_settings_protocol        #"Http"
    request_timeout       = var.backend_http_settings_request_timeout #60
  }

  http_listener {
    name                           = "${var.application_gateway_name}-listener"
    frontend_ip_configuration_name = "${var.application_gateway_name}-feip"
    frontend_port_name             = "${var.application_gateway_name}-fep"
    protocol                       = var.http_listener_protocol #"Http"
  }

  # redirect_configuration {
  #   name                 = "${var.application_gateway_name}-redirect"
  #   redirect_type        = var.redirect_type
  #   include_path         = var.redirect_include_path
  #   include_query_string = var.include_query_string
  # }

  request_routing_rule {
    name                        = "${var.application_gateway_name}-route"
    rule_type                   = var.rule_type #"Basic"
    http_listener_name          = "${var.application_gateway_name}-listener"
    backend_address_pool_name  = "${var.application_gateway_name}-bep"
    backend_http_settings_name = "${var.application_gateway_name}-httpbe"
  }

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

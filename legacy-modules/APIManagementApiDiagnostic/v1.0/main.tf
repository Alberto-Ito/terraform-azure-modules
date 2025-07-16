# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_diagnostic

resource "azurerm_api_management_api_diagnostic" "apimapidiagnostic" {
  identifier               = var.identifier
  resource_group_name      = var.resource_group_name
  api_management_name      = var.api_management_name
  api_management_logger_id = var.api_management_logger_id
  api_name                 = var.api_name

  sampling_percentage       = var.sampling_percentage
  always_log_errors         = var.always_log_errors
  log_client_ip             = var.log_client_ip
  verbosity                 = var.verbosity
  http_correlation_protocol = var.http_correlation_protocol

  dynamic "frontend_request" {
    for_each = { key = "value" }
    content {
      body_bytes     = var.frontend_request.body_bytes
      headers_to_log = var.frontend_request.headers_to_log
    }
  }

  dynamic "frontend_response" {
    for_each = { key = "value" }
    content {
      body_bytes     = var.frontend_response.body_bytes
      headers_to_log = var.frontend_response.headers_to_log
    }
  }

  dynamic "backend_request" {
    for_each = { key = "value" }
    content {
      body_bytes     = var.backend_request.body_bytes
      headers_to_log = var.backend_request.headers_to_log
    }
  }

  dynamic "backend_response" {
    for_each = { key = "value" }
    content {
      body_bytes     = var.backend_response.body_bytes
      headers_to_log = var.backend_response.headers_to_log
    }
  }
}

# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_logger

resource "azurerm_api_management_logger" "apimlogger" {
  name                = var.name
  api_management_name = var.api_management_name
  resource_group_name = var.resource_group_name
  resource_id         = var.application_insights_id
  description         = var.description

  application_insights {
    instrumentation_key = var.application_insights_instrumentation_key
  }
}

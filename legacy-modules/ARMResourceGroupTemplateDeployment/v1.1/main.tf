resource "azurerm_resource_group_template_deployment" "armrtemplatedeployment" {
  name                = var.azurerm_resource_group_template_deployment_name
  resource_group_name = var.resource_group_name
  deployment_mode     = var.deployment_mode
  template_content    = var.template_content
  tags                = var.tags
  parameters_content  = var.parameters_content
  lifecycle {
    ignore_changes = [
      tags, parameters_content,template_content
    ]
  }
}
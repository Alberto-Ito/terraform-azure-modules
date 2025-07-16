output "output_content" {
    description = "The JSON Content of the Outputs of the ARM Template Deployment."
    value       = azurerm_resource_group_template_deployment.armrtemplatedeployment.output_content
}
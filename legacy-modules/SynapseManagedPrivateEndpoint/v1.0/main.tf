resource "azurerm_synapse_managed_private_endpoint" "synapsemanagedprivateendpoint0" {
  name                 = var.synapse_managed_private_endpoint_name
  synapse_workspace_id = var.synapse_workspace_id
  target_resource_id   = var.target_resource_id
  subresource_name     = var.subresource_name # "blob"

  # depends_on = [azurerm_synapse_firewall_rule.example]
}
resource "azurerm_synapse_firewall_rule" "synapsefirewallrule0" {
  name                 = var.synapse_firewall_rule_name
  synapse_workspace_id = var.synapse_workspace_id
  start_ip_address     = var.start_ip_address
  end_ip_address       = var.end_ip_address #"255.255.255.255"
}
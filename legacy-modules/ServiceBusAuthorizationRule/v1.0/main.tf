resource "azurerm_servicebus_namespace_authorization_rule" "authorization_rule" {
  name                = var.name
  namespace_name      = var.namespace_name
  resource_group_name = var.resource_group_name
  listen              = var.listen
  send                = var.send
  manage              = var.manage
}

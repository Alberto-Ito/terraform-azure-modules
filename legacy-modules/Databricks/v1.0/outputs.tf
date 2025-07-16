output "id" {
    description = "The ID of the Databricks Workspace in the Azure management plane."
   value = azurerm_databricks_workspace.databricks.id
}

output "managed_resource_group_id" {
    description = "The ID of the Managed Resource Group created by the Databricks Workspace."
    value = azurerm_databricks_workspace.databricks.managed_resource_group_id
}

output "workspace_url" {
    description = "The workspace URL which is of the format 'adb-{workspaceId}.{random}.azuredatabricks.net'"
    value = azurerm_databricks_workspace.databricks.workspace_url
}

output "workspace_id" {
    description = "The unique identifier of the databricks workspace in Databricks control plane."
    value = azurerm_databricks_workspace.databricks.workspace_id
}
terraform {
  required_version = ">= 1.7.2"
  required_providers {
    azapi = {
      source  = "azure/azapi"
      version = "~> 2.2"
    }
  }
}

locals {
  postgres_connection_string = "Host=${var.postgres_fqdns[0]};Port=5432;Database=${var.postgres_db_name};Uid=${var.postgres_admin};Pwd=${var.postgres_admin_password};SslMode=Require;Trust Server Certificate=true"
  connection_string_hash     = sha256(local.postgres_connection_string)
  all_managed_pe_storages    = concat(var.storages_within_sub_managed_pe, var.storage_out_sub_managed_pe)
}

resource "azurerm_data_factory" "factory" {
  name                            = var.name
  location                        = var.location
  resource_group_name             = var.resource_group_name
  managed_virtual_network_enabled = var.enable_managed_virtual_network
  identity {
    type         = "UserAssigned"
    identity_ids = [var.identity_id]
  }

  tags = var.tags
}

resource "azurerm_data_factory_integration_runtime_azure" "managed_vnet_ir" {
  name                    = "managed-ir"
  data_factory_id         = azurerm_data_factory.factory.id
  location                = var.location
  virtual_network_enabled = true
  time_to_live_min        = 5
  core_count              = 32
}

resource "azurerm_data_factory_integration_runtime_azure" "large_managed_vnet_ir" {
  name                    = "managed-ir-large"
  data_factory_id         = azurerm_data_factory.factory.id
  location                = var.location
  virtual_network_enabled = true
  time_to_live_min        = 5
  cleanup_enabled         = false
  compute_type            = "MemoryOptimized"
  core_count              = 32
}

# Managed private endpoints
resource "azurerm_data_factory_managed_private_endpoint" "postgres_via_pls" {
  name               = "postgres-via-pls"
  data_factory_id    = azurerm_data_factory.factory.id
  target_resource_id = var.private_link_service_id
  fqdns              = var.postgres_fqdns
}

resource "azurerm_data_factory_managed_private_endpoint" "storage_within_current_sub_via_pe" {
  for_each = { for ep in var.storages_within_sub_managed_pe : ep.name => ep }

  name               = each.value.name
  data_factory_id    = azurerm_data_factory.factory.id
  target_resource_id = each.value.target_resource_id
  subresource_name   = "dfs"
}

resource "azurerm_data_factory_managed_private_endpoint" "storage_out_current_sub_via_pe" {
  for_each = { for ep in var.storage_out_sub_managed_pe : ep.name => ep }

  name               = each.value.name
  data_factory_id    = azurerm_data_factory.factory.id
  target_resource_id = each.value.target_resource_id
  subresource_name   = "dfs"
}

# Approvals 
resource "null_resource" "approve_postgres_managed_pe" {
  provisioner "local-exec" {
    command     = "az login --service-principal -u ${var.client_id} -p ${var.client_secret} --tenant ${var.tenant_id} && az account set --subscription ${var.subscription_id} && id=$(az network private-endpoint-connection list --resource-group ${var.resource_group_name} --name ${var.private_link_service_name} --type Microsoft.Network/privateLinkServices --query \"[?properties.privateLinkServiceConnectionState.status=='Pending' && contains(properties.privateEndpoint.id, '${azurerm_data_factory_managed_private_endpoint.postgres_via_pls.name}') && contains(properties.privateEndpoint.id, '${azurerm_data_factory.factory.name}')].id\" -o tsv) && if [ ! -z \"$id\" ]; then echo \"Approving PE connection: $id\"; az network private-endpoint-connection approve --id \"$id\"; else echo \"No pending PE connections.\"; fi"
    interpreter = ["/bin/bash", "-c"]
  }

  triggers = {
    cluster_instance_ids = join("-", [
      azurerm_data_factory_managed_private_endpoint.postgres_via_pls.name,
      azurerm_data_factory_managed_private_endpoint.postgres_via_pls.data_factory_id,
      azurerm_data_factory_managed_private_endpoint.postgres_via_pls.target_resource_id,
      join(",", azurerm_data_factory_managed_private_endpoint.postgres_via_pls.fqdns)
    ])
  }

  depends_on = [azurerm_data_factory_managed_private_endpoint.postgres_via_pls]
}

resource "null_resource" "approve_storage_within_sub_managed_pe" {
  for_each = { for ep in var.storages_within_sub_managed_pe : ep.name => ep }

  provisioner "local-exec" {
    command = "az login --service-principal -u ${var.client_id} -p ${var.client_secret} --tenant ${var.tenant_id} && az account set --subscription ${var.subscription_id} && id=$(az network private-endpoint-connection list --resource-group ${var.resource_group_name} --name ${each.value.storage_account_name} --type Microsoft.Storage/storageAccounts --query \"[?properties.privateLinkServiceConnectionState.status=='Pending' && contains(properties.privateEndpoint.id, '${each.value.name}') && contains(properties.privateEndpoint.id, '${azurerm_data_factory.factory.name}')].id\" -o tsv) && if [ ! -z \"$id\" ]; then echo \"Approving PE connection: $id\"; az network private-endpoint-connection approve --id \"$id\"; else echo \"No matching pending PE connections.\"; fi"

    interpreter = ["/bin/bash", "-c"]
  }

  triggers = {
    cluster_instance_ids = join("-", [
      azurerm_data_factory_managed_private_endpoint.storage_within_current_sub_via_pe[each.key].name,
      azurerm_data_factory_managed_private_endpoint.storage_within_current_sub_via_pe[each.key].data_factory_id,
      azurerm_data_factory_managed_private_endpoint.storage_within_current_sub_via_pe[each.key].target_resource_id
    ])
  }

  depends_on = [azurerm_data_factory_managed_private_endpoint.storage_within_current_sub_via_pe]
}

resource "null_resource" "approve_storage_out_sub_managed_pe" {
  for_each = { for ep in var.storage_out_sub_managed_pe : ep.name => ep }

  provisioner "local-exec" {
    command     = "az login --service-principal -u ${var.client_id} -p ${var.client_secret} --tenant ${var.tenant_id} && id=$(az network private-endpoint-connection list --id ${each.value.target_resource_id} --query \"[?properties.privateLinkServiceConnectionState.status=='Pending' && contains(properties.privateEndpoint.id, '${each.value.name}') && contains(properties.privateEndpoint.id, '${azurerm_data_factory.factory.name}')].id\" -o tsv) && if [ ! -z \"$id\" ]; then echo \"Approving PE connection: $id\"; az network private-endpoint-connection approve --id \"$id\"; else echo \"No matching pending PE connections.\"; fi"
    interpreter = ["/bin/bash", "-c"]
  }

  triggers = {
    cluster_instance_ids = join("-", [
      azurerm_data_factory_managed_private_endpoint.storage_out_current_sub_via_pe[each.key].name,
      azurerm_data_factory_managed_private_endpoint.storage_out_current_sub_via_pe[each.key].data_factory_id,
      azurerm_data_factory_managed_private_endpoint.storage_out_current_sub_via_pe[each.key].target_resource_id
    ])
  }

  depends_on = [
    azurerm_data_factory_managed_private_endpoint.storage_out_current_sub_via_pe
  ]
}

# Linked Services
resource "azapi_resource" "postgresql_linked_service" {
  type      = "Microsoft.DataFactory/factories/linkedservices@2018-06-01"
  name      = "postgresqlLinkedService_${substr(local.connection_string_hash, 0, 8)}"
  parent_id = azurerm_data_factory.factory.id

  body = {
    properties = {
      type = "AzurePostgreSql"

      connectVia = {
        referenceName = azurerm_data_factory_integration_runtime_azure.managed_vnet_ir.name
        type          = "IntegrationRuntimeReference"
      }

      typeProperties = {
        connectionString = local.postgres_connection_string
      }
    }
  }

  lifecycle {
    ignore_changes = [
      body.properties.typeProperties
    ]
  }

  depends_on = [azurerm_data_factory.factory]
}

resource "azurerm_data_factory_linked_service_data_lake_storage_gen2" "storage_linked_service" {
  for_each = { for ep in local.all_managed_pe_storages : ep.name => ep }

  name                     = "${each.value.storage_account_name}LinkedService"
  integration_runtime_name = azurerm_data_factory_integration_runtime_azure.managed_vnet_ir.name
  data_factory_id          = azurerm_data_factory.factory.id
  service_principal_id     = var.client_id
  service_principal_key    = var.client_secret
  tenant                   = var.tenant_id
  url                      = "https://${each.value.storage_account_name}.dfs.core.windows.net"
}

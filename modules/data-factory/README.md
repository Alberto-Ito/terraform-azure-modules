# Azure Data Factory module

This module deploys an Azure Data Factory instance with a user-assigned managed identity, managed virtual network integration runtimes, managed private endpoints, and linked services for PostgreSQL and Azure Data Lake Storage Gen2.

## Resources created

| Resource | Purpose |
| --- | --- |
| `azurerm_data_factory.factory` | Azure Data Factory instance with a user-assigned managed identity. |
| `azurerm_data_factory_integration_runtime_azure.managed_vnet_ir` | Default managed virtual network Azure integration runtime. |
| `azurerm_data_factory_integration_runtime_azure.large_managed_vnet_ir` | Memory-optimized managed virtual network Azure integration runtime. |
| `azurerm_data_factory_managed_private_endpoint.postgres_via_pls` | Managed private endpoint to PostgreSQL through a Private Link Service. |
| `azurerm_data_factory_managed_private_endpoint.storage_within_current_sub_via_pe` | Managed private endpoints to Storage accounts in the current subscription. |
| `azurerm_data_factory_managed_private_endpoint.storage_out_current_sub_via_pe` | Managed private endpoints to Storage accounts outside the current subscription. |
| `null_resource.approve_postgres_managed_pe` | Azure CLI approval for the PostgreSQL managed private endpoint connection. |
| `null_resource.approve_storage_within_sub_managed_pe` | Azure CLI approval for Storage managed private endpoint connections in the current subscription. |
| `null_resource.approve_storage_out_sub_managed_pe` | Azure CLI approval for Storage managed private endpoint connections outside the current subscription. |
| `azapi_resource.postgresql_linked_service` | Azure Data Factory linked service for PostgreSQL. |
| `azurerm_data_factory_linked_service_data_lake_storage_gen2.storage_linked_service` | Azure Data Factory linked services for ADLS Gen2 Storage accounts. |

## Requirements

| Name | Version |
| --- | --- |
| Terraform | `>= 1.7.2` |
| azapi | `~> 2.2` |

> The module also uses AzureRM resources, the `null_resource` provider, and Azure CLI commands from local-exec provisioners. Configure those providers in the calling stack and ensure `az` is available in the execution environment.

## Inputs

| Name | Description | Type | Default | Required |
| --- | --- | --- | --- | --- |
| `name` | The Data Factory name. | `string` | n/a | yes |
| `identity_id` | The user-assigned managed identity ID used by Azure Data Factory. | `string` | n/a | yes |
| `location` | The Azure region where the resources will be deployed. | `string` | n/a | yes |
| `resource_group_name` | The resource group name. | `string` | n/a | yes |
| `enable_managed_virtual_network` | Indicates whether to enable the Managed Virtual Network for Azure Data Factory. | `bool` | `true` | no |
| `postgres_db_name` | The name of the PostgreSQL database. | `string` | n/a | yes |
| `postgres_admin` | The PostgreSQL admin username. | `string` | n/a | yes |
| `postgres_admin_password` | The PostgreSQL admin password. | `string` | n/a | yes |
| `private_link_service_id` | The ID of the Private Link Service. | `string` | n/a | yes |
| `private_link_service_name` | The name of the Private Link Service. | `string` | n/a | yes |
| `postgres_fqdns` | List of fully qualified domain names used by Data Factory to validate the Managed Private Endpoint connection to PostgreSQL. | `list(string)` | `[]` | no |
| `storages_within_sub_managed_pe` | Storage account managed private endpoints to create and approve in the current subscription. | <pre>list(object({<br>  name                 = string<br>  storage_account_name = string<br>  target_resource_id   = string<br>}))</pre> | n/a | yes |
| `storage_out_sub_managed_pe` | Storage account managed private endpoints to create and approve outside the current subscription. | <pre>list(object({<br>  name                 = string<br>  storage_account_name = string<br>  target_resource_id   = string<br>}))</pre> | `[]` | no |
| `client_id` | The Client ID of the Azure Service Principal. | `string` | n/a | yes |
| `client_secret` | The Client Secret of the Azure Service Principal. | `string` | n/a | yes |
| `tenant_id` | The Tenant ID associated with the Azure Service Principal. | `string` | n/a | yes |
| `subscription_id` | The Azure subscription ID. | `string` | n/a | yes |
| `tags` | Map of tags to apply to the Data Factory resource. | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
| --- | --- |
| `data_factory_id` | The ID of the Azure Data Factory. |
| `data_factory_name` | The name of the Azure Data Factory. |

## Example

```hcl
module "data_factory" {
  source = "./modules/data-factory"

  name                = "adf-example-dev"
  location            = "eastus"
  resource_group_name = "rg-example-dev"
  identity_id         = azurerm_user_assigned_identity.data_factory.id

  postgres_db_name          = "appdb"
  postgres_admin            = var.postgres_admin
  postgres_admin_password   = var.postgres_admin_password
  private_link_service_id   = azurerm_private_link_service.postgres.id
  private_link_service_name = azurerm_private_link_service.postgres.name
  postgres_fqdns            = ["postgres.example.privatelink.postgres.database.azure.com"]

  storages_within_sub_managed_pe = [
    {
      name                 = "adls-current"
      storage_account_name = "stadfcurrentdev"
      target_resource_id   = azurerm_storage_account.current.id
    }
  ]

  storage_out_sub_managed_pe = []

  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id

  tags = {
    environment = "dev"
    workload    = "data-platform"
  }
}
```

## Operational notes

- `postgres_fqdns` must contain at least one FQDN because the PostgreSQL connection string uses the first list item.
- The service principal must be allowed to approve Private Endpoint connections for the Private Link Service and Storage accounts.
- `client_secret` and `postgres_admin_password` are sensitive values. Pass them through secure variables or a secret store in the calling stack.

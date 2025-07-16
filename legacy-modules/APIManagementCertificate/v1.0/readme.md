# APIM Management Certificate

[Resource Documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_certificate)

**Notes:**

- Either `data` or `key_vault_secret_id` must be specified - but not both.
- To use `key_vault_secret_id` the *identity* block needs to be specified in API Management Service, since this identity is used to retrieve the Key Vault Certificate.
- If `key_vault_identity_client_id` isn't specified will use *System Assigned identity* of the API Management Service.

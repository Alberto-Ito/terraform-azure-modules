# APIM Management Named Value

[Resource Documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_named_value)

**Notes:**

- `name` may only contain alphanumeric characters and dashes up to 80 characters in length
- Setting the field `secret` to *true* doesn't make this field sensitive in Terraform, instead it marks the value as secret and encrypts the value in Azure.
- Either `value` or `value_from_key_vault` must be specified - but not both.
- If `value_from_key_vault` is specified then `secret` must be *true*.
- If `value_from_key_vault.identity_client_id` isn't specified will use *System Assigned identity* of the API Management Service.
- `tags` refers to API Tags, not to resource's tags.

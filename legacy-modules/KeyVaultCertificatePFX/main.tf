data "azurerm_client_config" "current" {}

resource "azurerm_key_vault_certificate" "example" {
  name         = var.azurerm_key_vault_name
  key_vault_id = var.azurerm_key_vault_certificate_id

  certificate {
    contents = var.certificate_contents
    password = var.certificate_password
  }

  certificate_policy {
    issuer_parameters {
      name = var.certificate_policy_issuer_parameters_name
    }

    key_properties {
      exportable = var.key_properties_exportable
      key_size   = var.key_property_key_size
      key_type   = var.key_properties_key_type
      reuse_key  = var.key_properties_reusable
    }

    secret_properties {
      content_type = var.secret_properties_content_type
    }
  }
}
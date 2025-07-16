// Terraform Script Copy Certificate from datasource Key Vault to new Key Vault
// https://stackoverflow.com/a/63689293/13371688

locals {
  issuer_parameters_name = var.is_self_signed ? "Self" : var.source_certificate.certificate_policy.0.issuer_parameters.0.name
}

resource "azurerm_key_vault_certificate" "certificate" {
  name         = var.source_certificate.name
  key_vault_id = var.target_key_vault_id
  tags         = var.tags

  certificate {
    contents = var.source_secret.value
  }

  certificate_policy {
    issuer_parameters {
      name = local.issuer_parameters_name // "self" instead using original issuer use self
    }

    key_properties {
      exportable = true
      key_size   = var.source_certificate.certificate_policy.0.key_properties.0.key_size
      key_type   = var.source_certificate.certificate_policy.0.key_properties.0.key_type
      reuse_key  = true
    }

    secret_properties {
      content_type = var.source_certificate.certificate_policy.0.secret_properties.0.content_type // "application/x-pkcs12"
    }
  }

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

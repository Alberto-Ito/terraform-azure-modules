resource "azurerm_key_vault_certificate" "certificate" {
  name         = var.certificate_name
  key_vault_id = var.key_vault_id
  tags         = var.tags

  certificate_policy {
    issuer_parameters {
      name = var.certificate_policy_issuer_parameters_name
    }

    key_properties {
      exportable = var.key_properties_exportable
      key_size   = var.key_properties_key_size
      key_type   = var.key_properties_key_type
      reuse_key  = var.key_properties_reuse_key
    }

    lifetime_action {
      action {
        action_type = var.lifetime_action_action_type
      }

      trigger {
        days_before_expiry = var.lifetime_action_trigger_days_before_expiry
      }
    }

    secret_properties {
      content_type = var.secret_properties_content_type
    }

    x509_certificate_properties {

      extended_key_usage = var.x509_certificate_properties_extended_key_usage

      key_usage = var.x509_certificate_properties_key_usage

      subject_alternative_names {
        dns_names = var.x509_certificate_properties_subject_alternative_names_dns_names
      }

      subject            = var.x509_certificate_properties_subject
      validity_in_months = var.x509_certificate_properties_validity_in_months
    }
  }

  lifecycle {
    ignore_changes = [
      tags
    ]
  }  
}

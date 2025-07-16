locals {
  expiration_date = (
    var.expiration_date == null
    ? timeadd("${formatdate("YYYY-MM-DD", timestamp())}T00:00:00Z", "2160h")
    : var.expiration_date
  )
}

resource "azurerm_key_vault_secret" "secret" {
  name            = var.secret_name
  value           = var.secret_value
  key_vault_id    = var.key_vault_id
  content_type    = var.content_type
  expiration_date = local.expiration_date
  tags            = var.tags

  lifecycle {
    ignore_changes = [
      tags["ResourceID"],
      tags["CredentialID"],
      content_type,
      expiration_date
    ]
  }
}
